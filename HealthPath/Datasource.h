//
//  Datasource.h
//  Area

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "MedalData.h"
#import "AllData.h"


@interface Datasource : NSObject <SChartDatasource>

@property (nonatomic, assign) id<MedalData> medalData;
@property (nonatomic, assign) id<AllData> allData;

@end
