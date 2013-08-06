//
//  ObjetoSpriteGira.h
//  X
//
//  Created by Roberto Capelo on 10/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ObjetoMuda.h"

@interface ObjetoSpriteGira : CCSprite <CCTargetedTouchDelegate>  {
    
    BOOL isDrag;
    BOOL isOpen;
    CGPoint whereTouch;
}
@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) ObjetoMuda *childObj;


- (BOOL) isTouchOnSprite:(CGPoint)touch;

@end
