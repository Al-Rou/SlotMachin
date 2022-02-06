//
//  GameScene.swift
//  SlotMachineOneAndTwo
//
//  Created by Sorena Sorena on 2022-02-05.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
   
    var backgroundPhoto = SKSpriteNode(imageNamed: "forBack")
    let cars = [ "car1", "car2", "car3", "car4",
                        "car5" ]
    var current1:String = ""
    var current2:String = ""
    var current3:String = ""
    var isWheelSpinning:Bool = false
    
    
    override func didMove(to view: SKView) {
        backgroundPhoto.position = CGPoint(x: 0, y: 0)
        backgroundPhoto.size.height = backgroundPhoto.size.height*2.5
        backgroundPhoto.size.width = backgroundPhoto.size.width*2.5
    
        addChild(backgroundPhoto)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        if (isWheelSpinning == false){
            
            print("It is spinning ...")
            isWheelSpinning == true
            let waitASecond:SKAction = SKAction.wait(forDuration: 1)
            
            let wheel1:SKAction = SKAction.run{
                self.spinWheel(wheelNumber: 1)
                
            }
            let wheel2:SKAction = SKAction.run {
                self.spinWheel(wheelNumber: 2)
                
            }
            let wheel3:SKAction = SKAction.run{
                self.spinWheel(wheelNumber: 3)
                
            }
            let checkValues:SKAction = SKAction.run{
                self.checkValuesFunc()
            }
           
            self.run(SKAction.sequence([ waitASecond, wheel1,
                                       waitASecond, wheel2,
                                       waitASecond, wheel3,
                                       waitASecond, checkValues]))
            
   
        }
        */
    }
    
    
    func spinWheel(wheelNumber:Int){
        /*
        let randomNumber:UInt32 = arc4random_uniform( UInt32 (cars.count))
        let chosenCar:String = cars[Int (randomNumber)]
        
        print("Wheel \(wheelNumber) is \(chosenCar)")
        
        if (wheelNumber == 1){
            current1 = chosenCar
            
            
        }else if (wheelNumber == 2){
            current2 = chosenCar
        }else if (wheelNumber == 3){
            current3 = chosenCar
        }
        */
    }
    func checkValuesFunc(){
        /*
        if ((current1 == current2)&&(current2 == current3)){
            print("You won!")
        }else{
            print("You lost!")
        }
        */
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
