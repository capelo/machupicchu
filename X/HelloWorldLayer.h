//
//  HelloWorldLayer.h
//  X
//
//  Created by Roberto Capelo on 30/05/11.
//  Copyright Core do Brasil 2011. All rights reserved.
//

#import "cocos2d.h"
#import "ObjetoSprite.h"
#import "ObjetoSpriteGira.h"
#import "ObjetoTrocaPagina.h"
#import "ObjetoFisica.h"
#import "ObjetoMuda.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "SimpleAudioEngine.h"
#import "ObjetoPanoramico.h"

@interface HelloWorldLayer : CCLayer
{
    
    b2World* world;
    
    ObjetoTrocaPagina *indice;
    ObjetoTrocaPagina *musica;
    
    ObjetoTrocaPagina *indice1;
    ObjetoTrocaPagina *indice2;
    ObjetoTrocaPagina *indice3;
    ObjetoTrocaPagina *indice4;
    ObjetoTrocaPagina *indice5;
    ObjetoTrocaPagina *indice6;
    ObjetoTrocaPagina *indice7;
    ObjetoTrocaPagina *indice8;
    
    NSMutableArray *array;
    
    CGPoint whereTouch;
    int pagina;
}

- (void)setPagina:(int)numero;
- (int)Pagina;

+(CCScene *) scene;

- (void)limpaTela;

- (void)createPage1;
- (void)createPage2;
- (void)createPage3;
- (void)createPage4;
- (void)createPage5;
- (void)createPage6;
- (void)createPage7;
- (void)createPage8;

- (int)buscaSelecionada:(CGPoint)touch;
- (BOOL) isTouchOnSprite:(CGPoint)touch;
- (BOOL) isTouchOnSpriteObj:(CGPoint)touch objeto:(ObjetoFisica*)obj;
- (void) addNewSpriteWithCoords:(CGPoint)p;

@end
