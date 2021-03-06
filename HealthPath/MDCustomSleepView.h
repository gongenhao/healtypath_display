//
//  MDCustomSleepView.h
//  HealthPathBCBS
//
//  Created by Dean Chen on 5/6/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShinobiCharts/ShinobiChart.h"

@interface MDCustomSleepView : UIView <SChartDatasource>
{
    ShinobiChart *chart;
}
static inline double radians (double degrees) { return degrees * M_PI/180; }


@end
