//
//  Scorer.h
//  OCUnitLogger
//
//  Created by Scott Densmore on 8/20/10.
//  Copyright 2010 Scott Densmore. All rights reserved.
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
