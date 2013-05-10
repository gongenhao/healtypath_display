//
//  MDCustomMoveView.h
//  HealthPathBCBS
//
//  Created by Dean Chen on 5/7/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "Datasource.h"
#import "London2012MedalData.h"
#import "DemoAllData.h"

@interface MDCustomMoveView : UIView{
    ShinobiChart *areaChart;
    Datasource *datasource;
    London2012MedalData *londonMedalData;
    DemoAllData *demoAllData;
}

@end

