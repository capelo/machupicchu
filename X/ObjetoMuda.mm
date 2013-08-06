//
//  ObjetoMuda.m
//  X
//
//  Created by Roberto Capelo on 23/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import "ObjetoMuda.h"


@implementation ObjetoMuda

@synthesize imagensArray;

-(id) init
{
	if((self=[super init])){
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:1 swallowsTouches:YES];
		
       
        for(int conta=0;conta<[imagensArray count];conta++){
            //NSLog(@"==>%@",[imagensArray objectAtIndex:conta]);
            CCTexture2D* tex = [[CCTextureCache sharedTextureCache] addImage:[imagensArray objectAtIndex:conta]];
            [self setTexture: tex];
        }
        
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

    //self.isDrag=NO;
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

	CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
	self.position=ccpAdd(touchPoint,whereTouch);
}

int nFoto=1;
int aFoto=1;

- (void) nextImage{
    nFoto++;
    int rFoto = nFoto/10;

    if (rFoto>1){   
        nFoto=0;
    
        CCTexture2D* tex = [[CCTextureCache sharedTextureCache] addImage:[imagensArray objectAtIndex:aFoto]];
        
        [self setTexture: tex];
        
        if (aFoto == [imagensArray count]-1) 
            aFoto = 1;
        else
            aFoto++;
    }
}


@end
