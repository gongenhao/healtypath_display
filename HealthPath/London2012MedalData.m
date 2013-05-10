//
//  London2012MedalData.m
//  Area


#import "London2012MedalData.h"

@implementation London2012MedalData

- (id)init {
    self = [super init];
    if (self) {
        
        _data = [NSMutableDictionary new];
        
        _dataKeys = [NSArray arrayWithObjects:
                     bronze,
                     silver,
                     gold,
                     nil];
        
        _countries = [NSArray arrayWithObjects:
                     @"USA",
                     @"China",
                     @"Great Britain",
                     @"Russian Federation",
                     @"Republic of Korea",
                     @"Germany",
                     @"France",
                     @"Italy",
                     @"Hungary",
                     @"Australia",
                     nil];
        
        int i = 0;
        
        NSArray *usaData = [NSArray arrayWithObjects:[NSNumber numberWithInt:46],
                            [NSNumber numberWithInt:29],
                            [NSNumber numberWithInt:29],
                            nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:usaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
        NSArray *chinaData = [NSArray arrayWithObjects:
                              [NSNumber numberWithInt:38],
                              [NSNumber numberWithInt:27],
                              [NSNumber numberWithInt:23],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:chinaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
        NSArray *gbData = [NSArray arrayWithObjects:
                           [NSNumber numberWithInt:24],
                           [NSNumber numberWithInt:26],
                           [NSNumber numberWithInt:32],
                           nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:gbData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
        NSArray *russiaData = [NSArray arrayWithObjects:
                               [NSNumber numberWithInt:24],
                               [NSNumber numberWithInt:26],
                               [NSNumber numberWithInt:32],
                               nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:russiaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
        NSArray *koreaData = [NSArray arrayWithObjects:
                              [NSNumber numberWithInt:13],
                              [NSNumber numberWithInt:8],
                              [NSNumber numberWithInt:7],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:koreaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
        NSArray *germanyData = [NSArray arrayWithObjects:
                                [NSNumber numberWithInt:11],
                                [NSNumber numberWithInt:19],
                                [NSNumber numberWithInt:14],
                                nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:germanyData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
        NSArray *franceData = [NSArray arrayWithObjects:
                               [NSNumber numberWithInt:11],
                               [NSNumber numberWithInt:11],
                               [NSNumber numberWithInt:12],
                               nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:franceData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
        NSArray *italyData = [NSArray arrayWithObjects:
                              [NSNumber numberWithInt:8],
                              [NSNumber numberWithInt:9],
                              [NSNumber numberWithInt:11],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:italyData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
        NSArray *hungaryData = [NSArray arrayWithObjects:
                                [NSNumber numberWithInt:8],
                                [NSNumber numberWithInt:4],
                                [NSNumber numberWithInt:5],
                                nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:hungaryData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
        NSArray *ausData = [NSArray arrayWithObjects:
                            [NSNumber numberWithInt:7],
                            [NSNumber numberWithInt:16],
                            [NSNumber numberWithInt:12],
                            nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:ausData forKeys:_dataKeys] forKey:[_countries objectAtIndex:i++]];
        
    }
    return self;
}

@end
