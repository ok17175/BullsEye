//
//  aboutViewController.m
//  BullsEye
//
//  Created by 李深龙 on 13-10-7.
//  Copyright (c) 2013年 李深龙. All rights reserved.
//

#import "aboutViewController.h"

@interface aboutViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation aboutViewController

- (IBAction)close:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *htmlFile = [[NSBundle mainBundle]
                          pathForResource:@"BullsEye" ofType:@"html"]; NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    NSURL *baseURL = [NSURL fileURLWithPath:[
                                             [NSBundle mainBundle] bundlePath]];
    [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
}
@end
