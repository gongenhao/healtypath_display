//
//  ShinobiChart+AreaChart.m
//  Area


#import "ShinobiChart+AreaChart.h"
#import "UIColor+AreaChart.h"
#import <ShinobiCharts/SChartLightTheme.h>
#import "Datasource.h"


@implementation ShinobiChart (AreaChart)

+ (ShinobiChart*)areaChartWithFrame:(CGRect)frame {
    
    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    
    if (iPad) {
        frame.origin.x += 10;
        frame.origin.y += 50;
        frame.size.width -= 50;
        frame.size.height -= 100;
    } else {
        frame.size.width -= 10;
    }
    
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    chart.clipsToBounds = NO;
        
    chart.theme = [SChartLightTheme new];
    
    SChartCategoryAxis *xAxis = [SChartCategoryAxis new];
    xAxis.tickLabelClippingModeHigh = SChartTickLabelClippingModeTicksAndLabelsPersist;
    xAxis.tickLabelClippingModeLow = SChartTickLabelClippingModeTicksAndLabelsPersist;
    xAxis.rangePaddingHigh = [NSNumber numberWithFloat:.2f];
    xAxis.rangePaddingLow = [NSNumber numberWithFloat:.2f];
    xAxis.style.majorTickStyle.tickLabelOrientation = TickLabelOrientationDiagonal;
    xAxis.style.majorGridLineStyle.showMajorGridLines = NO;
    xAxis.enableGesturePanning = YES;
    xAxis.enableGestureZooming = YES;
    xAxis.enableMomentumPanning = YES;
    xAxis.enableMomentumZooming = YES;
    chart.xAxis = xAxis;
    
    SChartNumberAxis *yAxis = [SChartNumberAxis new];
    yAxis.rangePaddingHigh = [NSNumber numberWithInt:10];
    yAxis.majorTickFrequency = [NSNumber numberWithInt:20];
    xAxis.tickLabelClippingModeLow = SChartTickLabelClippingModeTicksAndLabelsPersist;
    yAxis.enableGesturePanning = NO;
    yAxis.enableGestureZooming = YES;
    yAxis.enableMomentumPanning = NO;
    yAxis.enableMomentumZooming = YES;
    chart.yAxis = yAxis;
    
    if (iPad) {
        chart.legend.hidden = NO;
        chart.legend.position = SChartLegendPositionTopRight;
        chart.legend.placement = SChartLegendPlacementInsidePlotArea;
        chart.legend.maxSeriesPerLine = 3.f;
        chart.legend.cornerRadius = [NSNumber numberWithFloat:10.f];
    }
    
    return chart;
}

- (UIColor*)colorForKey:(NSString*)key {
    UIColor *color = nil;
    
    if ([key isEqualToString:bronze]) {
        color = [UIColor bronzeColor];
        
    } else if ([key isEqualToString:silver]) {
        color = [UIColor silverColor];
        
    } else if ([key isEqualToString:gold]) {
        color = [UIColor goldColor];
    }
    
    return color;
}

- (NSString*)titleForKey:(NSString*)key {
    NSString *title = nil;
    
    if ([key isEqualToString:eat]) {
        title = @"Eat";
        
    } else if ([key isEqualToString:silver]) {
         title = @"Silver";
        
    } else if ([key isEqualToString:gold]) {
         title = @"Gold";
    }
    
    return title;
}

- (SChartLineSeries*)areaSeriesForKey:(NSString*)key {
    SChartLineSeries *series = [SChartLineSeries new];
    series.stackIndex = [NSNumber numberWithInt:1];
    
    series.title = [self titleForKey:key];
    series.style = [self areaStyleForKey:key];
    
    return series;
}

- (SChartLineSeriesStyle*)areaStyleForKey:(NSString*)key {
        
    SChartLineSeriesStyle *style = [SChartLineSeriesStyle new];
    [style supplementStyleFromStyle:[self.theme lineSeriesStyleForSeriesAtIndex:0 selected:NO]];
    
    style.showFill = YES;
    style.fillWithGradient = YES;
    
    UIColor *medalColor = [self colorForKey:key];
    style.areaLineColor = medalColor;
    style.areaColor = [medalColor colorWithAlphaComponent:0.7f];
    style.areaColorLowGradient = [medalColor colorWithAlphaComponent:0.4f];
                
    return style;
}


@end
