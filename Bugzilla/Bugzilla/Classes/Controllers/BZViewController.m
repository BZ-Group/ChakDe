//
//  BZViewController.m
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZViewController.h"
#import "BZParseManager.h"


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
    BZParseManager *bzParseManager = [BZParseManager sharedInstance];
    
    //Begin getBugzillaVersion
    [bzParseManager getBugzillaVersion:^(BOOL success, NSString *errorMessage, NSInteger errorCode)
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
