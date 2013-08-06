//
//  ObjetoPanoramico.m
//  X
//
//  Created by Roberto Capelo on 28/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import "ObjetoPanoramico.h"


@implementation ObjetoPanoramico
@synthesize nome;
@synthesize isDrag;

-(id) init
{
	if((self=[super init])){
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
		
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
    //NSLog(@"touchBEGIN");
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
    
	CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
    CGPoint point;
    
    //point =ccpAdd(touchPoint.x, 800);
    point.x = touchPoint.x;
    point.y = 800;

    whereTouch.y = -49;
    
    self.position=ccpAdd(whereTouch ,point);
    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.isDrag=NO;
    
    
    CGPoint point;
    
    point.x = 700;
    point.y = 800;
    
    
    if (self.position.x>770){
        whereTouch.y = -49;
        whereTouch.x = 79;
        self.position=ccpAdd(whereTouch ,point);    
    }else if(self.position.x<0){
        whereTouch.y = -49;
        whereTouch.x = -710;
        self.position=ccpAdd(whereTouch ,point);
    }    
}

@end
