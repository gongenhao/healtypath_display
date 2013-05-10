//
//  AllData.h
//  HealthPathBCBS
//
//  Created by Chong Wang on 5/9/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#ifndef HealthPathBCBS_AllData_h
#define HealthPathBCBS_AllData_h



#endif



#import <Foundation/Foundation.h>

#define eat @"Eat"
#define move @"Move"
#define sleep @"Sleep"

//Define an inteface to provide our datasource with any kind of medal data
@protocol AllData <NSObject>

@required
- (NSArray*)times;
- (NSArray*)dataKeys;
- (NSMutableDictionary*)data;


@end

