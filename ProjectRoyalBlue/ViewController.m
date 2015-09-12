//
//  ViewController.m
//  ProjectRoyalBlue
//
//  Created by RaulStudio on 15/9/7.
//  Copyright © 2015年 RaulStudio. All rights reserved.
//
//http://flatuicolors.com
//http://uigradients.com/#
//https://github.com/kaiinui/UIColor-uiGradientsAdditions

#import "ViewController.h"
#import "UIColor+uiGradients.h"
#import "JsonHelper.h"

@interface ViewController ()

@property (strong,nonatomic) CAGradientLayer *gradient;
@property (strong,nonatomic) CAGradientLayer *gradient2;
@property (weak, nonatomic) IBOutlet UIView *iPhoneView;

@end


@implementation ViewController

@synthesize gradient, gradient2;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIColor *startColor = [UIColor uig_almostEndColor];
//    UIColor *endColor = [UIColor uig_almostStartColor];
//    UIGGradient *uig = [[UIGGradient alloc]init];
    
    gradient= [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient2 = [CAGradientLayer layer];
    gradient2.frame = self.iPhoneView.bounds;
    gradient.startPoint= gradient2.startPoint  = GRDStartPointForAngle(GRDRandomAngle());
    gradient.endPoint =gradient2.endPoint= GRDEndPointForAngle(GRDRandomAngle());
    gradient.colors = [UIGGradient UIGLemonTwist]; // uig.UIGEmeraldWater; //@[(id)[endColor CGColor],(id)[startColor CGColor]];
    gradient2.colors = [UIGGradient UIGLemonTwist];
    
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    [self.iPhoneView.layer insertSublayer:gradient2 atIndex:0];

}
- (IBAction)btnPoint:(id)sender {
    gradient.startPoint= gradient2.startPoint  = GRDStartPointForAngle(GRDRandomAngle());
    gradient.endPoint =gradient2.endPoint= GRDEndPointForAngle(GRDRandomAngle());
    [JsonHelper jsonToObject];
    
}
static CGPoint GRDStartPointForAngle (CGFloat angle){
    return CGPointMake(.5f + (sinf(angle) / 2.f), .5f - cosf(angle) / 2.f);
}

static CGPoint GRDEndPointForAngle (CGFloat angle){
    return CGPointMake(.5f - (sinf(angle) / 2.f), .5f + (cosf(angle) / 2.f));
}

static CGFloat GRDRandomAngle() {
    return (CGFloat)arc4random_uniform(1000) / 1000.f * M_PI;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
