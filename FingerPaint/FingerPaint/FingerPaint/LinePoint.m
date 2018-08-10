//
//  LinePoint.m
//  FingerPaint
//
//  Created by Kyla  on 2018-08-10.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "LinePoint.h"



@implementation LinePoint

-(instancetype)initWithPoin:(CGPoint)point {
    if (self = [super init]) {
        _point = point;
    }
    return self;
}


@end
