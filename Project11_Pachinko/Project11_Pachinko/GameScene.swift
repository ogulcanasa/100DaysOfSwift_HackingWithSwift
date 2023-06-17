//
//  GameScene.swift
//  Project11_Pachinko
//
//  Created by Oğulcan Aşa on 16.06.2023.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var scoreLabel: SKLabelNode!
    var leftBallLabel: SKLabelNode!

    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }

    var editLabel: SKLabelNode!

    var editingMode: Bool = false {
        didSet {
            if editingMode {
                editLabel.text = "Done"
            } else {
                editLabel.text = "Edit"
            }
        }
    }

    var ballImages = ["ballBlue", "ballCyan", "ballRed", "ballGreen", "ballGrey", "ballPurple", "ballYellow"]

    var leftBall = 5 {
        didSet {
            leftBallLabel.text = "Left Ball: \(leftBall)"
        }
    }

    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)

        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: 980, y: 700)
        addChild(scoreLabel)

        leftBallLabel = SKLabelNode(fontNamed: "Chalkduster")
        leftBallLabel.text = "Left Ball: 5"
        leftBallLabel.horizontalAlignmentMode = .center
        leftBallLabel.position = CGPoint(x: 512, y: 700)
        addChild(leftBallLabel)

        editLabel = SKLabelNode(fontNamed: "Chalkduster")
        editLabel.text = "Edit"
        editLabel.position = CGPoint(x: 80, y: 700)
        addChild(editLabel)

        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self

        makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
        makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 898, y: 0), isGood: false)

        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: 256, y: 0))
        makeBouncer(at: CGPoint(x: 512, y: 0))
        makeBouncer(at: CGPoint(x: 768, y: 0))
        makeBouncer(at: CGPoint(x: 1024, y: 0))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        let objects = nodes(at: location)

        if objects.contains(editLabel) {
            editingMode.toggle()
        } else {
            if leftBall > 0 {
                if editingMode {
                    let size = CGSize(width: Int.random(in: 16...128), height: 16)
                    let box = SKSpriteNode(color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1), size: size)
                    box.zRotation = CGFloat.random(in: 0...3)
                    box.position = location

                    box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
                    box.physicsBody?.isDynamic = false
                    box.name = "box"

                    addChild(box)
                } else {
                    if location.y > 550 {
                        spawnBall(location: location)
                    } else {
                        let alertController = UIAlertController(title: "Try from a higher point", message: nil, preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(okAction)
                        guard let viewController = view?.window?.rootViewController else {
                            return
                        }
                        viewController.present(alertController, animated: true, completion: nil)
                    }
                }
            } 
        }
    }

    func spawnBall(location: CGPoint) {
        let randomBallImage = ballImages.randomElement()
        let ball = SKSpriteNode(imageNamed: randomBallImage!)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.restitution = 0.4 // about bouncy
        ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
        ball.position = location
        ball.name = "ball"
        addChild(ball)
    }

    func makeBouncer(at position: CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2)
        bouncer.physicsBody?.isDynamic = false
        addChild(bouncer)
    }

    func makeSlot(at position: CGPoint, isGood: Bool) {
        var slotBase: SKSpriteNode
        var slotGlow: SKSpriteNode

        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
            slotBase.name = "good"
        } else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
            slotBase.name = "bad"
        }

        slotBase.position = position
        slotGlow.position = position

        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody?.isDynamic = false

        addChild(slotBase)
        addChild(slotGlow)

        let spin = SKAction.rotate(byAngle: .pi, duration: 10)
        let spinForever = SKAction.repeatForever(spin)
        slotGlow.run(spinForever)
    }

    func collisionBetween (ball: SKNode, object: SKNode) {
        if object.name == "good" {
            destroy(ball: ball)
            score += 1
            leftBall += 1
        } else if object.name == "bad" {
            destroy(ball: ball)
            score -= 1
            leftBall -= 1
        }

        if ball.name == "box" {
            destroyBox(box: ball)
        }
        gameOver()
    }

    func destroy(ball: SKNode) {
        if let fireParticles = SKEmitterNode(fileNamed: "FireParticles") {
            fireParticles.position = ball.position
            addChild(fireParticles)
        }

        ball.removeFromParent()
    }

    func destroyBox(box: SKNode) {
        box.removeFromParent()
    }

    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }

        if nodeA.name == "ball" {
            collisionBetween(ball: nodeA, object: nodeB)
        } else if nodeB.name == "ball" {
            collisionBetween(ball: nodeB, object: nodeA)
        }

        if nodeA.name == "box" {
            collisionBetween(ball: nodeA, object: nodeB)
        } else if nodeB.name == "box" {
            collisionBetween(ball: nodeB, object: nodeA)
        }
    }

    func gameOver() {
        if leftBall < 1 {
            let ac = UIAlertController(title: "Game Over!", message: nil, preferredStyle: .alert)
            let NewGame = UIAlertAction(title: "New Game", style: .default) { _ in
                self.newGame()
            }
            ac.addAction(NewGame)
            guard let viewController = view?.window?.rootViewController else {
                return
            }
            viewController.present(ac, animated: true, completion: nil)

        }
    }

    @objc func newGame() {
        score = 0
        leftBall = 5
    }
}
