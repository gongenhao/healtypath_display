//
//  MDCustomCorrView.m
//  HealthPathBCBS
//
//  Created by Dean Chen on 5/7/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#import "MDCustomCorrView.h"
#import "Histogram.h"
#import "CorePlot-CocoaTouch.h"

@implementation MDCustomCorrView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

void drawCorrBox(CGContextRef context, CGRect rect) {
    CGRect strokeRect = CGRectInset(rect, 3.0, 3.0);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 3.0);
    CGContextStrokeRect(context, strokeRect);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect paperRect = self.bounds;
  
    drawCorrBox(context, paperRect);
      
    // Drawing code
   // [super viewDidLoad];
    Histogram *histogram = [[Histogram alloc] initWithFrame:paperRect];
    histogram.backgroundColor = [UIColor yellowColor];
    [histogram initHistogramHeight:0.5 height2:0.6 height3:0.7 height4:0.8];
    [histogram drawRect:paperRect on:context];
    
    //Create graph from theme
	//graph                               = [[CPTXYGraph alloc] initWithFrame:CGRectZero];
    [self.graphView createGraph];
    
    
    
}


@end
