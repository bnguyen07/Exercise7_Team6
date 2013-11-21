//
//  HelloWorldLayer.m
//  Exercise7_Team6
//
//  Created by Brian Nguyen on 11/21/13.
//  Copyright cpl 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer
int ballX;
int ballY;
@synthesize ball;
@synthesize paddle1;
@synthesize paddle2;
bool ballUp;
bool ballDown;
bool ballRight;
bool ballLeft;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
      score = 0;
		
		// create and initialize a Label
		//CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
      ball = [CCSprite spriteWithFile:@"GreenBall.png"];
      ball.position = ccp(150,150);
      paddle1 = [CCSprite spriteWithFile:@"paddle.png"];
      paddle1.position = ccp(0, 0);
      paddle2 = [CCSprite spriteWithFile:@"paddle.png"];
      paddle2.position = ccp(470, 0);

      //[ball setTextureRect:CGRectMake(10, 10, ball.contentSize.width/2, ball.contentSize.height/2)];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		
		// add the label as a child to this Layer
      [self addChild:ball];
      [self addChild:paddle1];
      [self addChild:paddle2];
//      [self performSelector:@selector(moveBall:) withObject:ball afterDelay:.005];


      ballUp = arc4random() % 2 ? true:false;
      if (ballUp) ballDown = false;
      ballRight = arc4random() %2 ? true:false;
      if (ballRight) ballLeft = false;
		
		
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		// to avoid a retain-cycle with the menuitem and blocks
		__block id copy_self = self;
		
//		// Achievement Menu Item using blocks
//		CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
//			
//			
//			GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
//			achivementViewController.achievementDelegate = copy_self;
//			
//			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
//			
//			[[app navController] presentModalViewController:achivementViewController animated:YES];
//			
//			[achivementViewController release];
//		}];
//		
//		// Leaderboard Menu Item using blocks
//		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
//			
//			
//			GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
//			leaderboardViewController.leaderboardDelegate = copy_self;
//			
//			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
//			
//			[[app navController] presentModalViewController:leaderboardViewController animated:YES];
//			
//			[leaderboardViewController release];
//		}];
//
//		
//		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
//		
//		[menu alignItemsHorizontallyWithPadding:20];
//		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
//		
//		// Add the menu to the layer
//		[self addChild:menu];

	}
	return self;
}

-(void)update:(ccTime)dt{
   [self performSelector:@selector(moveBall:) withObject:ball afterDelay:1.0];
}

- (void)moveBall:(ccTime)dt{
   //birdImage.position = ccp(image1.position.x + 100 * dt, birdImage.position.y);

   CGPoint point = ball.position;
   double xSpeed = 0, ySpeed = 0;

   if (ballRight)
     ballX += 1;
   else
      ballX -= 1;
   if (ballUp)
      ballY += 1;
   else
      ballY -= 1;
   
   xSpeed = (ball.position.x - ballX);
   ySpeed = (ball.position.y - ballY);
//   point.x += xSpeed * dt;
//   point.y += ySpeed * dt;
   point.x = ballX;
   point.y = ballY;
   
   NSLog(@"%f", xSpeed);
   NSLog(@"%f", ySpeed);
   ball.position = point;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
