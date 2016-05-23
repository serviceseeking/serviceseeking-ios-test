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


- (void)GETPath:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(HTTPRequestCompletionBlock)completionHandler {
    
    self.apiRequest.HTTPMethod = @"GET";
    NSMutableString *URLString = [[NSMutableString alloc] initWithFormat:@"%@%@", URL_STAGING, path];

    if (parameters.count) {
        [URLString appendFormat:@"?%@", [parameters urlEncodedString]];
    } else {
        self.apiRequest.HTTPBody = [parameters toData];
    }
    self.apiRequest.URL = [NSURL URLWithString:URLString];
    [self startTaskWithCompletionHandler:completionHandler];
}

- (void)POSTPath:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(HTTPRequestCompletionBlock)completionHandler {
    
    self.apiRequest.HTTPMethod = @"POST";
    parameters.count ? self.apiRequest.HTTPBody = [parameters toData]: nil;
    self.apiRequest.URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", URL_STAGING, path]];
    [self startTaskWithCompletionHandler:completionHandler];
}

- (void)startTaskWithCompletionHandler:(HTTPRequestCompletionBlock)completionHandler {
    [[[NSURLSession sharedSession] dataTaskWithRequest:self.apiRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data == nil) {
#if PRINT_RESPONSE == 1
            NSLog(@"\nURL: %@ \nMETHOD: %@ \nERROR: %@",
                  self.apiRequest.URL, self.apiRequest.HTTPMethod, error);
#endif
            completionHandler(nil);
        } else {
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
#if PRINT_RESPONSE == 1
            NSLog(@"\nURL: %@ \nMETHOD: %@ \nRESPONSE: %@",
                  self.apiRequest.URL, self.apiRequest.HTTPMethod, responseDictionary);
#endif
            completionHandler(responseDictionary);
        }
    }] resume];
}

#pragma mark - Private methods

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
