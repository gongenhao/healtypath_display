//
//  Histogram.h
//  HealthPathBCBS
//
//  Created by Chong Wang on 5/8/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#ifndef HealthPathBCBS_Histogram_h
#define HealthPathBCBS_Histogram_h



#endif

#import <UIKit/UIKit.h>
#define kindex 4

@interface Histogram : UIView{
    CGFloat colors[kindex][4];
    CGRect rects[kindex];
    CGContextRef canvas;
    CGFloat x;
    CGFloat y;
    CGFloat w;
    CGFloat h;
    CGFloat height[kindex];
}

            
            
@property (nonatomic,assign) CGContextRef canvas;

- (void) initHistogramHeight:(float) height1 height2:(float)height2 height3:(float) height3 height4:(float)height4;
- (void) drawRect:(CGRect)rect on:(CGContextRef) context;

@end