//
//  DemoAllData.m
//  HealthPathBCBS
//
//  Created by Chong Wang on 5/9/13.
//  Copyright (c) 2013 Dean Chen/Enhao Gong. All rights reserved.
//

#import "DemoAllData.h"

@implementation DemoAllData

- (id)init {
    self = [super init];
    if (self) {
        
        _data = [NSMutableDictionary new];
        
        _dataKeys = [NSArray arrayWithObjects:
                     eat,
                     move,
                     sleep,
                     nil];
        
        _times = [NSArray arrayWithObjects:
//                      @"2013-05-10-1",
//                      @"2013-05-10-3",
//                      @"2013-05-10-5",
//                      @"2013-05-10-7",
//                      @"2013-05-10-9",
//                      @"2013-05-10-11",
//                      @"2013-05-10-13",
//                      @"2013-05-10-15",
//                      @"2013-05-10-17",
//                      @"2013-05-10-19",
//                      @"2013-05-10-21",
//                      @"2013-05-10-23",
                      @"1",@"3",@"5",@"7",@"9",@"11",@"13",@"15",@"17",@"19",@"21",@"23",
                      nil];
        
        
        int hours = 0;
        int data_eat,data_move,data_sleep;
        
        for (hours=0;hours<[_times count];hours++)
        {
            switch (hours) {
                case 0:
                    data_eat=0;data_move=0;data_sleep=1;break;
                case 1:
                    data_eat=0;data_move=0;data_sleep=3;break;
                case 2:
                    data_eat=0;data_move=0;data_sleep=2;break;
                case 3:
                    data_eat=0;data_move=0;data_sleep=3;break;
                case 4:
                    data_eat=0;data_move=5;data_sleep=0;break;
                case 5:
                    data_eat=0;data_move=0;data_sleep=0;break;
                case 6:
                    data_eat=0;data_move=1;data_sleep=0;break;
                case 7:
                    data_eat=5;data_move=0;data_sleep=0;break;
                case 8:
                    data_eat=0;data_move=2;data_sleep=0;break;
                case 9:
                    data_eat=5;data_move=0;data_sleep=0;break;
                case 10:
                    data_eat=0;data_move=0;data_sleep=0;break;
                case 11:
                    data_eat=1;data_move=0;data_sleep=0;break;
                default:
                    break;
            }
            NSArray *tempData = [NSArray arrayWithObjects:[NSNumber numberWithInt:data_eat],
                                 [NSNumber numberWithInt:data_move],
                                 [NSNumber numberWithInt:data_sleep],
                                 nil];
            [_data setObject:[NSDictionary dictionaryWithObjects:tempData forKeys:_dataKeys]  forKey:[_times objectAtIndex:hours]];
        }

    }
    return self;
}

@end

