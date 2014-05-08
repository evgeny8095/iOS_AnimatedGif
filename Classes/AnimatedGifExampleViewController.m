//
//  AnimatedGifExampleViewController.m
//  AnimatedGifExample
//
//  Created by Stijn Spijker on 05-07-09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AnimatedGifExampleViewController.h"
#import "AnimatedGif.h"

static CGRect fileImageViewFrame = {{0.0f, 194.0f},{160.0f, 180.0f}};
static CGRect urlImageViewFrame = {{160.0f, 194.0f},{160.0f, 180.0f}};

@implementation AnimatedGifExampleViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    // First example, a local file
    NSURL 			* firstUrl = 		[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"apple_logo_animated" ofType:@"gif"]];
    UIImageView 	* firstAnimation = 	[AnimatedGif getAnimationForGifAtUrl: firstUrl];
    firstAnimation.frame =              fileImageViewFrame;
    
    // Second example, through HTTP
    NSURL 		* secondUrl = 			[NSURL URLWithString:@"http://www.gifs.net/Animation11/Food_and_Drinks/Fruits/Apple_jumps.gif"];
    UIImageView * secondAnimation = 	[AnimatedGif getAnimationForGifAtUrl: secondUrl];
    secondAnimation.frame =             urlImageViewFrame;
    
    // Add them to the view.
	[self.view addSubview:firstAnimation];
	[self.view addSubview:secondAnimation];
}

@end
