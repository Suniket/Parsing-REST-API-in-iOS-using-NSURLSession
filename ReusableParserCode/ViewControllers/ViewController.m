//
//  ViewController.m
//  ReusableParserCode
//
//  Created by Suniket Wagh on 23/05/16.
//  Copyright © 2016 Suniket Wagh All rights reserved.
//

#import "ViewController.h"
#import "ConnectionManager.h"
#import "FunctionUtil.h"

#define GET_METHOD_URL @"https://hacker-news.firebaseio.com/v0/topstories.json"
#define POST_METHOD_URL @"http://hayageek.com/examples/jquery/ajax-post/ajax-post.php"
#define IMAGEPATH @"http://photo-cult.com/pics/198/pic_9991609_0198027.jpg"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ViewController lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark GET Button action method

- (IBAction)getDataFromGetMethod {

    __weak ViewController *weakSelf= self;

    [ConnectionManager callGetMethod:GET_METHOD_URL completionBlock:^(BOOL succeeded, id responseData, NSString *errorMsg) {
        if (succeeded)
        {
            NSArray *arr= (NSArray *)responseData;
            NSLog(@"%@",arr);
            [FunctionUtil showAlertViewWithTitle:@"GET Response" andMessage:arr.description FromVc:weakSelf];
        }
        else
        {
            [FunctionUtil showAlertViewWithTitle:@"Error" andMessage:errorMsg FromVc:weakSelf];
        }
    }];
}

#pragma mark POST Button action method

- (IBAction)getDataFromPostMethod
{
    __weak ViewController *weakSelf= self;
    NSString * params =@"name=ABC&submit=true";

    [ConnectionManager callPostMethod:POST_METHOD_URL withDelegate:self parameters:params completionBlock:^(BOOL succeeded, id responseData, NSString *errorMsg)
    {
         if (succeeded)
         {
             NSString * text = [[NSString alloc] initWithData:responseData encoding: NSUTF8StringEncoding];
             NSLog(@"Data = %@",text);
             [FunctionUtil showAlertViewWithTitle:@"POST Response" andMessage:text FromVc:weakSelf];
         }
         else
         {
             [FunctionUtil showAlertViewWithTitle:@"Error" andMessage:errorMsg FromVc:weakSelf];
         }
     }];
}

#pragma mark DOWNLOAD Button action method

- (IBAction)downloadImage
{
    __weak ViewController *weakSelf= self;
    
    [ConnectionManager downLoadFile:IMAGEPATH withDelegate:self completionBlock:^(BOOL succeeded, NSURL *location, NSString *errorMsg)
    {
        if (succeeded)
        {
            //Move file to documents directory and rename it.
            
            NSError *err = nil;
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            
            NSURL *docsDirURL = [NSURL fileURLWithPath:[docsDir stringByAppendingPathComponent:@"nature.jpg"]];
            if ([fileManager moveItemAtURL:location
                                     toURL:docsDirURL
                                     error: &err])
            {
                NSLog(@"File is saved to =%@",docsDir);
                [FunctionUtil showAlertViewWithTitle:@"Filepath" andMessage:docsDir FromVc:weakSelf];

            }
            else
            {
                NSLog(@"failed to move: %@",[err userInfo]);
                [FunctionUtil showAlertViewWithTitle:@"File failed to move" andMessage:[NSString stringWithFormat:@"%@",[err userInfo]] FromVc:weakSelf];

            }
        }
        else
        {
            [FunctionUtil showAlertViewWithTitle:@"Error" andMessage:errorMsg FromVc:weakSelf];
        }
    }];
}
@end
