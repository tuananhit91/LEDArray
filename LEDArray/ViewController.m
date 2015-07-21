//
//  ViewController.m
//  LEDArray
//
//  Created by admin on 7/21/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    CGFloat _marginWidth;
    CGFloat _ballDiameter;
    CGFloat _marginHeight;
}

- (void)viewDidLoad {
    _marginWidth = 40.0;
    _marginHeight = 80.0;
    _ballDiameter = 24.0;
    
    [super viewDidLoad];
    [self checkSizeOfApp];
    [self numberOfBallSpace];
    [self drawMatrixOfBalls:8 and:18];
    //[self placeGrayBallAtX:100 andY:100 withTag:1];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) placeGrayBallAtX: (CGFloat) x
                    andY: (CGFloat) y
                 withTag:(int)tag
{
    UIImageView* ball = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gray"]];
    ball.center = CGPointMake(x, y);
    ball.tag = tag;
    [self.view addSubview:ball];
}

- (void) checkSizeOfApp {
   CGSize size = self.view.bounds.size;
    NSLog(@"width = %.0f,height = %.0f",size.width,size.height);
}
- (CGFloat) spaceBetweenBallCenterWhenNumberBallIsKnown: (int) n{
    return (self.view.bounds.size.width - 2 * _marginWidth) / (n - 1);
}
- (CGFloat) spaceBetweenBallCenterHeight: (int) n {
    return (self.view.bounds.size.height - 2 * _marginHeight) / (n - 1);
}

- (void) numberOfBallSpace {
    bool stop = false;
    int n = 3;
    while (!stop) {
        CGFloat space = [self spaceBetweenBallCenterWhenNumberBallIsKnown: n];
        if (space < _ballDiameter) {
            stop = true;
        }else{
            NSLog(@"Number of ball %d, space between ball center %.0f",n,space);
        }
        n++;
    }
}

-(void) drawMatrixOfBalls: (int) numberBallWidth and: (int) numberBallHeight {
    CGFloat spaceWidth = [self spaceBetweenBallCenterWhenNumberBallIsKnown:numberBallWidth];
    CGFloat spaceHeight = [self spaceBetweenBallCenterHeight:numberBallHeight];
    for (int i = 0; i < numberBallWidth; i++) {
        for (int j = 0; j < numberBallHeight; j++) {
            [self placeGrayBallAtX: _marginWidth + i * spaceWidth
                              andY: _marginHeight + j * spaceHeight
                           withTag:i+100];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
