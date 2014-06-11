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

@implementation AnimatedGifExampleViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    /* First example, a local file */
    NSURL *localUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"apple_logo_animated" ofType:@"gif"]];
    UIImageView *localAnimation = [AnimatedGif getAnimationForGifAtUrl: localUrl];
    
    // For local files (that are loaded immediatly) you can request the size
    localAnimation.frame = CGRectMake(10.0f, 194.0f, localAnimation.image.size.width, localAnimation.image.size.height);
    

    /* Second example, through HTTP */
    NSURL *remoteUrl = [NSURL URLWithString:@"http://i.imgur.com/vnwRc8V.gif"];
    UIImageView *remoteAnimation = [AnimatedGif getAnimationForGifAtUrl: remoteUrl];
    
    // For remote files you will need to specify the size in advance, as iOS_AnimatedGif
    // does not support callbacks yet...
    remoteAnimation.frame = CGRectMake(170.0f, 194.0f, 140.0f, 180.0f);
    

    // Add both examples to the view.
	[self.view addSubview:localAnimation];
	[self.view addSubview:remoteAnimation];
}

@end
