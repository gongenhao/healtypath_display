//
//  Histogram.m
//  HealthPathBCBS
//
//  Created by Chong Wang on 5/8/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#import "Histogram.h"

@interface Histogram()

-(void) initHistogramHeight:(float)height1 height2:(float)height2 height3:(float)height3 height4:(float)height4;
@end



@implementation Histogram

@synthesize canvas;

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization cod;
        
    }
    
    return self;
}


//set heights
- (void) initHistogramHeight:(float)height1 height2:(float)height2 height3:(float)height3 height4:(float)height4
{
    height[0]=height1;
    height[1]=height2;
    height[2]=height3;
    height[3]=height4;
}

- (void)drawRect:(CGRect)rect on:(CGContextRef) context
{
    
    int index;
    float rgb = 255;
	//RGB颜色值为4个组成，前三个分别代表R、G、B对应的值/256,最后一个代表透明度
	
	//设置四个柱状图的颜色
    colors[0][0] = 176/rgb;
    colors[0][1] = 224/rgb;
    colors[0][2] = 230/rgb;
    colors[0][3] = 1.0;//透明度
    
    
    colors[1][0] = 135/rgb;
    colors[1][1] = 206/rgb;
    colors[1][2] = 235/rgb;
    colors[1][3] = 1.0;
    
    
    colors[2][0] = 245/rgb;
    colors[2][1] = 222/rgb;
    colors[2][2] = 179/rgb;
    colors[2][3] = 1.0;
    
    
    colors[3][0] = 46/rgb;
    colors[3][1] = 139/rgb;
    colors[3][2] = 87/rgb;
    colors[3][3] = 1.0;
    
    rects[0] = CGRectMake(5, 5,height[0]*200,25);
    rects[1] = CGRectMake(5, 55,height[1]*200,25);
    rects[2] = CGRectMake(5, 105,height[2]*200,25);
    rects[3] = CGRectMake(5, 155,height[3]*200, 25);
    
    if (context)
        self.canvas=context;
    else
        self.canvas = UIGraphicsGetCurrentContext();
    //	CGContextTranslateCTM(self.canvas, 20, rect.size.height-20);
    //	CGContextScaleCTM(self.canvas, 1.0, 1.0); //可以设置相反方向的柱状图
    
	for (index = 0; index<kindex; index++) {
		CGContextBeginPath(self.canvas);//初始化绘图
		
		CGContextSetFillColor(self.canvas, colors[index]);//设置柱状图的颜色
		CGContextAddRect(self.canvas, rects[index]);//设置柱状图的形状
		
		CGContextClosePath(self.canvas);//结束绘图
		CGContextFillPath(self.canvas);
	}
}


- (void)dealloc {
    //[super dealloc];
}


@end
