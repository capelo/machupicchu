//
//  ObjetoTrocaPagina.m
//  X
//
//  Created by Roberto Capelo on 13/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import "ObjetoTrocaPagina.h"


@implementation ObjetoTrocaPagina

@synthesize nome;
@synthesize childObj;
@synthesize acao;

-(id) init
{
	if((self=[super init])){
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
        setDrag:YES;
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
    
	CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
	
	if([self isTouchOnSprite:touchPoint]){
		whereTouch=ccpSub(self.position, touchPoint);
		return YES;
	}
	
	return NO;
}

-(void)setDrag:(BOOL) bol{
    isDrag=bol;
}

-(BOOL)getIsDrag{
    return isDrag;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (!isDrag){
        CGPoint touchPoint = [touch locationInView:[touch view]];
        touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
        self.position=ccpAdd(touchPoint,whereTouch);
	}
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.nome=acao;
}

@end
