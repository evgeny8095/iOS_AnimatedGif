//
//  AnimatedGif.m
//
//  Created by Stijn Spijker (http://www.stijnspijker.nl/) on 2009-07-03.
//  Based on gifdecode written april 2009 by Martin van Spanje, P-Edge media.
//  
//  Changes on gifdecode:
//  - Small optimizations (mainly arrays)
//  - Object Orientated Approach (Class Methods as well as Object Methods)
//  - Added the Graphic Control Extension Frame for transparancy
//  - Changed header to GIF89a
//  - Added methods for ease-of-use
//  - Added animations with transparancy
//  - No need to save frames to the filesystem anymore
//
//  Changelog:
//
//  2014-06-11: A lot of compilation warnings fixed + ARC'ified and modernization by github.com/eimantas
//  2010-03-16: Added queing mechanism for static class use
//  2010-01-24: Rework of the entire module, adding static methods, better memory management and URL asynchronous loading
//  2009-10-08: Added dealloc method, and removed leaks, by Pedro Silva
//  2009-08-10: Fixed double release for array, by Christian Garbers
//  2009-06-05: Initial Version
//
//  Released under MIT license, see https://github.com/scspijker/iOS_AnimatedGif
//

#ifdef TARGET_OS_IPHONE			
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif 	

@interface AnimatedGifQueueObject : NSObject
{
    UIImageView *uiv;
    NSURL *url;
}

@property (nonatomic, strong) UIImageView *uiv;
@property (nonatomic, strong) NSURL *url;

@end


@interface AnimatedGif : NSObject
{
	NSData *GIF_pointer;
	NSMutableData *GIF_buffer;
	NSMutableData *GIF_screen;
	NSMutableData *GIF_global;
	NSMutableData *GIF_frameHeader;
	
	NSMutableArray *GIF_delays;
	NSMutableArray *GIF_framesData;
    
    NSMutableArray *imageQueue;
	bool busyDecoding;
	
	int GIF_sorted;
	int GIF_colorS;
	int GIF_colorC;
	int GIF_colorF;
	int animatedGifDelay;
	
	int dataPointer;
    
    UIImageView *imageView;
}

@property (nonatomic, strong) UIImageView* imageView;
@property bool busyDecoding;

- (void) addToQueue: (AnimatedGifQueueObject *) agqo;
+ (UIImageView*) getAnimationForGifAtUrl: (NSURL *) animationUrl;
- (void) decodeGIF:(NSData *)GIF_Data;
- (void) GIFReadExtensions;
- (void) GIFReadDescriptor;
- (bool) GIFGetBytes:(long)length;
- (bool) GIFSkipBytes: (long) length;
- (NSMutableData*) getFrameAsDataAtIndex:(int)index;
- (UIImage*) getFrameAsImageAtIndex:(int)index;
- (UIImageView*) getAnimation;

@end
