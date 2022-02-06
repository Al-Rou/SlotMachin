//
//  GameViewController.swift
//  SlotMachineOneAndTwo
//
//  Created by Sorena Sorena on 2022-02-05.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var backgroundPhoto = SKSpriteNode(imageNamed: "forBack")
    let cars = [ "car1", "car2", "car3", "car4",
                        "car5" ]
    var current1:String = ""
    var current2:String = ""
    var current3:String = ""
    var isWheelSpinning:Bool = false
    
    
    
    @IBOutlet weak var spinButtOutlet: UIButton!
    @IBOutlet weak var budget: UILabel!
    @IBOutlet weak var bet: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func quitButt(_ sender: UIButton) {
        
        exit(-1)
    }
    
    @IBAction func resetButt(_ sender: UIButton) {
        bet.text = "7"
        budget.text = "100"
        spinButtOutlet.isEnabled = true
        result.text = "All got reset!"
    }
    
    @IBAction func spinButt(_ sender: UIButton) {
        
            
        if (Int(budget.text!)! >= Int(bet.text!)!){
            
            let randomNumber1:UInt32 = arc4random_uniform( UInt32 (cars.count))
            let chosenCar1:String = cars[Int (randomNumber1)]
            current1 = chosenCar1
            img1.image = UIImage(named: current1)
            
            let randomNumber2 = arc4random_uniform( UInt32 (cars.count))
            let chosenCar2:String = cars[Int (randomNumber2)]
            current2 = chosenCar2
            img2.image = UIImage(named: current2)
            
            let randomNumber3 = arc4random_uniform( UInt32 (cars.count))
            let chosenCar3:String = cars[Int (randomNumber3)]
            current3 = chosenCar3
            img3.image = UIImage(named: current3)
            
            
            if ((current1 == current2)&&(current2 == current3)){
                result.text = "You won!"
                budget.text = String((Int(budget.text!)! + (4*Int(bet.text!)!)))
            }else{
                result.text = "You lost!"
                budget.text = String((Int(budget.text!)! - Int(bet.text!)!))
                if (Int(budget.text!)! < Int(bet.text!)!){
                    result.text = "There is not enough money!"
                    spinButtOutlet.isEnabled = false
                }
            }
        }else{
            result.text = "There is not enough money!"
            spinButtOutlet.isEnabled = false
        }
  

   
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if(Int(budget.text!)! >= Int(bet.text!)!){
            spinButtOutlet.isEnabled = true
        }else{
            result.text = "There is no money!"
            spinButtOutlet.isEnabled = false
        }
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
