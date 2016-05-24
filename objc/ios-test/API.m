//
//  API.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "API.h"

#import "Config.h"
#import "Keys.h"
#import "NSDictionary+Helper.h"

static NSString * const HTTPHeaderAccept = @"application/vnd.api+json; version=1";
static NSString * const HTTPHeaderAuthorization = @"Basic c3NzdGFnaW5nOnNzVDNzdDFuZyE=";
static NSString * const HTTPHeaderContentType = @"application/vnd.api+json";

static API *sharedClient;

@interface API ()

@property (strong, nonatomic) NSMutableURLRequest *apiRequest;

@end

@implementation API

+ (instancetype)sharedClient {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[API alloc] init];
        sharedClient.apiRequest = [[NSMutableURLRequest alloc] init];
        [sharedClient setRequestHeaders];
    });
    
    return sharedClient;
}


#pragma mark - GET

- (void)GETPath:(NSString *)path
      parameter:(id)parameter
   successBlock:(NetworkCallSuccessBlock)successBlock
      failBlock:(NetworkCallFailBlock)failBlock {

    self.apiRequest.HTTPMethod = @"GET";
    self.apiRequest.HTTPBody = nil;
    
    NSMutableString *URLString = [[NSMutableString alloc] initWithFormat:@"%@%@", URL_STAGING, path];

    if ([parameter isKindOfClass:[NSDictionary class]]) {
         NSDictionary *parameters = [[NSDictionary alloc] initWithDictionary:parameter];
        if (parameters.count) {
            [URLString appendFormat:@"?%@", [parameters urlEncodedString]];
        }
    }
    else if ([parameter isKindOfClass:[NSNumber class]]) {
        NSNumber *ID = parameter;
        [URLString appendFormat:@"/%@", ID];
    }
    self.apiRequest.URL = [NSURL URLWithString:URLString];
    [self startTaskWithSuccessBlock:successBlock failBlock:failBlock];
}

#pragma mark - POST

- (void)POSTPath:(NSString *)path
      parameters:(NSDictionary *)parameters
    successBlock:(NetworkCallSuccessBlock)successBlock
    failBlock:(NetworkCallFailBlock)failBlock {
    
    self.apiRequest.HTTPMethod = @"POST";
    parameters.count ? self.apiRequest.HTTPBody = [parameters toData]: nil;
    self.apiRequest.URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", URL_STAGING, path]];
    [self startTaskWithSuccessBlock:successBlock failBlock:failBlock];
}

#pragma mark - Start task

- (void)startTaskWithSuccessBlock:(NetworkCallSuccessBlock)successBlock failBlock:(NetworkCallFailBlock)failBlock {
    [[[NSURLSession sharedSession] dataTaskWithRequest:self.apiRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *responseDictionary = [[NSDictionary alloc] init];
        
        if (data == nil) {
            failBlock(nil, error);
        } else {
            responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (responseDictionary[kErrors] && responseDictionary[kErrors][0]) {
                APIError *error = [[APIError alloc] initWithDataWithDictionary:responseDictionary[kErrors][0]];
                failBlock(error, nil);
            }
            else {
                successBlock(responseDictionary);
            }
        }
#if PRINT_RESPONSE == 1
        NSLog(@"\nURL: %@ \nMETHOD: %@ \nRESPONSE: %@ \nERROR: %@", self.apiRequest.URL, self.apiRequest.HTTPMethod, responseDictionary, error);
#endif
        
    }] resume];
}

#pragma mark - Set header values

- (void)setRequestHeaders {
    [self.apiRequest addValue:HTTPHeaderAccept forHTTPHeaderField:@"Accept"];
    [self.apiRequest addValue:HTTPHeaderAuthorization forHTTPHeaderField:@"Authorization"];
    [self.apiRequest addValue:HTTPHeaderContentType forHTTPHeaderField:@"Content-Type"];
    
}

#pragma mark - Token Handler

- (NSString *)extractTokenFromDictionary:(NSDictionary *)dict {
    if (dict && dict[kMeta][kToken]) {
        return dict[kMeta][kToken];
    }
    return nil;
}

- (void)includeToken:(NSString *)token {
    [self.apiRequest setValue:[NSString stringWithFormat:@"%@, Token token=%@", HTTPHeaderAuthorization, token] forHTTPHeaderField:@"Authorization"];
}

@end
