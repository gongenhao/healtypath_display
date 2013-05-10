//
//  London2012MedalData.h
//  Area


#import <Foundation/Foundation.h>
#import "MedalData.h"

//Medal data for London 2012 to load into our datasource
@interface London2012MedalData : NSObject <MedalData>

@property (nonatomic,readonly) NSMutableDictionary *data;
@property (nonatomic,readonly) NSArray *dataKeys;
@property (nonatomic,readonly) NSArray *countries;

@end
