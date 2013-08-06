//
//  HelloWorldLayer.m
//  X
//
//  Created by Roberto Capelo on 30/05/11.
//  Copyright Core do Brasil 2011. All rights reserved.
//

#import "HelloWorldLayer.h"

#define PTM_RATIO 32

int iPedra=1;

@implementation HelloWorldLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"_El condor Pasa_.mp3" loop:TRUE];
        [SimpleAudioEngine sharedEngine].backgroundMusicVolume =1;

		self.isAccelerometerEnabled = NO;
		
        CGSize size = [[CCDirector sharedDirector] winSize];

        array = [[NSMutableArray alloc] init];   
        
        indice = [ObjetoTrocaPagina spriteWithFile: @"3_indice_texto.png"];
        [indice setDrag:YES];
        indice.position=ccp( size.width/2+320 , size.height -999 );
        indice.scaleX=0.5;
        indice.scaleY=0.5;
        indice.acao=@"vai";
        indice.nome=@"Objeto próxima página";
        
        [self reorderChild:indice z:1];
        [self addChild:indice];
        
        musica = [ObjetoTrocaPagina spriteWithFile: @"musicOff.png"];
        [musica setDrag:YES];
        musica.position=ccp( 170 , size.height -970 );
        musica.scaleX=1.2;
        musica.scaleY=1.2;
        musica.acao=@"play";
        musica.nome=@"play stop";
        
        [self reorderChild:musica z:1];
        [self addChild:musica];
        
        pagina=1;
        [self createPage1];
        
        [self schedule:@selector(update:) ];
        [self schedule:@selector(tick:)];
        
	}
	return self;
}

//indice
- (void)createPage1{
    
    musica.visible=YES;
    indice.visible=FALSE;
    self.isTouchEnabled = NO;
    self.isAccelerometerEnabled = NO;
    array = [[NSMutableArray alloc] init]; 
    
    CCSprite *titulo = [CCSprite spriteWithFile:@"3_indice_texto.png"];
    titulo.position=ccp(210,960);
    [array addObject:titulo];
    
    indice2 = [ObjetoTrocaPagina spriteWithFile:@"14_indice_foto_hiram.png"];
    indice2.position=ccp(590,380);
    indice2.acao=@"vai";
    [array addObject:indice2];
    
    ObjetoTrocaPagina *legenda2 = [ObjetoTrocaPagina spriteWithFile:@"15_indice_texto_hiram.png"];
    legenda2.position=ccp(580,250);
    [array addObject:legenda2];
    
    indice1 = [ObjetoTrocaPagina spriteWithFile:@"12_indice_foto_ciudadela_habitantes.png"];
    indice1.position=ccp(240,690);
    indice1.acao=@"vai";
    [array addObject:indice1];

    ObjetoTrocaPagina *legenda1 = [ObjetoTrocaPagina spriteWithFile:@"indice_texto_ciudadelahabitantes.png"];
    legenda1.position=ccp(240,480);
    [array addObject:legenda1];

    indice5 = [ObjetoTrocaPagina spriteWithFile:@"hiramIxCapelo.png"];
    indice5.position=ccp(570,550);
    indice5.acao=@"vai";
    [array addObject:indice5];
    
    indice3 = [ObjetoTrocaPagina spriteWithFile:@"17_indice_foto_pachacutec.png"];
    indice3.position=ccp(600,880);
    indice3.scaleX = 1.5;
    indice3.scaleY = 1.5;
    indice3.acao=@"vai";
    [array addObject:indice3];
    
    ObjetoTrocaPagina *legenda3 = [ObjetoTrocaPagina spriteWithFile:@"18_indice_texto_pachacutec.png"];
    legenda3.position=ccp(590,720);
    [array addObject:legenda3];
    
    indice4 = [ObjetoTrocaPagina spriteWithFile:@"10_indice_inti.png"];
    indice4.position=ccp(250,280);
    indice4.acao=@"vai";
    [array addObject:indice4];

    ObjetoTrocaPagina *legenda4 = [ObjetoTrocaPagina spriteWithFile:@"11_indice_texto_nuevamaravilla.png"];
    legenda4.position=ccp(230,160);
    [array addObject:legenda4];
    
    indice7 = [ObjetoTrocaPagina spriteWithFile:@"auspicios2.png"];
    indice7.position=ccp(610,150);
    [indice7 setDrag:TRUE];
    indice7.acao=@"vai";
    [array addObject:indice7];
    
    indice6 = [ObjetoTrocaPagina spriteWithFile:@"sobreCapelo.png"];
    indice6.position=ccp(530,30);
    [indice6 setDrag:TRUE];
    //indice6.scaleX = 0.5;
    //indice6.scaleY = 0.5;
    indice6.acao=@"vai";
    [array addObject:indice6];
  
    CCSprite *fundo = [CCSprite spriteWithFile:@"2_Indice_texturaCapelo.png"];
    fundo.position=ccp(380,510);
    [array addObject:fundo];
    
    unsigned count = [array count];
    while (count--) {
        id object = [array objectAtIndex:count];
        [self addChild:object];
        
    }
    [self setPagina:1];
    
}

//hiram gira
- (void)createPage2{
    musica.visible=YES;
    indice.visible=TRUE;
    self.isTouchEnabled = NO;
    self.isAccelerometerEnabled = NO;
    array = [[NSMutableArray alloc] init]; 
    
    CCSprite *titulo = [[CCSprite spriteWithFile:@"10_hiram_perfil_titulo.png"]autorelease];
    titulo.position=ccp(220,970);
    [array addObject:titulo];
    
    CCSprite *texto1 = [[CCSprite spriteWithFile:@"11_hiram_perfil_texto_1.png"]autorelease];
    texto1.position=ccp(580,710);
    texto1.scaleX=0.9;
    texto1.scaleY=0.9;
    [array addObject:texto1];

    CCSprite *texto2 = [[CCSprite spriteWithFile:@"12_hiram_perfil_texto_22.png"]autorelease];
    texto2.position=ccp(395,280);
    texto2.scaleX=0.9;
    texto2.scaleY=0.9;
    [array addObject:texto2];
    
    
    ObjetoMuda *objx = [[ObjetoMuda spriteWithFile: @"6.png"]autorelease];
    objx.position=ccp(200,680);

    NSMutableArray *imagens = [[[NSMutableArray alloc] init]autorelease]; 
    [imagens addObject:@"..."];
    [imagens addObject:@"1.png"];
    [imagens addObject:@"2.png"];
    [imagens addObject:@"3.png"];
    [imagens addObject:@"4.png"];
    [imagens addObject:@"5.png"];
    [imagens addObject:@"6.png"];    
    
    objx.imagensArray = imagens;
    
    [array addObject:objx];

    ObjetoSpriteGira *objRoda = [[ObjetoSpriteGira spriteWithFile:@"gira.png"]autorelease];
    objRoda.nome=@"Timao";
    objRoda.childObj = objx;
    objRoda.position=ccp(400,40);
    //objRoda.scaleX=0.8;
    //objRoda.scaleY=0.8;
    [array addObject:objRoda];
    
    CCSprite *fundo = [[CCSprite spriteWithFile:@"08_hiram_perfil_fondotextura.png"]autorelease];
    fundo.position=ccp(380,510);
    [array addObject:fundo];
    
    unsigned count = [array count];
    while (count--) {
        id object = [array objectAtIndex:count];
        [self addChild:object];
    }
    [self setPagina:2];

}
//pachacutec
- (void)createPage3{
    
    musica.visible=YES;
    indice.visible=TRUE;
    self.isTouchEnabled = NO;
    self.isAccelerometerEnabled = NO;
    array = [[NSMutableArray alloc] init];   
        
    CCSprite *titulo = [CCSprite spriteWithFile:@"06_pachacutec_texto_titulo.png"];
    titulo.position=ccp(385,970);
    [array addObject:titulo];
    
    CCSprite *texto1 = [CCSprite spriteWithFile:@"03_pachacute_texto_cursiva.png"];
    texto1.position=ccp(385,540);
    [array addObject:texto1];
    
    CCSprite *texto2 = [CCSprite spriteWithFile:@"05_pachacutec_texto_largo.png"];
    texto2.position=ccp(385,280);
    [array addObject:texto2];
    
    
    CCSprite *flecha = [CCSprite spriteWithFile:@"02_pachacutec_flecha.png"];
    flecha.position=ccp(30,650);
    [array addObject:flecha];
    
    
    CCSprite *fundo = [CCSprite spriteWithFile:@"01_pachacutec_textura_hole6.png"];
    fundo.position=ccp(385,510);
    [array addObject:fundo];
    
    ObjetoPanoramico *pam = [ObjetoPanoramico spriteWithFile:@"100anos_machupichu_final.jpg"];
    pam.nome=@"panoramico";
    pam.scaleX=1.5;
    pam.scaleY=1.5;
    pam.position=ccp(300,750);
    [array addObject:pam];

    unsigned count = [array count];
    while (count--) {
        id object = [array objectAtIndex:count];
        [self addChild:object];
        
    }
    [self setPagina:3];
}

//hiran desenho
- (void)createPage4{
    musica.visible=YES;
    indice.visible=TRUE;
    self.isTouchEnabled = NO;
    self.isAccelerometerEnabled = NO;
    array = [[NSMutableArray alloc] init];   
    
    CCSprite *titulo = [CCSprite spriteWithFile:@"07_hiram_texto_titulo.png"];
    titulo.position=ccp(385,970);
    [array addObject:titulo];
    
    CCSprite *texto1 = [CCSprite spriteWithFile:@"06_hiram_texto.png"];
    texto1.position=ccp(385,520);
    [array addObject:texto1];

    CCSprite *texto2 = [CCSprite spriteWithFile:@"03_hiram_cursiva_fuesenador.png"];
    texto2.position=ccp(400,100);
    [array addObject:texto2];
    
    CCSprite *texto3 = [CCSprite spriteWithFile:@"02_hiram_cursiva_fuegovernador.png"];
    texto3.position=ccp(500,70);
    [array addObject:texto3];
    
    ObjetoSprite *foto = [ObjetoSprite spriteWithFile:@"05_hiram_fotoprincipal.png"];
    foto.position=ccp(240,640);
    [array addObject:foto];
    
    CCSprite *flecha = [CCSprite spriteWithFile:@"04_hiram_flecha.png"];
    flecha.position=ccp(30,110);
    [array addObject:flecha];

    CCSprite *fundo = [CCSprite spriteWithFile:@"01_hiram_textura.png"];
    fundo.position=ccp(380,510);
    [array addObject:fundo];
    
    unsigned count = [array count];
    while (count--) {
        id object = [array objectAtIndex:count];
        [self addChild:object];
        
    }

    [self setPagina:4];
}

//pedrinhas
- (void)createPage5{
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    // Define the gravity vector.
    b2Vec2 gravity;
    gravity.Set(0.0f, -10.0f);
    
    // Do we want to let bodies sleep?
    // This will speed up the physics simulation
    bool doSleep = true;
    
    // Construct a world object, which will hold and simulate the rigid bodies.
    world = new b2World(gravity, doSleep);
    world->SetContinuousPhysics(true);
    
    // Define the ground body.
    b2BodyDef groundBodyDef;
    groundBodyDef.position.Set(0, 0); // bottom-left corner
    
    // Call the body factory which allocates memory for the ground body
    // from a pool and creates the ground box shape (also from a pool).
    // The body is also added to the world.
    b2Body* groundBody = world->CreateBody(&groundBodyDef);
    
    // Define the ground box shape.
    b2PolygonShape groundBox;		
    
    // bottom
    
    groundBox.SetAsEdge(b2Vec2(0,0), b2Vec2(size.width/PTM_RATIO,0));
    groundBody->CreateFixture(&groundBox,0);
    
    // top
    groundBox.SetAsEdge(b2Vec2(0,size.height/PTM_RATIO), b2Vec2(size.width/PTM_RATIO,size.height/PTM_RATIO));
    groundBody->CreateFixture(&groundBox,0);
    
    // left
    groundBox.SetAsEdge(b2Vec2(0,size.height/PTM_RATIO), b2Vec2(0,0));
    groundBody->CreateFixture(&groundBox,0);
    
    // right
    groundBox.SetAsEdge(b2Vec2(size.width/PTM_RATIO,size.height/PTM_RATIO), b2Vec2(size.width/PTM_RATIO,0));
    groundBody->CreateFixture(&groundBox,0);
    

    musica.visible=NO;
    indice.visible=YES;
    self.isTouchEnabled = YES;
    self.isAccelerometerEnabled = YES;
    array = [[NSMutableArray alloc] init];   

    CCSprite *titulo = [CCSprite spriteWithFile:@"09_pachacutec_perfil_titulo.png"];
    titulo.position=ccp(150,950);
    [array addObject:titulo];
    
    CCSprite *foto = [CCSprite spriteWithFile:@"08_pachacute_retrato.png"];
    foto.position=ccp(180,740);
    foto.scaleX=0.8;
    foto.scaleY=0.8;
    [array addObject:foto];
    
    CCSprite *texto1 = [CCSprite spriteWithFile:@"11_pachacutec_perfil_texto_1.png"];
    texto1.position=ccp(560,720);
    texto1.scaleX=0.9;
    texto1.scaleY=0.9;
    [array addObject:texto1];

    CCSprite *texto2 = [CCSprite spriteWithFile:@"10_pachacutec_perfil_texto_2.png"];
    texto2.position=ccp(382,340);
    texto2.scaleX=0.9;
    texto2.scaleY=0.9;
    [array addObject:texto2];

    
    CCSprite *fundo = [CCSprite spriteWithFile:@"07_pachacutec_perfil_textura.png"];
    fundo.position=ccp(385,510);
    [array addObject:fundo];
    
    unsigned count = [array count];
    while (count--) {
        id object = [array objectAtIndex:count];
        [self addChild:object];
        
    }

    ObjetoFisica *objFisica = [ObjetoFisica spriteWithFile:@"pedra1ok.png"];
    objFisica.position=ccp( size.width /2 , size.height/2 );
    [array addObject:objFisica];
    
    [self addChild:objFisica];
    
    objFisica.position = ccp( objFisica.position.x, objFisica.position.y);
	
    [self setPagina:5];

	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	bodyDef.position.Set(objFisica.position.x/PTM_RATIO, objFisica.position.y/PTM_RATIO);
	bodyDef.userData = objFisica;
	b2Body *body = world->CreateBody(&bodyDef);
	
	// Define another box shape for our dynamic body.
	b2PolygonShape dynamicBox;
	dynamicBox.SetAsBox(1.3f, 1.3f);//These are mid points for our 1m box
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicBox;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
	body->CreateFixture(&fixtureDef);
    
    addNewSpriteWithCoords:ccp( size.width /2 , size.height/2 );
}

//sobre
- (void)createPage6{
    indice.visible=TRUE;
    self.isTouchEnabled = NO;
    self.isAccelerometerEnabled = NO;
    array = [[NSMutableArray alloc] init];   
       
    CCSprite *fundo = [CCSprite spriteWithFile:@"About_usCapelo2.jpg"];
    fundo.position=ccp(380,510);
    [array addObject:fundo];
    
    unsigned count = [array count];
    while (count--) {
        id object = [array objectAtIndex:count];
        [self addChild:object];
    }
    
    [self setPagina:6];
}

//patrocinio
- (void)createPage7{
    indice.visible=TRUE;
    self.isTouchEnabled = NO;
    self.isAccelerometerEnabled = NO;
    array = [[NSMutableArray alloc] init];   
    
    CCSprite *fundo = [CCSprite spriteWithFile:@"07_pachacutec_perfil_textura.png"];
    fundo.position=ccp(380,510);
    [array addObject:fundo];
    
    unsigned count = [array count];
    while (count--) {
        id object = [array objectAtIndex:count];
        [self addChild:object];
    }
    
    [self setPagina:7];
}

- (void)createPage8{
    indice.visible=TRUE;
    self.isTouchEnabled = NO;
    self.isAccelerometerEnabled = NO;
    array = [[NSMutableArray alloc] init];   
    
    CCSprite *fundo = [CCSprite spriteWithFile:@"07_pachacutec_perfil_textura.png"];
    fundo.position=ccp(380,510);
    [array addObject:fundo];
    
    unsigned count = [array count];
    while (count--) {
        id object = [array objectAtIndex:count];
        [self addChild:object];
    }

    [self setPagina:8];
}

- (void)setPagina:(int)numero{
    pagina = numero;
}
- (int)Pagina{
    return pagina;
}
- (void)limpaTela{
    
    unsigned count = [array count];
    while (count--) {
        id object = [array objectAtIndex:count];
        [self removeChild:object cleanup:TRUE];
        //[array removeObjectAtIndex:count];
    }
     
}

- (void)update:(ccTime)dt {
    
    if (indice.nome==@"vai"){
        
        indice.nome=nil;
        [self limpaTela];
        [self createPage1];

    }else if(musica.nome==@"play"){
        if (pagina !=5){
            musica.nome=nil;
        
            if ([SimpleAudioEngine sharedEngine].backgroundMusicVolume ==1){
                [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
                [SimpleAudioEngine sharedEngine].backgroundMusicVolume =0;

                CCTexture2D* tex = [[CCTextureCache sharedTextureCache] addImage:@"musicOn.png"];
                [musica setTexture: tex];
            }else{
                [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"_El condor Pasa_.mp3" loop:TRUE] ;
                [SimpleAudioEngine sharedEngine].backgroundMusicVolume =1;
                CCTexture2D* tex = [[CCTextureCache sharedTextureCache] addImage:@"musicOff.png"];
                [musica setTexture: tex];
            }
        }
    }
    
    if (pagina==1){
        indice.visible=FALSE;
        
        if(indice1.nome ==@"vai"){
            indice1.nome=nil;
            [self limpaTela];
            [self createPage3];
        }else if(indice2.nome ==@"vai"){
            indice2.nome=nil;
            [self limpaTela];
            [self createPage2];
        }else if(indice3.nome ==@"vai"){
            indice3.nome=nil;
            [self limpaTela];
            [self createPage5];
        }else if(indice4.nome ==@"vai"){
            indice4.nome=nil;
            [self limpaTela];
            [self createPage8];
        }else if(indice5.nome ==@"vai"){
            indice5.nome=nil;
            [self limpaTela];
            [self createPage4];
        }else if(indice6.nome ==@"vai"){
            indice6.nome=nil;
            [self limpaTela];
            [self createPage6];
        }else if(indice7.nome ==@"vai"){
            indice7.nome=nil;
            [self limpaTela];
            [self createPage7];
        }
    }    
    
}


- (void) registerWithTouchDispatcher{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
    ObjetoFisica *pb = [array objectAtIndex:0];
	if([self isTouchOnSpriteObj:touchPoint objeto:pb]){
		whereTouch=ccpSub(pb.position, touchPoint);
		return YES;
	}
	
	return YES;
}

int cont=0;

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    cont++;
	
    CGPoint location = [touch locationInView: [touch view]];
    location = [[CCDirector sharedDirector] convertToGL: location];
    
    if([self isTouchOnSprite:location]){
		indice.nome = @"vai";
	}else{
        if (pagina==5){
            [self addNewSpriteWithCoords: location];
        }
    }
    
}

-(void) addNewSpriteWithCoords:(CGPoint)p
{

    b2PolygonShape dynamicBox;
    
    iPedra++;
    if (iPedra==1){
        dynamicBox.SetAsBox(1.3f, 1.3f);
    }else if (iPedra==2){
        dynamicBox.SetAsBox(1.1f, 1.1f);
    }else if (iPedra==3){
        dynamicBox.SetAsBox(1.0f, 1.0f);
    }else{
        dynamicBox.SetAsBox(1.3f, 1.3f);
        iPedra=1;
    }
    
	ObjetoFisica *objFisica = [ObjetoFisica spriteWithFile:[NSString stringWithFormat:@"pedra%iok.png", iPedra]];
    
    objFisica.nome=@"fisico";

    [array addObject:objFisica];
    
    [self addChild:objFisica];
    
	objFisica.position = ccp( p.x, p.y);
	
	// Define the dynamic body.
	//Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	bodyDef.position.Set(p.x/PTM_RATIO, p.y/PTM_RATIO);
	bodyDef.userData = objFisica;
	b2Body *body = world->CreateBody(&bodyDef);
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicBox;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
	body->CreateFixture(&fixtureDef);
}



-(void) tick: (ccTime) dt
{
    if (pagina ==5){

        //It is recommended that a fixed time step is used with Box2D for stability
        //of the simulation, however, we are using a variable time step here.
        //You need to make an informed choice, the following URL is useful
        //http://gafferongames.com/game-physics/fix-your-timestep/
        
        int32 velocityIterations = 8;
        int32 positionIterations = 1;
        
        // Instruct the world to perform a single step of simulation. It is
        // generally best to keep the time step and iterations fixed.
        world->Step(dt, velocityIterations, positionIterations);
        
        
        //Iterate over the bodies in the physics world
        for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
        {
            if (b->GetUserData() != NULL) {
                //Synchronize the AtlasSprites position and rotation with the corresponding body
                CCSprite *myActor = (CCSprite*)b->GetUserData();
                myActor.position = CGPointMake( b->GetPosition().x * PTM_RATIO, b->GetPosition().y * PTM_RATIO);
                myActor.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
            }	
        }
        
    }
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{	
	
    static float prevX=0, prevY=0;
	
	//#define kFilterFactor 0.05f
#define kFilterFactor 1.0f	// don't use filter. the code is here just as an example
	
	float accelX = (float) acceleration.x * kFilterFactor + (1- kFilterFactor)*prevX;
	float accelY = (float) acceleration.y * kFilterFactor + (1- kFilterFactor)*prevY;
	
	prevX = accelX;
	prevY = accelY;
	
	b2Vec2 gravity( accelX * 10, accelY * 10);
	
	world->SetGravity( gravity );
     
}

-(BOOL) isTouchOnSprite:(CGPoint)touch{
    
	if(CGRectContainsPoint(CGRectMake(indice.position.x - ((indice.contentSize.width/2)*indice.scale), indice.position.y - ((indice.contentSize.height/2)*indice.scale), indice.contentSize.width*indice.scale, indice.contentSize.height*indice.scale), touch)) 
		return YES;
	else return NO;
}


-(BOOL) isTouchOnSpriteObj:(CGPoint)touch objeto:(ObjetoFisica*)obj{
    
	if(CGRectContainsPoint(CGRectMake(obj.position.x - ((obj.contentSize.width/2)*obj.scale), obj.position.y - ((obj.contentSize.height/2)*obj.scale), obj.contentSize.width*obj.scale, obj.contentSize.height*obj.scale), touch)) 
		return YES;
	else return NO;
}

- (int)buscaSelecionada:(CGPoint)touch{
    
    unsigned count = [array count];
    
    while (count--) {
        
        ObjetoFisica *object = [array objectAtIndex:count];
        
        if ([object isKindOfClass:[ObjetoFisica class]]){
            
            if ([self isTouchOnSpriteObj:touch objeto:object]){
                return count;
            }
        }
    }
    return 0;
}

- (void) dealloc
{

    [indice release];
    [musica release];
    
    [indice1 release];
    [indice2 release];
    [indice3 release];
    [indice4 release];
    [indice5 release];
    [indice6 release];
    [array release];

	[super dealloc];
}
@end
