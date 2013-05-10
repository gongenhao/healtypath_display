//
//  CMMotionManager+Shared.m
//  HealthPathBCBS
//
//  Created by Chong Wang on 5/9/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#import "CMMotionManager+Shared.h"

@implementation CMMotionManager (Shared)

+ (CMMotionManager *)sharedMotionManager
{
    static CMMotionManager *shared = nil;
    if (!shared) {
        shared = [[CMMotionManager alloc] init];
    }
    return shared;
}

@end
