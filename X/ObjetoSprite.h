//
//  ObjetoSprite.h
//  X
//
//  Created by Roberto Capelo on 09/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ObjetoSprite : CCSprite <CCTargetedTouchDelegate> {
    
    BOOL isOpen;
    CGPoint whereTouch;
    
}

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) ObjetoSprite *childObj;
@property (nonatomic) BOOL isDrag;

- (BOOL) isTouchOnSprite:(CGPoint)touch;


@end
