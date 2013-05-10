//
//  CMMotionManager+Shared.h
//  HealthPathBCBS
//
//  Created by Chong Wang on 5/9/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

@interface CMMotionManager (Shared)

+ (CMMotionManager *)sharedMotionManager;

@end
