//
//  Scorer.m
//  Bowling
//
//  Created by Scott Densmore on 4/3/11.
//  Copyright 2011 Scott Densmore. All rights reserved.
//

#import "Scorer.h"


@implementation Scorer

#pragma mark -
#pragma mark Methods

- (BOOL)isStrike
{
	if (throws[ball] == 10){
		ball++;
		return YES;
    }
    return NO;
}

- (BOOL)isSpare
{
	if ((throws[ball] + throws[ball+1]) == 10) {
		ball += 2;
		return YES;
    }
    return NO;
}

- (int)nextTwoBalls 
{
	return throws[ball] + throws[ball+1];
}

- (int)nextBall
{
	return throws[ball];
}

- (int)twoBallsInFrame
{
	int ball1 = throws[ball++];
	int ball2 = throws[ball++];
	return ball1 + ball2;
}

- (void)addPins:(int)numberOfPins
{
	throws[currentThrow++] = numberOfPins;
}

- (int)scoreForFrame:(int)frame
{
	ball = 0;
    int frameScore = 0;
	
    for (int currentFrame = 0; currentFrame < frame; currentFrame++) {
		if ([self isStrike]) {
			frameScore += 10 + [self nextTwoBalls];
		} else if ([self isSpare]) {
			frameScore += 10 + [self nextBall];
		} else {
			frameScore += [self twoBallsInFrame];
		}
    }
	
    return frameScore;
}

@end
