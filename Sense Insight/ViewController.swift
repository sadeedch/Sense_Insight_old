//
//  ViewController.swift
//  Sense Insight
//
//  Created by Sadeed Ahmed  on 12/8/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xGyro:UITextField!
    @IBOutlet weak var yGyro:UITextField!
    @IBOutlet weak var zGyro:UITextField!
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGyroscope()
    }


    func myGyroscope() {
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            print(data)
            
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.rotationRate.x
                let y = trueData.rotationRate.y
                let z = trueData.rotationRate.z
                
//                self.xGyro.text = "x: \(Double(x).rounded(toPlaces: 3))"
//                self.yGyro.text = "y: \(Double(y).rounded(toPlaces: 3))"
//                self.zGyro.text = "z: \(Double(z).rounded(toPlaces: 3))"
                
                self.xGyro.text = "x: \(Double(x).rounded(toPlaces: 3))"
                self.yGyro.text = "y: \(y)"
                self.zGyro.text = "z: \(y)"
            }
        }
    }
    
}


extension Double {
    
    func rounded(toPlaces places:Int) -> Double{
        
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded()
        
    }
}

