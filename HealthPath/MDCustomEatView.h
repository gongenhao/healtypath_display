//
//  MDCustomEatView.h
//  HealthPathBCBS
//
//  Created by Dean Chen on 5/7/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDCustomEatView : UIView <UIWebViewDelegate, UITextFieldDelegate>

@property(retain,nonatomic)UIWebView* webViewForSelectDate;
@property(retain,nonatomic)NSTimer* timer;


@end

