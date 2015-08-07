//
//  YellowViewController.m
//  View Switcher
//
//  Created by Jeff LaMarche on 7/6/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "YellowViewController.h"

@implementation YellowViewController
@synthesize label;
@synthesize gestureStartPoint;
@synthesize ipaddr;
@synthesize portnum;

-(void)eraseText{
	label.text=@"";
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
	}
	return self;
}

-(IBAction)textFieldDoneEditing:(id)sender{
	[sender resignFirstResponder];
}

- (IBAction)leftButtonPressed:(id)sender
{
	label.text=@"LEFT";
	
	
	// This will be the read stream.
	CFReadStreamRef myReadStream = NULL;
	
	// This will be the write stream.
	CFWriteStreamRef myWriteStream = NULL;
	
	// Create socket.
	CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,(CFStringRef)ipaddr.text,[portnum.text intValue],&myReadStream,&myWriteStream);
	
	// Open write stream.
	if (myWriteStream != NULL && CFWriteStreamOpen(myWriteStream))
	{
		// Write a byte.
		//UInt8 writeBuffer[1];
		//writeBuffer[0] = 42;
		CFWriteStreamWrite(myWriteStream, (const UInt8 *)[label.text fileSystemRepresentation], [label.text length]);
	}
	
	// Be a good citizen.
	CFReadStreamClose(myReadStream);
	CFWriteStreamClose(myWriteStream);
	CFRelease(myReadStream);
	CFRelease(myWriteStream);	
}

- (IBAction)rightButtonPressed:(id)sender
{
	label.text=@"RIGHT";
	
	
	// This will be the read stream.
	CFReadStreamRef myReadStream = NULL;
	
	// This will be the write stream.
	CFWriteStreamRef myWriteStream = NULL;
	
	// Create socket.
	CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,(CFStringRef)ipaddr.text,[portnum.text intValue],&myReadStream,&myWriteStream);
	
	// Open write stream.
	if (myWriteStream != NULL && CFWriteStreamOpen(myWriteStream))
	{
		// Write a byte.
		//UInt8 writeBuffer[1];
		//writeBuffer[0] = 42;
		CFWriteStreamWrite(myWriteStream, (const UInt8 *)[label.text fileSystemRepresentation], [label.text length]);
	}
	
	// Be a good citizen.
	CFReadStreamClose(myReadStream);
	CFWriteStreamClose(myWriteStream);
	CFRelease(myReadStream);
	CFRelease(myWriteStream);	
}


/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 

- (void)viewDidLoad {

}*/



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[label release];
	[super dealloc];
}

#pragma mark -
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	gestureStartPoint=[[touches anyObject] locationInView:self.view];
	label.text=NSStringFromCGPoint(gestureStartPoint);
	label.text=[label.text stringByAppendingString:@"S"];
	
	
	// This will be the read stream.
	CFReadStreamRef myReadStream = NULL;
	
	// This will be the write stream.
	CFWriteStreamRef myWriteStream = NULL;
	
	// Create socket.
	CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,(CFStringRef)ipaddr.text,[portnum.text intValue],&myReadStream,&myWriteStream);
	
	// Open write stream.
	if (myWriteStream != NULL && CFWriteStreamOpen(myWriteStream))
	{
		// Write a byte.
		//UInt8 writeBuffer[1];
		//writeBuffer[0] = 42;
		CFWriteStreamWrite(myWriteStream, (const UInt8 *)[label.text fileSystemRepresentation], [label.text length]);
	}
	
	// Be a good citizen.
	CFReadStreamClose(myReadStream);
	CFWriteStreamClose(myWriteStream);
	CFRelease(myReadStream);
	CFRelease(myWriteStream);	
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	gestureStartPoint=[[touches anyObject] locationInView:self.view];
	label.text=NSStringFromCGPoint(gestureStartPoint);
	label.text=[label.text stringByAppendingString:@"M"];
	
	
	// This will be the read stream.
	CFReadStreamRef myReadStream = NULL;
	
	// This will be the write stream.
	CFWriteStreamRef myWriteStream = NULL;
	
	// Create socket.
	CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,(CFStringRef)ipaddr.text,[portnum.text intValue],&myReadStream,&myWriteStream);
	
	// Open write stream.
	if (myWriteStream != NULL && CFWriteStreamOpen(myWriteStream))
	{
		// Write a byte.
		//UInt8 writeBuffer[1];
		//writeBuffer[0] = 42;
		CFWriteStreamWrite(myWriteStream, (const UInt8 *)[label.text fileSystemRepresentation], [label.text length]);
	}
	
	// Be a good citizen.
	CFReadStreamClose(myReadStream);
	CFWriteStreamClose(myWriteStream);
	CFRelease(myReadStream);
	CFRelease(myWriteStream);	
	

}


@end
