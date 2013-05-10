//
//  ShinobiChart+AreaChart.h
//  Area


#import <ShinobiCharts/ShinobiChart.h>

@interface ShinobiChart (AreaChart)

//An area chart for displaying medal data
+ (ShinobiChart*)areaChartWithFrame:(CGRect)frame;

- (SChartLineSeries*)areaSeriesForKey:(NSString*)key;
- (SChartLineSeriesStyle*)areaStyleForKey:(NSString*)key;

@end
