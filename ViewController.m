//
//  ViewController.m
//  CrystalBall
//
//  Created by Kevin Lehtiniitty on 4/28/13.
//  Copyright (c) 2013 Kevin Lehtiniitty. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize predictionLabel;
@synthesize predictionArray;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    [self.view insertSubview:backgroundImageView atIndex:0];
    self.predictionArray = [[NSArray alloc] initWithObjects:
                            @"It is certain",
                            @"It is decidedly so",
                            @"All signs say YES",
                            @"The stars are not aligned",
                            @"My reply is no",
                            @"It is doubtful",
                            @"Better not tell you now",
                            @"Concentrate and ask again",
                            @"Unable to answer now", nil];
    
}

-(void)makePrediction {
    NSUInteger index = arc4random_uniform(self.predictionArray.count);
    self.predictionLabel.text = [self.predictionArray objectAtIndex:index];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    self.predictionLabel.text = @"";
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self makePrediction];
    }
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    self.predictionLabel.text = @"";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.predictionLabel.text = @"";
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self makePrediction];
}

@end