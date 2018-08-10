//
//  Line.h
//  FingerPaint
//
//  Created by Kyla  on 2018-08-10.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@class LinePoint;



@interface Line : NSObject


@property (nonatomic) UIColor *color;
@property (nonatomic) NSMutableArray <LinePoint*>*linePoints;

-(instancetype)initWithColor:(UIColor *)color; 

@end
