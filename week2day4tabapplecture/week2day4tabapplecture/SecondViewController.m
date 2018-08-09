//
//  SecondViewController.m
//  week2day4tabapplecture
//
//  Created by Kyla  on 2018-08-09.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



//////use selector to drag over, make sure you made the text label user interactive in the attributes inspector
- (IBAction)handleTapGesture:(id)sender {
    NSLog(@"label tapped");

}



//////////the centre of the label will follow the touch in this method
- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateChanged) {
        self.label.center = [sender locationInView:self.view];
    }
}


@end

