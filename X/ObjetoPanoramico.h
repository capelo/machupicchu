//
//  ObjetoPanoramico.h
//  X
//
//  Created by Roberto Capelo on 28/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ObjetoPanoramico : CCSprite <CCTargetedTouchDelegate>{
    
    
    BOOL isOpen;
    CGPoint whereTouch;
    
    
}

- (BOOL) isTouchOnSprite:(CGPoint)touch;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic) BOOL isDrag;

@end
