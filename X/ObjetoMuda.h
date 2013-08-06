//
//  ObjetoMuda.h
//  X
//
//  Created by Roberto Capelo on 23/06/11.
//  Copyright 2011 Core do Brasil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ObjetoSprite.h"

@interface ObjetoMuda : CCSprite <CCTargetedTouchDelegate>{
    
    
    BOOL isOpen;
    CGPoint whereTouch;
    
    
}

- (BOOL) isTouchOnSprite:(CGPoint)touch;
- (void) nextImage;

@property (nonatomic, retain) NSMutableArray *imagensArray;

@end
