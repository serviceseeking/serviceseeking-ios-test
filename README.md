## Task
    Build a leads app

## Use Cases
    As a user when I open the app the first page is login, i should be able to:

    - login
    - view leads list
    - view lead details

**As a user**, when I "login" there should be a indication of login in or sign in.  
**As a user**, when Im in the leads list, the list should display the ff. “username” and “name” in each cell.  
**As a user**, when clicking the table cell I should "navigate" to the lead detail.  
**As a user**, upon viewing the lead detail i should see the “username”, “name”, “description” and “suburbName”.  

## What are we looking for 
    The purpose of this test is to determine the depth of your knowledge on the ff.
1. **Coding Style**
2. **OOP**
3. **Use of Libraries** (if necessary) - you can use “cocoapods“

## Your aim
To develop this app and be able to express the above points, and the opportunity to present yourself how you can develop app in you own way. You can develop outside the box and outside the use-case.

## Timing
You have a maximum of 3 days to build this app

## Test Submission
1. Fork this repo.
2. Pull your version and write theyour code.
3. When the code is completed, submit a pull request against our Service Seeking's version.
4. We will review your code and will get in touch with you after that.

# API DOCUMENTATION
## SIGN IN
### Request:
**Url :** <https://staging.serviceseeking.com.au/users/sign_in>  
**Method :** "POST"  
**Headers :**     
• Accept: application/vnd.api+json; version=1  
• Content-Type: application/vnd.api+json

**Sample Request Body :**  
```  
{  
  "data": {  
    "type": "user_sessions",  
    "attributes": {  
      "email": "test_business@serviceseeking.com.au",  
      "password": "123123"  
    }  
  }  
}  
```   

### Response:
**Status :**  ``201``  
**Headers :**  
• Content-Type: application/vnd.api+json  
**Sample Response Body :**  
```{
	"data": {
		"id": "13",
		"type": "users",
		"links": {
			"self": "https://api.serviceseeking.com.au/users/13"
		},
		"attributes": {
			"name": "Test Business",
			"email": "test_business@serviceseeking.com.au",
			"status": "active",
			"phone": "+61 412 345 678",
			"createdAt": "2016-02-04T21:20:40+11:00",
			"updatedAt": "2016-02-04T21:20:41+11:00"
		},
		"relationships": {
			"business": {
				"links": {
					"related": "https://api.serviceseeking.com.au/users/13/business"
				},
				"data": {
					"type": "businesses",
					"id": "5"
				}
			}
		}
	},
	"links": {
		"self": "https://api.serviceseeking.com.au/users/sign_in"
	},
	"meta": {
		"token": "1234567890-abcdefghijk"
	},
	"included": [{
		"id": "5",
		"type": "businesses",
		"links": {
			"self": "https://api.serviceseeking.com.au/businesses/5"
		},
		"attributes": {
			"name": "ServiceSeeking Business",
			"number": null,
			"phone": "0299999999",
			"description": "ServiceSeeking business description",
			"mobilePhone": "0404040404",
			"faxNumber": null,
			"address": null,
			"websiteUrl": null,
			"status": "active",
			"state": null,
			"hidden": false,
			"createdAt": "2016-02-04T21:20:40+11:00",
			"updatedAt": "2016-02-04T21:20:41+11:00"
		},
		"relationships": {
			"suburb": {
				"links": {
					"self": "https://api.serviceseeking.com.au/businesses/5/relationships/suburb",
					"related": "https://api.serviceseeking.com.au/businesses/5/suburb"
				},
				"data": {
					"type": "suburbs",
					"id": "1"
				}
			},
			"job_filter": {
				"links": {
					"related": "https://api.serviceseeking.com.au/businesses/5/job_filter"
				},
				"data": {
					"type": "job_filters",
					"id": "5"
				}
			},
			"eoi_templates": {
				"links": {
					"related": "https://api.serviceseeking.com.au/businesses/5/eoi_templates"
				},
				"data": []
			},
			"eoi_attachments": {
				"links": {
					"related": "https://api.serviceseeking.com.au/businesses/5/eoi_attachments"
				},
				"data": []
			}
		}
	}]}```
  
    
      

## LEADS LISTING
### Request:
**Url :** <https://staging.serviceseeking.com.au/leads>  
**Method :** "GET"  
**Headers :**     
• Accept: application/vnd.api+json; version=1  
• Content-Type: application/vnd.api+json  
• Authorization: Basic c3NzdGFnaW5nOnNzVDNzdDFuZyE=, Token token=afa1jlfhaoo1 ``<- (Token can be obtained upon successful SignIn)``  
**Parameters :**  
• page[size]  
• page[number]

### Response:
**Status :**  ``200``  
**Headers :**  
• Content-Type: application/vnd.api+json  
**Sample Response Body :** 
```{
	"data": [{
		"id": "1",
		"type": "leads",
		"links": {
			"self": "https://api.serviceseeking.com.au/leads/1"
		},
		"attributes": {
			"name": "My Job Name",
			"description": "This is the job description",
			"userName": "Test User",
			"suburbName": "Sydney",
			"biddingClosesOn": "2016-02-07",
			"distanceAway": "0kms",
			"timing": null,
			"canQuote": true,
			"withinRange": true,
			"new": true,
			"featured": false,
			"urgent": false,
			"private": false,
			"createdAt": "2016-02-04T21:20:06+11:00",
			"updatedAt": "2016-02-04T21:20:06+11:00"
		},
		"relationships": {
			"suburb": {
				"links": {
					"related": "https://api.serviceseeking.com.au/leads/1/suburb"
				},
				"data": {
					"type": "suburbs",
					"id": "1"
				}
			},
			"attachments": {
				"links": {
					"related": "https://api.serviceseeking.com.au/leads/1/attachments"
				},
				"data": []
			}
		}
	}, {
		"id": "2",
		"type": "leads",
		"links": {
			"self": "https://api.serviceseeking.com.au/leads/2"
		},
		"attributes": {
			"name": "My Job Name",
			"description": "This is the job description",
			"userName": "Test User",
			"suburbName": "Sydney",
			"biddingClosesOn": "2016-02-07",
			"distanceAway": "0kms",
			"timing": null,
			"canQuote": true,
			"withinRange": true,
			"new": true,
			"featured": false,
			"urgent": false,
			"private": false,
			"createdAt": "2016-02-04T21:20:09+11:00",
			"updatedAt": "2016-02-04T21:20:10+11:00"
		},
		"relationships": {
			"suburb": {
				"links": {
					"related": "https://api.serviceseeking.com.au/leads/2/suburb"
				},
				"data": {
					"type": "suburbs",
					"id": "1"
				}
			},
			"attachments": {
				"links": {
					"related": "https://api.serviceseeking.com.au/leads/2/attachments"
				},
				"data": []
			}
		}
	}, {
		"id": "3",
		"type": "leads",
		"links": {
			"self": "https://api.serviceseeking.com.au/leads/3"
		},
		"attributes": {
			"name": "My Job Name",
			"description": "This is the job description",
			"userName": "Test User",
			"suburbName": "Sydney",
			"biddingClosesOn": "2016-02-07",
			"distanceAway": "0kms",
			"timing": null,
			"canQuote": true,
			"withinRange": true,
			"new": true,
			"featured": false,
			"urgent": false,
			"private": false,
			"createdAt": "2016-02-04T21:20:10+11:00",
			"updatedAt": "2016-02-04T21:20:10+11:00"
		},
		"relationships": {
			"suburb": {
				"links": {
					"related": "https://api.serviceseeking.com.au/leads/3/suburb"
				},
				"data": {
					"type": "suburbs",
					"id": "1"
				}
			},
			"attachments": {
				"links": {
					"related": "https://api.serviceseeking.com.au/leads/3/attachments"
				},
				"data": []
			}
		}
	}],
	"links": {
		"self": "https://api.serviceseeking.com.au/leads?page%5Bnumber%5D=1&page%5Bsize%5D=6",
		"first": "https://api.serviceseeking.com.au/leads?page%5Bnumber%5D=1&page%5Bsize%5D=6",
		"last": "https://api.serviceseeking.com.au/leads?page%5Bnumber%5D=1&page%5Bsize%5D=6"
	},
	"meta": {
		"count": 3,
		"unReadCount": 3
	},
	"included": [{
		"id": "1",
		"type": "suburbs",
		"links": {
			"self": "https://api.serviceseeking.com.au/suburbs/1"
		},
		"attributes": {
			"name": "Sydney",
			"state": "NSW",
			"postcode": "2000",
			"lat": "-33.867139",
			"lng": "151.207114",
			"area": null,
			"region": "Sydney Region"
		}
	}, {
		"id": "1",
		"type": "business_statuses",
		"links": {
			"self": "https://api.serviceseeking.com.au/businesses/1/status"
		},
		"attributes": {
			"active": true,
			"abn": "37124055465",
			"abnStatus": "active",
			"membershipPlan": "memberships",
			"membershipActive": true,
			"identityVerified": true,
			"creditCardValid": true,
			"quoteLastSentAt": null,
			"quoteCountLast30Days": 0
		}
	}]
}```


## LEAD DETAIL
### Request:
**Url :** <https://staging.serviceseeking.com.au/leads/:lead_id>  
**Method :** "GET"  
**Headers :**     
• Accept: application/vnd.api+json; version=1  
• Content-Type: application/vnd.api+json  
• Authorization: Basic c3NzdGFnaW5nOnNzVDNzdDFuZyE=, Token token=afa1jlfhaoo1 ``<- (Token can be obtained upon successful SignIn)``  
**Parameters :**  
• lead_id

### Response:
**Status :**  ``200 ``  
**Headers :**  
• Content-Type: application/vnd.api+json  
**Sample Response Body :**  
```{
  "data": {
    "id": "19",
    "type": "leads",
    "links": {
      "self": "https://api.serviceseeking.com.au/leads/19"
    },
    "attributes": {
      "name": "My Job Name",
      "description": "This is the job description",
      "userName": "Test User",
      "suburbName": "Sydney",
      "biddingClosesOn": "2016-02-07",
      "distanceAway": "0kms",
      "timing": null,
      "canQuote": true,
      "withinRange": true,
      "new": true,
      "featured": false,
      "urgent": false,
      "private": false,
      "createdAt": "2016-02-04T21:20:01+11:00",
      "updatedAt": "2016-02-04T21:20:01+11:00"
    },
    "relationships": {
      "suburb": {
        "links": {
          "related": "https://api.serviceseeking.com.au/leads/19/suburb"
        },
        "data": {
          "type": "suburbs",
          "id": "1"
        }
      },
      "attachments": {
        "links": {
          "related": "https://api.serviceseeking.com.au/leads/19/attachments"
        },
        "data": []
      }
    }
  },
  "links": {
    "self": "https://api.serviceseeking.com.au/leads/19"
  },
  "included": [
    {
      "id": "1",
      "type": "suburbs",
      "links": {
        "self": "https://api.serviceseeking.com.au/suburbs/1"
      },
      "attributes": {
        "name": "Sydney",
        "state": "NSW",
        "postcode": "2000",
        "lat": "-33.867139",
        "lng": "151.207114",
        "area": null,
        "region": "Sydney Region"
      }
    },
    {
      "id": "36",
      "type": "business_statuses",
      "links": {
        "self": "https://api.serviceseeking.com.au/businesses/36/status"
      },
      "attributes": {
        "active": true,
        "abn": "37124055465",
        "abnStatus": "active",
        "membershipPlan": "memberships",
        "membershipActive": true,
        "identityVerified": true,
        "creditCardValid": true,
        "quoteLastSentAt": null,
        "quoteCountLast30Days": 0
      }
    }
  ]
}```