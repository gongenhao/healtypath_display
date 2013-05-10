//
//  Datasource.m
//  Area


#import "Datasource.h"
#import "ShinobiChart+AreaChart.h"

@implementation Datasource

- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
//    return [_medalData dataKeys].count;
    return [_allData dataKeys].count;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
//    return [chart areaSeriesForKey:[[_medalData dataKeys] objectAtIndex:index]];
    return [chart areaSeriesForKey:[[_allData dataKeys] objectAtIndex:index]];
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
//    return [_medalData countries].count;
    return [_allData times].count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *dp = [SChartDataPoint new];
//    dp.xValue = [[_medalData countries] objectAtIndex:dataIndex];
    dp.xValue = [[_allData times] objectAtIndex:dataIndex];
//    dp.yValue = [[[_medalData data] objectForKey:dp.xValue] objectForKey:[[_medalData dataKeys] objectAtIndex:2-seriesIndex]];
    dp.yValue = [[[_allData data] objectForKey:dp.xValue] objectForKey:[[_allData dataKeys] objectAtIndex:seriesIndex]];
    return dp;
}

@end














