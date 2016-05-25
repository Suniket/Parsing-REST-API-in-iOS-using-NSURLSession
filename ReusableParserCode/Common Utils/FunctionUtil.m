//
//  FunctionUtil.m
//  ReusableParserCode
//
//  Created by Suniket Wagh on 24/05/16.
//  Copyright © 2016 Suniket Wagh All rights reserved.
//

#import "FunctionUtil.h"

//Common utility methods implemetations

@implementation FunctionUtil

+(void)showAlertViewWithTitle:(NSString*)title andMessage:(NSString *)message FromVc:(UIViewController*)vc
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    //Handel your yes please button action here                                   
                                }];
    
    
    [alert addAction:yesButton];
    dispatch_async(dispatch_get_main_queue(), ^{
    [vc presentViewController:alert animated:YES completion:nil];
    });
}

@end
