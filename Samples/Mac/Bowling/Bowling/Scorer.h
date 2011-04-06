//
//  Scorer.h
//  Bowling
//
//  Created by Scott Densmore on 4/3/11.
//  Copyright 2011 Scott Densmore. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Scorer : NSObject {
@private
	int ball;
	int throws[21];
	int currentThrow;
}

- (void)addPins:(int)numberOfPins;
- (int)scoreForFrame:(int)frame;

@end
