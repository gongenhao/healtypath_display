//
//  MedalData.h
//  Area


#import <Foundation/Foundation.h>

#define bronze @"bronze"
#define silver @"silver"
#define gold @"gold"

//Define an inteface to provide our datasource with any kind of medal data
@protocol MedalData <NSObject>

@required
- (NSArray*)countries;
- (NSArray*)dataKeys;
- (NSMutableDictionary*)data;


@end
