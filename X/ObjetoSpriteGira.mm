//
//  ObjetoSpriteGira.m
//  X
//
//  Created by Roberto Capelo on 10/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import "ObjetoSpriteGira.h"

@implementation ObjetoSpriteGira


@synthesize nome;
@synthesize childObj;

-(id) init
{
	if((self=[super init])){
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:1 swallowsTouches:YES];
		
	}
	return self;
}

-(BOOL) isTouchOnSprite:(CGPoint)touch{
	if(CGRectContainsPoint(CGRectMake(self.position.x - ((self.contentSize.width/2)*self.scale), self.position.y - ((self.contentSize.height/2)*self.scale), self.contentSize.width*self.scale, self.contentSize.height*self.scale), touch)) 
		return YES;
	else return NO;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"touchBEGAN GIRA");
    return YES;

}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{

    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    CGPoint shootVector = ccpSub(location, self.position);
    CGFloat shootAngle = ccpToAngle(shootVector);
    CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * shootAngle);
    
    CGFloat curAngle = self.rotation;
    CGFloat rotateDiff = cocosAngle - curAngle;    
    if (rotateDiff > 180)
		rotateDiff -= 360;
	if (rotateDiff < -180)
		rotateDiff += 360;
    
    CGFloat rotateSpeed = 400; // degrees per second
    CGFloat rotateDuration = fabs(rotateDiff / rotateSpeed);
    
    
    [self runAction:[CCSequence actions:
                     [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
                     [CCCallFunc actionWithTarget:self selector:@selector(spriteMoveFinished:) ],
                     nil]];
    
    [self setRotation:cocosAngle];
    
}

-(void)spriteMoveFinished:(id)sender {
    [childObj nextImage];
}

@end
