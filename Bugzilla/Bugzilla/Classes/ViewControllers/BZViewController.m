//
//  BZViewController.m
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZViewController.h"
#import "BZLoginController.h"


@interface BZViewController ()

@end

@implementation BZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)versionClicked:(id)sender
{
    BZLoginController *bzLoginController = [BZLoginController sharedInstance];
    
//    //Begin getBugzillaVersion
//    [bzLoginController getBugzillaVersion:^(BOOL success, NSInteger errorCode)
//    {
//        if (success)
//        {
//            NSLog(@"Success");
//        }
//        else
//        {
//            NSLog(@"Fail");
//        }
//    }];
    

    
    NSDictionary* loginParams = @{@"login":@"anoop.sharma@ymail.com",
                                  @"password":@"India@123"};
    //Begin getBugzillaVersion
    [bzLoginController invokeLoginWithDetails:@[loginParams] withBlock:^(BOOL success, NSInteger errorCode)
     {
         if (success)
         {
             NSLog(@"Success");
         }
         else
         {
             NSLog(@"Fail");
         }
     }];
    
//    NSDictionary* loginParams = @{@"login":@"anoop.sharma@ymail.com",
//                                  @"password":@"India@123"};
//    //Begin getBugzillaVersion
//    [bzLoginController retrieveUserInfo:@[loginParams] withBlock:^(BOOL success, NSInteger errorCode)
//     {
//         if (success)
//         {
//             NSLog(@"Success");
//         }
//         else
//         {
//             NSLog(@"Fail");
//         }
//     }];
}
- (IBAction)getUserInfo:(id)sender {
    BZLoginController *bzLoginController = [BZLoginController sharedInstance];
    
    NSDictionary* loginParams = @{@"login":@"anoop.sharma@ymail.com",
                                  @"password":@"India@123"};
    //Begin getBugzillaVersion
    [bzLoginController retrieveUserInfo:@[loginParams] withBlock:^(BOOL success, NSInteger errorCode)
     {
         if (success)
         {
             NSLog(@"Success");
         }
         else
         {
             NSLog(@"Fail");
         }
     }];
}

@end
