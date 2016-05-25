//
//  ConnectionManager.h
//  ReusableParserCode
//
//  Created by Suniket Wagh on 23/05/16.
//  Copyright © 2016 Suniket Wagh All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectionManager : NSObject 

//Declarations

// GET Method
+(void)callGetMethod:(NSString *)webserviceUrl completionBlock:(void (^)(BOOL succeeded, id  responseData ,NSString* errorMsg))completionBlock;

// POST Method
+(void)callPostMethod:(NSString *)webserviceUrl withDelegate:(id)delegate parameters:(NSString *)parameters completionBlock:(void (^)(BOOL succeeded, id  responseData ,NSString* errorMsg))completionBlock;

// DOWNLOAD Method
+(void)downLoadFile:(NSString *)webserviceUrl withDelegate:(id)delegate completionBlock:(void (^)(BOOL succeeded, NSURL *location ,NSString* errorMsg))completionBlock;


@end
