//
//  ObjetoTrocaPagina.h
//  X
//
//  Created by Roberto Capelo on 13/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ObjetoSprite.h"

@interface ObjetoTrocaPagina : CCSprite <CCTargetedTouchDelegate>{
    
    BOOL isDrag;
    BOOL isOpen;
    CGPoint whereTouch;
    
}

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *acao;
@property (nonatomic, retain) ObjetoSprite *childObj;

-(void)setDrag:(BOOL) bol;
-(BOOL)getIsDrag;

- (BOOL) isTouchOnSprite:(CGPoint)touch;


@end
