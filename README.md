iOS_AnimatedGif
===============

Animated GIF library for iPhone. Based on original work by Martin van Spanje.

Original weblog post
--------------------

[http://blog.stijnspijker.nl/2009/07/animated-and-transparent-gifs-for-iphone-made-easy/](Animated and transparent GIF’s for iPhone made easy!) on http://blog.stijnspijker.nl/

I recently started developing for iPhone, and I was looking to include some simple animations into my applications, like a typical AJAX loading GIF when I’m waiting for my stream of data to come in.

It surprised me that nothing was available! After a lot of searching I found a block of code by Martin van Spanje from P-Edge. It was based on some PHP code, splitting an animated GIF in subframes.

The code worked, Martin stated it needed to be checked and optimized. So I went to work. I upped the code to the GIF 89a standards, I created a class out of it. Best of all, I got animation working WITH transparency! I believe in Apple’s idea of simplicity, so I made a set of interfaces that -anyone- should be able to use.

Example of use
--------------

    // First example, a local file
    NSURL* firstUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"apple_logo_animated" ofType:@"gif"]];
    UIImageView * firstAnimation = [AnimatedGif getAnimationForGifAtUrl: firstUrl];
 
    // Second example, through HTTP
    NSURL * secondUrl = [NSURL URLWithString:@"http://www.gifs.net/Animation11/Food_and_Drinks/Fruits/Apple_jumps.gif"];
    UIImageView * secondAnimation = [AnimatedGif getAnimationForGifAtUrl: secondUrl];
 
    // Add them to the view.
    [theFirstAnimatedGif addSubview:firstAnimation];
    [theSecondAnimatedGif addSubview:secondAnimation];

Changelog
---------

2012-11-14: Created GitHUB repo
2010-03-16: Added queing mechanism for static class use
2010-01-24: Rework of the entire module, adding static methods, better memory management and URL asynchronous loading
2009-10-08: Added dealloc method, and removed leaks, by Pedro Silva
2009-08-10: Fixed double release for array, by Christian Garbers
2009-06-05: Initial Version based on work by Martin van Spanje
