//
//  MDCustomSleepView.m
//  HealthPathBCBS
//
//  Created by Dean Chen on 5/6/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#import "MDCustomSleepView.h"

@implementation MDCustomSleepView


#pragma mark - ShinobiChart Datasource
// Returns the number of series in the specified chart
- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 3;
}

// Returns the series at the specified index for a given chart
-(SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    
    // In our example all series are line series.
    SChartLineSeries *lineSeries = [[SChartLineSeries alloc] init];
    
    // Set up the series
    lineSeries.title = [NSString stringWithFormat:@"y = x ^ %d", index+1];
    lineSeries.style.lineWidth = [NSNumber numberWithInt:4];
    
    // Customise the series at index 0
    if (index == 0) {
        lineSeries.style.showFill = YES;
        lineSeries.style.areaColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
        lineSeries.style.areaColorLowGradient = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    }
    
    
    return lineSeries;
}

// Returns the number of points for a specific series in the specified chart
- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    // In this example each series has 100 points
    return 100;
}

// Returns the data point at the specified index for the given series/chart.
- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    
    //Construct a data point to return
    SChartDataPoint *datapoint = [[SChartDataPoint alloc] init];
    
    double xValue = dataIndex /50.0;
    datapoint.xValue = [NSNumber numberWithDouble:xValue];
    datapoint.yValue = [NSNumber numberWithDouble:pow(xValue, seriesIndex + 1)];
    
    return datapoint;
}

#pragma mark - View lifecycle


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

// sample drawing code
void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    // More coming...
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

void drawBox(CGContextRef context, CGRect rect) {
    CGRect strokeRect = CGRectInset(rect, 3.0, 3.0);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 3.0);
    CGContextStrokeRect(context, strokeRect);
}

void draw3PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color)
{
    CGContextSaveGState(context);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, 3.0);
    CGContextMoveToPoint(context, startPoint.x + 0.5, startPoint.y + 0.5);
    CGContextAddLineToPoint(context, endPoint.x + 0.5, endPoint.y + 0.5);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

void drawLine(CGContextRef context, CGRect rect) {
    CGPoint startPoint = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height - 20);
    CGPoint endPoint = CGPointMake(rect.origin.x + rect.size.width - 1, rect.origin.y + rect.size.height - 20);
    draw3PxStroke(context, startPoint, endPoint, [UIColor whiteColor].CGColor);
}

void drawBezierCurve(CGContextRef context) {
    // Bezier curve
    CGContextSaveGState(context);
    CGContextSetLineCap(context, kCGLineCapButt);
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 3.0);
    
    // (100, 100) starting point (220, 100) end point; (160, 130) is control point
    // pulls curve in that direction
    CGContextAddQuadCurveToPoint(context, 160, 130, 220, 100);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

-(void) drawRect: (CGRect) rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect paperRect = self.bounds;
    // drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
    drawBox(context, paperRect);
    // drawLine(context, paperRect);
    
    // Create the chart
    
    
    
    
    
    chart = [[ShinobiChart alloc] initWithFrame:self.bounds];
    chart.licenseKey = @"hnA+QbUfLfXu1BxMjAxMzA2MDhpbmZvQHNoaW5vYmljb250cm9scy5jb20=yjoZ6vFwPWWmtOCpEQgYE1zZFOiRY1tSK4sRsqcvuN/JrdD2zltNZ7dQ6X3+G2C7IABSbfozZqFPoHeTpS3f/YuJQD26iLpEaAxl1VKXZLWjo51v4523YGg4wiK5ZldPpa77w9RXD8FqS7yevK8j8w+Hss4M=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
    chart.title = @"My First Chart";
    
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    
    chart.datasource = self;
    //Choose the light theme for this chart
    SChartDarkTheme *theme = [SChartDarkTheme new];
    //perform any theme stylign here before applying to the chart
    chart.theme = theme;
    // Use a number axis for the x axis.
    SChartNumberAxis *xAxis = [[SChartNumberAxis alloc] init];
    xAxis.title = @"X-Axis";
    chart.xAxis = xAxis;
    
    // Use a number axis for the y axis.
    SChartNumberAxis *yAxis = [[SChartNumberAxis alloc] init];
    yAxis.title = @"Y-Axis";
    chart.yAxis = yAxis;
    
    // Show the legend
    chart.legend.hidden = NO;
    
    // Add the chart to the view controller
    [self addSubview:chart];

}
@end
