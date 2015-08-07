//
//  YellowViewController.h
//  View Switcher
//
//  Created by Jeff LaMarche on 7/6/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#define kMinimumGestureLength 25
#define kMaximumVariance 5

#import <UIKit/UIKit.h>

@interface YellowViewController : UIViewController {
	IBOutlet UILabel *label;
	CGPoint gestureStartPoint;
	IBOutlet UITextField *ipaddr;
	IBOutlet UITextField *portnum;
}

@property (nonatomic,retain) UILabel *label;
@property (nonatomic,retain) UITextField *ipaddr;
@property (nonatomic,retain) UITextField *portnum;
@property CGPoint gestureStartPoint;

-(void)eraseText;
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)leftButtonPressed:(id)sender;
-(IBAction)rightButtonPressed:(id)sender;
@end
