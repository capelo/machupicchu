//
//  ObjetoFisica.h
//  X
//
//  Created by Roberto Capelo on 17/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ObjetoFisica : CCSprite <CCTargetedTouchDelegate> {
        
        
        BOOL isOpen;
        CGPoint whereTouch;
        
}

@property (nonatomic, retain) NSString *nome;
@property (nonatomic) BOOL isDrag;
    
-(BOOL) isTouchOnSprite:(CGPoint)touch;


@end
