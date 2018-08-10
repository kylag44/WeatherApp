//
//  ImageView.m
//  FingerPaint
//
//  Created by Kyla  on 2018-08-10.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "ImageView.h"
#import "Line.h"
#import "LinePoint.h"
#import "ViewController.h"


@interface ImageView ()

@property (nonatomic) NSMutableArray <Line*>*lines;

@property (nonatomic) NSArray *colorArray;



@end

@implementation ImageView


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _lines = [@[] mutableCopy];
        _color = [UIColor blackColor];
        
    }
    return self;
}

#pragma mark - Responder
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    NSLog(@"touch worked");
    CGPoint locationInView = [touch locationInView:self];
    Line *line = [[Line alloc] initWithColor:self.color];
    [self.lines addObject:line];
    LinePoint *linePoint = [[LinePoint alloc] initWithPoin:locationInView];
    [line.linePoints addObject:linePoint];
    [self setNeedsDisplay];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch move worked");
    UITouch *touch = touches.anyObject;
    CGPoint locationInView = [touch locationInView:self];
    LinePoint *linePoint = [[LinePoint alloc] initWithPoin:locationInView];
    Line *currentLine = self.lines.lastObject;
    [currentLine.linePoints addObject:linePoint];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5;
    
    path.lineCapStyle = kCGLineCapRound;
    
    for (Line *line in self.lines) {
        [line.color setStroke];
        for (LinePoint *linePoint in line.linePoints) {
            if (linePoint == line.linePoints.firstObject) {
                [path moveToPoint:linePoint.point];
                continue;
            }
            [path addLineToPoint:linePoint.point];
        }
    }
    
    [path stroke];
    
}

- (void)setColor:(UIColor *)color {
    _color = color;
}







@end
