//
//  BZViewController.m
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZViewController.h"
#import "BZLoginController.h"
#import "BZProductController.h"
#import "BZBugController.h"


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
    
    //Begin getBugzillaVersion
    [bzLoginController getBugzillaVersion:^(BOOL success, NSInteger errorCode)
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

- (IBAction)loginClicked:(id)sender
{
    NSDictionary* loginParams = @{@"login":@"anoop.sharma@ymail.com",
                                  @"password":@"India@123"};
    //Begin login Clicked
    BZLoginController *bzLoginController = [BZLoginController sharedInstance];
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
}

- (IBAction)getAccessibleProducts:(id)sender
{
    //Get Accessible Products Ids
    BZProductController *bzProductController = [BZProductController sharedInstance];
    [bzProductController getAccessibleProductIdsWithCompletion:^(BOOL success, NSInteger errorCode)
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

- (IBAction)getProductsDetails:(id)sender
{
    //Get Accessible Products Ids
    BZProductController *bzProductController = [BZProductController sharedInstance];
    [bzProductController getProductDetailsUsingProductIds:@[@2]  //,@3,@19,@1,@4
                                             ProductNames:nil
                                                     Type:nil
                                           withCompletion:^(BOOL success, NSInteger errorCode)
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

- (IBAction)getBugs:(id)sender
{
    //Get Bugs
    BZBugController *bzBugController = [BZBugController sharedInstance];
    [bzBugController getBugForAssignedTo:nil
                               Component:nil
                            CreationTime:nil
                                 Creator:nil
                                      Id:nil  //23830 //23943
                          LastChangeTime:@"2014-03-25 14:08:00 +0000"
                                   Limit:nil
                                Priority:nil
                                 Product:nil
                                Severity:nil
                                  Status:nil
                                 Summary:nil
                          withCompletion:^(BOOL success, NSInteger errorCode)
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

- (IBAction)getBugDetail:(id)sender
{
    //Get Bugs
    BZBugController *bzBugController = [BZBugController sharedInstance];
    [bzBugController getBugDetailForBugIds:@[@8800,@8341]
                            withCompletion:^(BOOL success, NSInteger errorCode)
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


- (IBAction)getUserInfo:(id)sender
{
     //Begin getUserInfo
    BZLoginController *bzLoginController = [BZLoginController sharedInstance];
    [bzLoginController retrieveUserInfo:nil withBlock:^(BOOL success, NSInteger errorCode)
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
