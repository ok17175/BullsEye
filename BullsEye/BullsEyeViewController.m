//
//  BullsEyeViewController.m
//  BullsEye
//
//  Created by 李深龙 on 13-10-7.
//  Copyright (c) 2013年 李深龙. All rights reserved.
//

#import "BullsEyeViewController.h"

@interface BullsEyeViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *target;
@property (nonatomic) int currentValue;
@property (nonatomic) int targetValue;
@property (nonatomic) int scores;
@property (nonatomic) int count;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *roundLable;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;

@end

@implementation BullsEyeViewController

- (IBAction)showAlert:(UIButton *)sender
{
    
    int score = 0;
    score= 100 - abs(self.targetValue - self.currentValue)*4;
    if (score < 0 ) score = 0;
    NSString *title = [[NSString alloc]init];
    if (score > 95 ) title = @"Perfect";
    else if (score > 85) title = @"Almost";
            else title  = @"Not even close";
    self.scores += score;
    NSString *message = [NSString stringWithFormat:@"The value is %d\n Score:%d",self.currentValue,score];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil,nil];
    [alert show];
}

-(void)newRound
{

    self.count++;
    self.targetValue = arc4random_uniform(100);
    [self updateLable];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self newRound];
    [self sliderView];
}

-(void)sliderView{
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage =[[UIImage imageNamed:@"SliderTrackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

- (IBAction)changeValue:(UISlider *)sender
{
    self.currentValue = sender.value;
}

-(void)updateLable
{
    self.scoreLable.text = [NSString stringWithFormat:@"Score:%d",self.scores];
    self.roundLable.text = [NSString stringWithFormat:@"Round:%d",self.count];
    self.target.text = [NSString stringWithFormat:@"%d",self.targetValue];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self newRound];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
