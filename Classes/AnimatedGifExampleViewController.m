//
//  AnimatedGifExampleViewController.m
//  AnimatedGifExample
//
//  Created by Stijn Spijker (http://stijnspijker.nl/) on 2009-07-03.
//  Based on gifdecode written april 2009 by Martin van Spanje, P-Edge media.
//
//  Released under MIT license, see https://github.com/scspijker/iOS_AnimatedGif
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
    NSURL 		* secondUrl = 			[NSURL URLWithString:@"http://i.imgur.com/vnwRc8V.gif"];
    UIImageView * secondAnimation = 	[AnimatedGif getAnimationForGifAtUrl: secondUrl];
    secondAnimation.frame =             urlImageViewFrame;
    
    // Add them to the view.
	[self.view addSubview:firstAnimation];
	[self.view addSubview:secondAnimation];
}

@end
