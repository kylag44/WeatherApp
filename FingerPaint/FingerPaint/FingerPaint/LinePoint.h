//
//  LinePoint.h
//  FingerPaint
//
//  Created by Kyla  on 2018-08-10.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@interface LinePoint : NSObject

@property (nonatomic, readonly) CGPoint point;

-(instancetype)initWithPoin:(CGPoint)point;




@end
