//
//  Line.m
//  FingerPaint
//
//  Created by Kyla  on 2018-08-10.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "Line.h"

@implementation Line



-(instancetype)initWithColor:(UIColor *)color {
    if (self = [super init]) {
        _color = color ? color : [UIColor orangeColor];
        self.linePoints = [@[] mutableCopy];
    }
    return self;
}


@end
