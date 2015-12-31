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
        //[self setAnimationTimeInterval:1/30.0]; // Draw 30 frames per second
        [self setAnimationTimeInterval:1/60.0]; // Draw 30 frames per second
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
    int ancho = 5;
    
    NSBezierPath *path;
    NSRect rect;
    NSSize size;
    NSColor *color;
    float red, green, blue, alpha;
    
    size = [self bounds].size;
    
    // Calculate random width and height: rect.size = NSMakeSize( size.width, size.height );
    //rect.size = NSMakeSize( SSRandomFloatBetween( size.width / 1.0, size.width / 10.0 ), SSRandomFloatBetween( size.height / 1.0, size.height / 10.0 ));
    
    float tamanyo_y, tamanyo_x = SSRandomFloatBetween( size.width / 5, size.width / 30.0 );
    tamanyo_y = tamanyo_x;
    
    //SSRandomFloatBetween( size.height / 1.0, size.height / 10.0 )
    
    /*
     
     CGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
     {
     CGRect rect;
     rect.origin.x = x; rect.origin.y = y;
     rect.size.width = width; rect.size.height = height;
     return rect;
     }
     
     */
    
    /*
    rect.origin.x = 500;
    rect.origin.y = 500;
    rect.size = NSMakeSize( tamanyo_x , tamanyo_y );
    */
    float radio = tamanyo_x / 2;
    float origin_x = SSRandomFloatBetween( -radio, size.width - radio );
    float origin_y = SSRandomFloatBetween( -radio, size.height - radio );
    
    rect = NSMakeRect(origin_x, origin_y, tamanyo_x, tamanyo_y);
    
    path = [NSBezierPath bezierPathWithOvalInRect:rect];
    path.lineWidth = 2;
    //path = [NSBezierPath bezierPathWithRect:rect];
    
    path.lineWidth = ancho + 2; //4;
    
    [ [NSColor colorWithCalibratedRed:0 green:0 blue: 0 alpha:1.0] setStroke];
    
    [path stroke];
    
    
    path.lineWidth = ancho; //2;
    
    //[greenColor set];
    
    // Calculate a random color
    red = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    green = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    blue = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    alpha = 1; //SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    color = [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
    
    
    [color set];
    
    // draw
    
    /*
    if (SSRandomIntBetween( 0, 1 ) == 0)
        [path fill];
    else
        [path stroke];
    */
    
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
