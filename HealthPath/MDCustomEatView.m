//
//  MDCustomEatView.m
//  HealthPathBCBS
//
//  Created by Dean Chen on 5/7/13.
//  Copyright (c) 2013 Dean Chen. All rights reserved.
//

#import "MDCustomEatView.h"
#import "CMMotionManager+Shared.h"

@implementation MDCustomEatView

// try to add for plot lines
@synthesize webViewForSelectDate;
@synthesize timer;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

void drawEatBox(CGContextRef context, CGRect rect) {
    CGRect strokeRect = CGRectInset(rect, 3.0, 3.0);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 3.0);
    CGContextStrokeRect(context, strokeRect);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect webFrame = self.bounds;
    drawEatBox(context, webFrame);
 
    webFrame.origin.x = 0;
    webFrame.origin.y =  0;
    
    webViewForSelectDate = [[UIWebView alloc] initWithFrame:webFrame];
    webViewForSelectDate.delegate = self;
    webViewForSelectDate.scalesPageToFit = YES;
    webViewForSelectDate.opaque = NO;
    webViewForSelectDate.backgroundColor = [UIColor clearColor];
    webViewForSelectDate.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self addSubview:webViewForSelectDate];
    
    //所有的资源都在source.bundle这个文件夹里
    NSString* htmlPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"source.bundle/index.html"];
    
    NSURL* url = [NSURL fileURLWithPath:htmlPath];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [webViewForSelectDate loadRequest:request];
    int trueWidth = self.frame.size.width;
    if (trueWidth < self.frame.size.height && ![UIApplication sharedApplication].statusBarHidden)
    {
        trueWidth = self.frame.size.height + MIN([UIApplication sharedApplication].statusBarFrame.size.height,[UIApplication sharedApplication].statusBarFrame.size.width);
    }
    
    
    // Do any additional setup after loading the view from its nib.
}


-(void)updateData
{
    //取得当前时间，x轴
    NSDate* nowDate = [[NSDate alloc]init];
    NSTimeInterval nowTimeInterval = [nowDate timeIntervalSince1970] * 1000;
 //   [nowDate release];
    
    //随机温度，y轴
    int temperature = [self getRandomNumber:20 to:50];
    
    NSMutableString* jsStr = [[NSMutableString alloc] initWithCapacity:0];
    [jsStr appendFormat:@"updateData(%f,%d)",nowTimeInterval,temperature];
    
    [webViewForSelectDate stringByEvaluatingJavaScriptFromString:jsStr];
}
//获取一个随机整数，范围在[from,to），包括from，不包括to
-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from  + (arc4random() % (to - from + 1)));
}
#pragma mark - delegate of webview
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //等webview加载完毕再更新数据
//    timer = [NSTimer scheduledTimerWithTimeInterval: 10
//                                             target: self
//                                           selector: @selector(updateData)
//                                           userInfo: nil
//                                            repeats: YES];
    [self startMotionUpdate];
}

#pragma mark - Core Motion
#define ACC_FS 10.0
- (void)startMotionUpdate
{
    CMMotionManager *motionManager = [CMMotionManager sharedMotionManager];
    if ([motionManager isAccelerometerActive]) {
        [motionManager setAccelerometerUpdateInterval:1/ACC_FS];
        [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^
                           {
                               NSDate* nowDate = [[NSDate alloc]init];
                               NSTimeInterval nowTimeInterval = [nowDate timeIntervalSince1970] * 1000;
                               NSMutableString* jsStr = [[NSMutableString alloc] initWithCapacity:0];
                               [jsStr appendFormat:@"updateData(%f,%f)",nowTimeInterval,accelerometerData.acceleration.x];
                               
                               [webViewForSelectDate stringByEvaluatingJavaScriptFromString:jsStr];
                           });
        }];

    }
}

- (void)stopMotionUpdate
{
    [[CMMotionManager sharedMotionManager] stopAccelerometerUpdates];
}


@end
