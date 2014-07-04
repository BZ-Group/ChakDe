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

#import "METransitionsViewController.h"

#import "UIViewController+ECSlidingViewController.h"
#import "MEDynamicTransition.h"
#import "METransitions.h"
#import "BZBugController.h"
#import "BZBugs.h"

@interface METransitionsViewController ()
@property (nonatomic, strong) METransitions *transitions;
@property (nonatomic, strong) UIPanGestureRecognizer *dynamicTransitionPanGesture;
@property (nonatomic, strong) NSArray *bugsArray;
@end

@implementation METransitionsViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.clearsSelectionOnViewWillAppear = NO;
    
    NSDictionary *transitionData = self.transitions.selectedTransition;
    id<ECSlidingViewControllerDelegate> transition = transitionData[@"transition"];
    self.slidingViewController.delegate = transition;
    self.transitions.dynamicTransition.slidingViewController = self.slidingViewController;
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier:@"TransitionCell"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath *defaultIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView selectRowAtIndexPath:defaultIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    });

    self.bugsArray = [appDelegate.currentUser.hasBug array];
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
             self.bugsArray = bzBugController.bugsArr;
             [self.tableView reloadData];
             //NSLog(@"Success");
         }
         else
         {
             NSLog(@"Fail");
         }
     }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self tableView:self.tableView didSelectRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
}

#pragma mark - Properties

- (METransitions *)transitions {
    if (_transitions) return _transitions;
    
    _transitions = [[METransitions alloc] init];
    
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
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if([self.bugsArray count]){
        BZBugs *bugsData = [self.bugsArray bzObjectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",bugsData.bug_id];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // hack to get selectedBackgroundView's presentation layer to update after rotation.
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.selectedBackgroundView.layer removeAllAnimations];

}

- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

@end
