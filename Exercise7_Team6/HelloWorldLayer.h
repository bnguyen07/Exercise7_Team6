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
   CCSprite *_paddle1;
   CCSprite *_paddle2;
   CCSprite *_ball;
   CCAction *_ballMoveAction;
   CCAction *_paddle1MoveAction;
   CCAction *_paddle2MoveAction;
   int score;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
@property (nonatomic, retain) CCSprite *paddle1;
@property (nonatomic, retain) CCSprite *paddle2;
@property (nonatomic, retain) CCSprite *ball;
@property (nonatomic, retain) CCAction *ballMoveAction;
@property (nonatomic, retain) CCAction *paddle1MoveAction;
@property (nonatomic, retain) CCAction *paddle2MoveAction;


@end
