//
//  ViewController.h
//  FingerPaint
//
//  Created by Kyla  on 2018-08-10.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic) IBOutlet UIPickerView *picker; 


@end

