//
//  HelloWorldLayer.h
//  Exercise7_Team6
//
//  Created by Brian Nguyen on 11/21/13.
//  Copyright cpl 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
   CCSprite *paddle1;
   CCSprite *paddle2;
   CCSprite *ball;
   int score;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
@property (nonatomic, retain) CCSprite *paddle1;
@property (nonatomic, retain) CCSprite *paddle2;
@property (nonatomic, retain) CCSprite *ball;

@end
