//
//  Game.m
//  Bowling
//
//  Created by Scott Densmore on 4/3/11.
//  Copyright 2011 Scott Densmore. All rights reserved.
//

#import "Game.h"
#import "Scorer.h"

@implementation Game

#pragma mark -
#pragma mark Properties
- (int)score
{
    return [self scoreForFrame:currentFrame];
}

#pragma mark -
#pragma mark Init / Dealloc
- (id) init
{
	self = [super init];
	if (self != nil) {
		currentFrame = 0;
		isFirstThrow = YES;
		scorer = [[Scorer alloc] init];
	}
	return self;
}

- (void) dealloc
{
	[scorer release];
	[super dealloc];
}


#pragma mark -
#pragma mark Game Methods
- (void)advanceFrame
{
	currentFrame = MIN(10, currentFrame + 1);
}

- (BOOL)adjustFrameForStrike:(int)pins
{
	if (pins == 10) {
		[self advanceFrame];
		return YES;
    }
    return NO;
}

- (void)adjustCurrentFrame:(int)pins
{
	if (isFirstThrow == YES) {
		//isFirstThrow = [self adjustFrameForStrike:pins];
		
		if ([self adjustFrameForStrike:pins] == NO) {
			isFirstThrow = NO;
		}
		
	} else {
		isFirstThrow = YES;
		[self advanceFrame];
    }
}

- (void)addPins:(int)pins
{
	[scorer addPins:pins];
    [self adjustCurrentFrame:pins];

}

- (int)scoreForFrame:(int)frame
{
	return [scorer scoreForFrame:frame];
}
@end
