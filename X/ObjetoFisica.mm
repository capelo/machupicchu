//
//  ObjetoFisica.m
//  X
//
//  Created by Roberto Capelo on 17/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import "ObjetoFisica.h"


@implementation ObjetoFisica

@synthesize nome;
@synthesize isDrag;

-(id) init
{
	if((self=[super init])){
		
		//[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
		
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
    self.isDrag=NO;
	CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
	
	if([self isTouchOnSprite:touchPoint]){
		whereTouch=ccpSub(self.position, touchPoint);
		return YES;
	}
	
	return NO;
}


- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.isDrag=YES;
}


- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.isDrag=NO;
}

@end
