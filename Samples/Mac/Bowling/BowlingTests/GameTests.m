//
//  GameTests.m
//  OCUnitLogger
//
//  Created by Scott Densmore on 8/18/10.
//  Copyright 2010 Scott Densmore. All rights reserved.
//

#import "GameTests.h"
#import "Game.h"

@implementation GameTests

- (void)testOneThrowReturnsZeroForScore
{
	Game *game = [[[Game alloc] init] autorelease];
	
	[game addPins:5];
	
	STAssertEquals(0, game.score, @"");	
}

- (void)testOneThrowReturnsNumberOfPinsAsScoreForFrame
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:5];
	
	int frameScore = [game scoreForFrame:1];
	
	STAssertEquals(5, frameScore, @"");	
}

- (void)testTwoThrowsNoMarkSetsScoreForGame
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:5];
	[game addPins:4];
	
	int score = game.score;
	
	STAssertEquals(9, score, @"");	
}
	
- (void)testTwoThrowsNoMarkSetsScoreForFrame
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:5];
	[game addPins:4];
	
	int score = [game scoreForFrame:1];
	
	STAssertEquals(9, score, @"");	
}

- (void)testFourThrowsNoMarkSetsScoreForEachFrame
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:5];
	[game addPins:4];
	[game addPins:7];
	[game addPins:2];
	
	int frame1Score = [game scoreForFrame:1];
	int frame2Score = [game scoreForFrame:2];
	
	STAssertEquals(9, frame1Score, @"");
    STAssertEquals(18, frame2Score, @"");
}

- (void)testFourThrowsNoMarkSetsScoreForGame
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:5];
	[game addPins:4];
	[game addPins:7];
	[game addPins:2];

	int score = game.score;
	
	STAssertEquals(18, score, @"");	
}

- (void)testSimpleSpareSetsFrameScoreAfterNextThrow
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:3];
	[game addPins:7];
	[game addPins:3];
	
	int frame1Score = [game scoreForFrame:1];
	
	STAssertEquals(13, frame1Score, @"");
}

- (void)testSimpleFrameAfterSpareSetsScoreForEachFrame
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:3];
	[game addPins:7];
	[game addPins:3];
	[game addPins:2];
	
	int frame1Score = [game scoreForFrame:1];
	int frame2Score = [game scoreForFrame:2];
	
	STAssertEquals(13, frame1Score, @"");
	STAssertEquals(18, frame2Score, @"");
}

- (void)testSimpleFrameAfterSpareSetsScoreForGame
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:3];
	[game addPins:7];
	[game addPins:3];
	[game addPins:2];
	
	int score = [game score];
	
	STAssertEquals(18, score, @"");
}

- (void)testSimpleStrikeSetsFrameScoreAfterNexTwoThrows
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:10];
	[game addPins:3];
	[game addPins:6];
	
	int score = [game scoreForFrame:1];
	
	STAssertEquals(19, score, @"");
}

- (void)testSimpleStrikeSetsScoreAfterNexTwoThrows
{
	Game *game = [[[Game alloc] init] autorelease];
	[game addPins:10];
	[game addPins:3];
	[game addPins:6];
	
	int score = [game score];
	
	STAssertEquals(28, score, @"");
}


- (void)testPerfectGame
{
	Game *game = [[[Game alloc] init] autorelease];
	for (int i = 0; i < 12; i++) {
		[game addPins:10];
    }
	
	int score = [game score];
	
    STAssertEquals(300, score, @"");
}

- (void)testTenthFrameSpare
{
	Game *game = [[[Game alloc] init] autorelease];
	for (int i = 0; i < 9; i++) {
		[game addPins:10];
    }
	[game addPins:9];
	[game addPins:1];
	[game addPins:1];
	
	int score = [game score];
	
    STAssertEquals(270, score, @"");
}
@end
