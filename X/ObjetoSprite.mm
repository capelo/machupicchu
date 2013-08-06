//
//  ObjetoSprite.m
//  X
//
//  Created by Roberto Capelo on 09/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import "ObjetoSprite.h"



@implementation ObjetoSprite

@synthesize nome;
@synthesize childObj;
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
	
	self.position=ccpAdd(touchPoint,whereTouch);
    
    
	//NSLog(@"touchMOVED");
    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.isDrag=NO;
    
	//NSLog(@"touchended: %@",nome);
    if (!isOpen){
        //NSLog(@"touchended DIMINUI");
        [self runAction:[CCScaleTo actionWithDuration:0.3 scaleX:0.5 scaleY:0.5]];
        isOpen=TRUE;
    }else{
        //NSLog(@"touchended AUMENTA");
        isOpen=FALSE;
        [self runAction:[CCScaleBy actionWithDuration:0.3 scaleX:2.0 scaleY:2.0]];
    }
    
    if (childObj != nil){
        //NSLog(@"FILHO:::%@",childObj);
        [childObj runAction:[CCFadeOut actionWithDuration:5]];
    }
    
}

@end
