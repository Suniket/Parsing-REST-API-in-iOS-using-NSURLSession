//
//  ConnectionManager.m
//  ReusableParserCode
//
//  Created by Suniket Wagh on 23/05/16.
//  Copyright © 2016 Suniket Wagh All rights reserved.
//

#import "ConnectionManager.h"

@implementation ConnectionManager

#pragma mark GET method

// completionBlock will use to check if parsing is done or any error.If succeeded user can perform further operations on response from webservice.

+(void)callGetMethod:(NSString *)webserviceUrl completionBlock:(void (^)(BOOL succeeded, id  responseData ,NSString* errorMsg))completionBlock
{
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:webserviceUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error) {
            // Failure block called
            completionBlock(NO,nil,error.localizedDescription);
        }
        else
        {
            //Success block Called
            id dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            completionBlock(YES,dict,nil);
            
        }
    }];
    
    [dataTask resume];
    
}

#pragma mark POST method

// completionBlock will use to check if parsing is done or any error.If succeeded user can perform further operations on response from webservice.

+(void)callPostMethod:(NSString *)webserviceUrl withDelegate:(id)delegate parameters:(NSString *)parameters completionBlock:(void (^)(BOOL succeeded, id  responseData ,NSString* errorMsg))completionBlock
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //delegate - class from which method called
    //delegateQueue - to handle tasks concurrently
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:webserviceUrl];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[parameters dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSLog(@"Response:%@ %@\n", response, error);
        if(error == nil)
        {
            if (error) {
                // Failure block called
                completionBlock(NO,nil,error.localizedDescription);
            }
            else
            {
                //Success block Called
                completionBlock(YES,data,nil);
            }
        }
    }];
    [dataTask resume];
}

#pragma mark DOWNLOAD method 

+(void)downLoadFile:(NSString *)webserviceUrl withDelegate:(id)delegate completionBlock:(void (^)(BOOL succeeded, NSURL *location ,NSString* errorMsg))completionBlock
{
    NSURL * url = [NSURL URLWithString:webserviceUrl];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    //delegate - class from which method called
    //delegateQueue - to handle tasks concurrently
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate:delegate delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask * downloadTask =[ defaultSession downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
    {
        if (error) {
            // Failure block called
            completionBlock(NO,nil,error.localizedDescription);
        }
        else
        {
            //Success block Called
            NSLog(@"Temporary file location=%@",location);
            completionBlock(YES,location,nil);
        }
    }];
    [downloadTask resume];
}

@end
