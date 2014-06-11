iOS_AnimatedGif
===============

Animated GIF library for iPhone. Based on original work by Martin van Spanje.

This library aims to make use of animated GIF's on iOS a lot easier. It includes original code by Martin van Spanje that parsed GIFs with a lot of improvements by the open source community. This code now works according to GIF89a standards and supports transparency. LZW compression is not supported yet (pull requests welcome).

Example of use
--------------

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
	
Now also available as CocoaPod
------------------------------
Since CocoaPods have become more popular, this library has been added as a pod as well. You can include the following in your Podfile:

```Ruby
 pod iOS_AnimatedGif
```

License
---------
The MIT License 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: 

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. 

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Changelog
---------
2014-06-11: A lot of compilation warnings fixed + ARC'ified and modernization by github.com/eimantas
2010-03-16: Added queing mechanism for static class use
2010-01-24: Rework of the entire module, adding static methods, better memory management and URL asynchronous loading
2009-10-08: Added dealloc method, and removed leaks, by Pedro Silva
2009-08-10: Fixed double release for array, by Christian Garbers
2009-06-05: Initial Version
