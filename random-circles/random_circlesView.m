//
//  random_circlesView.m
//  random-circles
//
//  Created by A. J. Soria R. 27/09/2015.
//  Copyright © 2015 ajsoriar. All rights reserved.
//

#import "random_circlesView.h"

@implementation random_circlesView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0]; // Draw 30 frames per second
        //[self setAnimationTimeInterval:1/15.0]; // Draw 30 frames per second
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    
    NSBezierPath *path;
    NSRect rect;
    NSSize size;
    NSColor *color;
    float red, green, blue, alpha;
    
    size = [self bounds].size;
    
    // Calculate random width and height: rect.size = NSMakeSize( size.width, size.height );
    rect.size = NSMakeSize( SSRandomFloatBetween( size.width / 1.0, size.width / 10.0 ), SSRandomFloatBetween( size.height / 1.0, size.height / 10.0 ));
    
    path = [NSBezierPath bezierPathWithRect:rect];
    
    
    // Calculate a random color
    red = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    green = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    blue = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    alpha = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    color = [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
    
    
    [color set];
    
    // draw
    if (SSRandomIntBetween( 0, 1 ) == 0)
        [path fill];
    else
        [path stroke];

    
    /*
    color = [NSColor colorWithCalibratedRed:255.0 green:0.0 blue:0 alpha:255.0];
    [color set];
    
    //[path fill];
    [path stroke];
     */

    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
