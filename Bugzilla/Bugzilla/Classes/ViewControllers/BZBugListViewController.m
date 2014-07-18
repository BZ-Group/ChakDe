// METransitionsViewController.m
// TransitionFun
//
// Copyright (c) 2013, Michael Enriquez (http://enriquez.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "BZBugListViewController.h"

#import "UIViewController+ECSlidingViewController.h"
#import "MEDynamicTransition.h"
#import "BZTransitions.h"
#import "BZBugController.h"
#import "BZBugs.h"
#import "BZBugDetailsViewController.h"


@interface BZBugListViewController ()
@property (nonatomic, strong) BZTransitions *transitions;
@property (nonatomic, strong) UIPanGestureRecognizer *dynamicTransitionPanGesture;
@property (nonatomic, strong) NSArray *bugsArray;
@end

@implementation BZBugListViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.clearsSelectionOnViewWillAppear = NO;
    
    NSDictionary *transitionData = self.transitions.selectedTransition;
    id<ECSlidingViewControllerDelegate> transition = transitionData[@"transition"];
    self.slidingViewController.delegate = transition;
    self.transitions.dynamicTransition.slidingViewController = self.slidingViewController;
    
    // Refresh Data
    UIRefreshControl *refreshMe = [[UIRefreshControl alloc] init];
    //refreshMe.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to refresh"];
    [refreshMe addTarget:self action:@selector(refreshTable:)
        forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshMe;
    self.bugsArray = [appDelegate.currentUser.hasBug array];
    
    if(![self.bugsArray count]){
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
                 self.bugsArray = [appDelegate.currentUser.hasBug array];
                 NSLog(@"Success");
             }
             else
             {
                 NSLog(@"Fail");
             }
         }];
    }
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSIndexPath *defaultIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.tableView selectRowAtIndexPath:defaultIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
//    });
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //[self tableView:self.tableView didSelectRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
}

#pragma mark - Properties

- (BZTransitions *)transitions {
    if (_transitions) return _transitions;
    
    _transitions = [[BZTransitions alloc] init];
    
    return _transitions;
}

- (UIPanGestureRecognizer *)dynamicTransitionPanGesture {
    if (_dynamicTransitionPanGesture) return _dynamicTransitionPanGesture;
    
    _dynamicTransitionPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.transitions.dynamicTransition action:@selector(handlePanGesture:)];
    
    return _dynamicTransitionPanGesture;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.transitions.selectedTransition.count;
    return self.bugsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TransitionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    if([self.bugsArray count]){
        BZBugs *bugsData            = [self.bugsArray bzObjectAtIndex:indexPath.row];
        cell.textLabel.text         = [NSString stringWithFormat:@"%@",bugsData.bug_id];
        cell.detailTextLabel.text   = bugsData.summary;
        cell.accessoryType          = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // hack to get selectedBackgroundView's presentation layer to update after rotation.
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    [cell.selectedBackgroundView.layer removeAllAnimations];
//    BZBugs *bugsData            = [self.bugsArray bzObjectAtIndex:indexPath.row];
   // BZBugDetailsViewController *bugsDetailsVC = []
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
// Assume self.view is the table view
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    BZBugs *bugsData            = [self.bugsArray bzObjectAtIndex:path.row];
    
    BZBugController *bzBugController = [BZBugController sharedInstance];
    [bzBugController getBugDetailForBugIds:@[bugsData.bug_id]
                            withCompletion:^(BOOL success, NSInteger errorCode)
     {
         if (success)
         {
             [segue.destinationViewController setBugDetails:bugsData.bugDetails];
             NSLog(@"Success");
         }
         else
         {
             NSLog(@"Fail");
         }
     }];
    
}
- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

//This is the callback method which will work when you pull the refresh control
- (void)refreshTable:(UIRefreshControl *)refreshMe
{

    BZBugController *bzBugController = [BZBugController sharedInstance];
    NSString* lastSaveTime = [bzBugController lastBugSaveTime];
    [bzBugController getBugForAssignedTo:nil
                               Component:nil
                            CreationTime:nil
                                 Creator:nil
                                      Id:nil  //23830 //23943
                          LastChangeTime:lastSaveTime //@"2014-03-25 14:08:00 +0000"
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
             
             [[NSUserDefaults standardUserDefaults] setValue:[NSDate stringFromDate:[NSDate date] andFormat:BZGTMDateFormat] forKey:[NSString stringWithFormat:@"bugLastTime-%@",appDelegate.currentUser.login]];
             self.bugsArray = [bzBugController.bugsArr count]?bzBugController.bugsArr:[appDelegate.currentUser.hasBug array];
             [self.tableView reloadData];
             // TODO: do stuffs here
             [refreshMe endRefreshing];
//             refreshMe.attributedTitle = [[NSAttributedString alloc] initWithString:
//                                          @"Refreshed"];
             NSLog(@"Success");
         }
         else
         {
             // TODO: do stuffs here
             [refreshMe endRefreshing];

             //self.bugsArray = [appDelegate.currentUser.hasBug array];
             //[self.tableView reloadData];
             NSLog(@"Fail");
         }
     }];


}
@end
