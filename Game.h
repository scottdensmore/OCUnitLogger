//
//  Game.h
//  OCUnitLogger
//
//  Created by Scott Densmore on 8/18/10.
//  Copyright 2010 Scott Densmore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Scorer;

@interface Game : NSObject {
@private
	Scorer *scorer;
	int currentFrame;
	BOOL isFirstThrow;
}

@property (nonatomic, readonly, assign) int score;

- (void)addPins:(int)numberOfPins;
- (int)scoreForFrame:(int)theFrame;

@end
