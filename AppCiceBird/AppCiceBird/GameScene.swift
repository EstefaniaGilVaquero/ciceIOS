//
//  GameScene.swift
//  AppCiceBird
//
//  Created by CICE on 21/9/16.
//  Copyright (c) 2016 CICE. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    //MARK: - VARIABLES LOCALES
    //Un SpriteKit es un nodo que dibuja una imagen texturizada, tambien puede 
    //proporcionarnos un sombreado personalizaeo
    
    var background = SKSpriteNode()
    var bird = SKSpriteNode()
    var pipeFinal1 = SKSpriteNode()
    var pipeFinal2 = SKSpriteNode()
    var limitLand = SKNode()
    var timer = NSTimer()
    
    //Grupos colisiones
    let birdGroup : UInt32 = 1 //1 << 0
    let objectsGroup : UInt32 = 2 // 1 << 1
    let gapGroup : UInt32 = 4 // 1 << 2
    var movingGroup = SKNode()
    
    //GRUPO LABELS
    var score = 0
    var scoreLabel = SKLabelNode()
    var gameOverLabel = SKLabelNode()
    var gameOver = false
    
    
    
    //MARK: - LLAMADA CUANDO LA VISTA SE HA MODIFICADO
    
    override func didMoveToView(view: SKView) {
        //Definimos quien es el delegado para tener en cuenta las colisiones
        self.physicsWorld.contactDelegate = self
        //Aqui manipulo la gravedad
        self.physicsWorld.gravity = CGVectorMake(0, -5.0)
        
        //Añado el supergrupo de movimiento
        self.addChild(movingGroup)
        
        makeLimitLan()
        makeBackground()
        makeLoopPice1and2()
        makeBird()
        makeLabel()
    }
    
    //MARK:  - TEST DE LOS CONTACTOS / COLISIONIES
    func didBeginContact(contact: SKPhysicsContact) {
        
        if contact.bodyA.categoryBitMask == gapGroup || contact.bodyB.categoryBitMask == gapGroup{
            score += 1
            scoreLabel.text = "\(score)"
        }else if !gameOver{
            gameOver = true
            movingGroup.speed = 0
            timer.invalidate()
            makeLabelGameOver()
        }
    }
    
    //MARK: - LLAMADA CUANDO LOS TOQUES COMIENZAN
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !gameOver{
            //Realizamos un reset de la posicion y velocidad del pajaro
            bird.physicsBody?.velocity = CGVectorMake(0, 0)
            //Le proporciono un pequeño impulso al pajaro
            bird.physicsBody?.applyImpulse(CGVectorMake(0, 70))
        }else{
            resetGame()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    //MARK: - UTILS
    
    func makeLimitLan(){
        //Le decimos que la linea de la posicion de la tierra es abajo a la izquierda
        limitLand.position = CGPointMake(0, 0)
        //Asignamos las fisicas
        limitLand.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        //si es dinamico o no
        limitLand.physicsBody?.dynamic = false
            //GRUPO COLISIONES
            limitLand.physicsBody?.categoryBitMask = objectsGroup
        
        
        //Nos aseguramos de la posicion
        limitLand.zPosition = 3
        self.addChild(limitLand)
    }
    
    
    
    //MARK: - HACEMOS EL BACKGROUND
    func makeBackground(){
        
        //1. Creamos la textura
        let backgroundFinal = SKTexture(imageNamed: "bg.png")
        //2. Posicion abstracta
        
        //3. Ajustamos la altura del bd segun dispositivo
        
        //4. Dotamos de movimiento a background
        let moveBackground = SKAction.moveByX(-backgroundFinal.size().width, y: 0, duration: 9)
        let replaceBackground = SKAction.moveByX(backgroundFinal.size().width, y: 0, duration: 0)
        let moveBackgroundForever = SKAction.repeatActionForever(SKAction.sequence([moveBackground,replaceBackground]))
        
        for indice in 0..<3{
            background = SKSpriteNode(texture: backgroundFinal)
            background.position = CGPoint(x: (backgroundFinal.size().width / 2) + (backgroundFinal.size().width * CGFloat(indice)), y: CGRectGetMidY(self.frame))
            //Posicion abstracta eje z
            background.zPosition = 1
            background.size.height = self.frame.height
            //Ejecuto la accion
            background.runAction(moveBackgroundForever)
            self.movingGroup.addChild(background)
        }
        
    }
    
    //MARK: - HACEMOS LAS TUBERIAS
    func makePipesFinal(){
        
        //VARIABLES INTERNAS
        let gapHeight = bird.size.height * 4
        //Cuanto se van a mover las tuberias tanto para arriba como para abajo
        //Me devuelve un numero entre 0 y la mitad de la pantalla
        let movementAmount = arc4random_uniform(UInt32(self.frame.size.height / 2))
        //creamos el desplazamiento de la tuberia, que está entre 0 y la mitad de la pantalla, pero le resto un cuarto de esta
        let pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4
        
        //Movemos las tuberias
        let movePipes = SKAction.moveByX(-self.frame.width - 100, y: 0, duration: NSTimeInterval(self.frame.width / 900))
        let removePipes = SKAction.removeFromParent()
        let moveAndRemovePipes = SKAction.sequence([movePipes,removePipes])
        
        //Creamos la textura
        let pipeTexture1 = SKTexture(imageNamed: "pipe1.png")
        let pipeTexture2 = SKTexture(imageNamed: "pipe2.png")
        pipeFinal1 = SKSpriteNode(texture: pipeTexture1)
        pipeFinal2 = SKSpriteNode(texture: pipeTexture2)
        pipeFinal1.position = CGPointMake(self.frame.width + 50, CGRectGetMidY(self.frame) + (pipeFinal1.size.height / 2) + (gapHeight / 2) + pipeOffset )
        pipeFinal2.position = CGPointMake(self.frame.width + 50 , CGRectGetMidY(self.frame) - (pipeFinal1.size.height / 2) - (gapHeight / 2) + pipeOffset)
        
        
        //Guizmo de las tuberias
        pipeFinal1.physicsBody = SKPhysicsBody(rectangleOfSize: pipeFinal1.size)
        pipeFinal2.physicsBody = SKPhysicsBody(rectangleOfSize: pipeFinal2.size)
        
        //Dinamicas
        pipeFinal1.physicsBody?.dynamic = false
        pipeFinal1.runAction(moveAndRemovePipes)
        pipeFinal2.physicsBody?.dynamic = false
        pipeFinal2.runAction(moveAndRemovePipes)
        
            //GRUPO COLISIONES
            pipeFinal1.physicsBody?.categoryBitMask = objectsGroup
            pipeFinal2.physicsBody?.categoryBitMask = objectsGroup
        
        pipeFinal1.zPosition = 5
        pipeFinal2.zPosition = 5
        self.movingGroup.addChild(pipeFinal1)
        self.movingGroup.addChild(pipeFinal2)
        //GRUPO DE COLISION EN EL HUECO QUE ATRAVIESA EL PAJARO
        makeGapNode(pipeOffset,gapHeight: gapHeight, moveAndRemovePipes: moveAndRemovePipes)
    
        
        
    }
    
    
    //MARK: - HACEMOS EL GAPNODE DE COLISION Y SUMA DE PUNTOS
    func makeGapNode(pipeOffSet : CGFloat, gapHeight : CGFloat, moveAndRemovePipes : SKAction){
        let gap = SKNode()
        gap.position = CGPointMake(self.frame.width + 50, CGRectGetMidY(self.frame) + pipeOffSet)
        gap.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(pipeFinal1.size.width, gapHeight))
        gap.physicsBody?.dynamic = false
        gap.runAction(moveAndRemovePipes)
        gap.zPosition = 30
        gap.physicsBody?.categoryBitMask = gapGroup
        self.movingGroup.addChild(gap)
    
    }
    
    
    //MARK: HACEMOS EL PAJARO VOLANDO
    func makeBird(){
        
        //1 Creacion de texturas
        let birdTexture1 = SKTexture(imageNamed: "flappy1.png")
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        //2. Accion(SKSCene)
        let animationBird = SKAction.animateWithTextures([birdTexture1,birdTexture2], timePerFrame: 0.01)
        //3 Accion para siempre
        let makeBirdForever = SKAction.repeatActionForever(animationBird)
        //4 Asigno la animacion a nuestro SKSpriteNode
        bird = SKSpriteNode(texture: birdTexture1)
        //5. Asignamos la posicion en el espacio
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        //6. Asignamos la altura (abstracto) de 0 a 15 en su posicion Z
        bird.zPosition = 15
        //7. Ejecuta la accion de moverse forever
        bird.runAction(makeBirdForever)
        
            //GRUPO DE FISICAS DEL BIRD
            //
            bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.width / 2)
            //bird.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed:"flappy1.png"), alphaThreshold: 0.5, size: CGSizeMake(bird.size.width, bird.size.height))
            //Implemento la gravedad (-5.0m/s) ->
            bird.physicsBody?.dynamic = true
        
        
                //GRUPO DE COLISIONES
                bird.physicsBody?.categoryBitMask = birdGroup
                bird.physicsBody?.collisionBitMask = objectsGroup
                bird.physicsBody?.contactTestBitMask = objectsGroup | gapGroup
        
        
        
        bird.physicsBody?.allowsRotation = false
        
    //8. Aqui lo añadimos a la escena
        self.addChild(bird)
        
    }
    
    //MARK: - HACEMOS EL LOOP DE LOS PIPES
    func makeLoopPice1and2(){
        //Usamos un objeto que determine cada cuantos segundos debe crearse una tuberia
        timer = NSTimer.scheduledTimerWithTimeInterval(2,
                                                       target: self,
                                                       selector: #selector(GameScene.makePipesFinal),
                                                       userInfo: nil,
                                                       repeats: true)
    }
    
    //MARK: - LABEL PUNTUACION
    func makeLabel(){
        scoreLabel.text = "0"
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 30
        scoreLabel.position = CGPointMake(self.frame.midX, self.frame.height - 70)
        scoreLabel.zPosition = 16
        self.addChild(scoreLabel)
    }

    
    //MAKE: - LABEL GAME OVER
    func makeLabelGameOver(){
        gameOverLabel.text = "MATAO"
        gameOverLabel.fontName = "Helvetica"
        gameOverLabel.fontSize = 30
        gameOverLabel.position = CGPointMake(self.frame.midX, self.frame.midY)
        gameOverLabel.zPosition = 16
        self.addChild(gameOverLabel)
    }
    
    func resetGame(){
        score = 0
        scoreLabel.text = "0"
        movingGroup.removeAllChildren()
        makeBackground()
        makeLoopPice1and2()
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bird.physicsBody?.velocity = CGVectorMake(0, 0)
        gameOverLabel.removeFromParent()
        movingGroup.speed = 1
        gameOver = false
        
    }
    
}





















