//
//  MDCustomMoveView.m
//  HealthPathBCBS
//
//  Created by Dean Chen on 5/7/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#import "MDCustomMoveView.h"
#import <ShinobiCharts/SChartDarkTheme.h>
#import "ShinobiChart+AreaChart.h"

@interface MDCustomMoveView ()
@end

@implementation MDCustomMoveView

-(void) drawRect: (CGRect) rect
{
//    [super viewDidLoad];
    NSLog(@"enter MDCusteomMoveView ");
	
    //Create a chart object that displays medal data using stacked areas
    areaChart = [ShinobiChart areaChartWithFrame:self.bounds];
    areaChart.title = @"Wholestic Health: Eat/Move/Sleep";

    areaChart.autoresizesSubviews = ~UIViewAutoresizingNone;
    
    //Enter your trial license key here
    areaChart.licenseKey = @"hnA+QbUfLfXu1BxMjAxMzA2MDhpbmZvQHNoaW5vYmljb250cm9scy5jb20=yjoZ6vFwPWWmtOCpEQgYE1zZFOiRY1tSK4sRsqcvuN/JrdD2zltNZ7dQ6X3+G2C7IABSbfozZqFPoHeTpS3f/YuJQD26iLpEaAxl1VKXZLWjo51v4523YGg4wiK5ZldPpa77w9RXD8FqS7yevK8j8w+Hss4M=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";    
    
    //load london medal data for our data source and then assign it to the chart
    londonMedalData = [London2012MedalData new];
    demoAllData = [DemoAllData new];
    
    datasource = [Datasource new];
    datasource.allData = demoAllData;
    datasource.medalData = londonMedalData;
    
    areaChart.datasource = datasource;
    areaChart.theme = [SChartDarkTheme new];
    
    //add this chart to our main view
    [self addSubview:areaChart];
    
    
    self.backgroundColor = areaChart.backgroundColor;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


@end
