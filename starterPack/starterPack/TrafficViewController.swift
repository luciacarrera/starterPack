//
//  TrafficViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class TrafficViewController: UIViewController {
    
    let visColors:[UIColor] = [UIColor.white, UIColor.black]
    let invisColors:[UIColor] = [UIColor.clear, UIColor.clear]
    var user: User!
    var drivingSide: UIButton!
    @IBOutlet var interstate: UIButton!
    @IBOutlet var speedLimit: UIButton!
    @IBOutlet var yield: UIButton!
    @IBOutlet var rightTurn: UIButton!
    
    var interstateVisible = false
    
    var speedLimitVisible = false
    
    var yieldVisible = false
    
    var rightTurnVisible = false
    
    let traffic_descriptions: [String:String] = ["Traffic side": "The US drives on the right side of the road.", "Speed limit":"US speed limit signs are in "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interstate.setTitleColor(UIColor.clear, for: .normal)
        interstate.backgroundColor = UIColor.clear
        
        speedLimit.setTitleColor(UIColor.clear, for: .normal)
        speedLimit.backgroundColor = UIColor.clear
        
        yield.setTitleColor(UIColor.clear, for: .normal)
        yield.backgroundColor = UIColor.clear
        
        rightTurn.setTitleColor(UIColor.clear, for: .normal)
        rightTurn.backgroundColor = UIColor.clear
//        // Do any additional setup after loading the view.
//        let margins = view.layoutMarginsGuide
//
//        drivingSide = UIButton()//frame: CGRect(x: 100, y: 100, width: 150, height: 50))
//        drivingSide.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(drivingSide)
//        drivingSide.backgroundColor = UIColor.white
//        drivingSide.layer.borderWidth = 1
//        drivingSide.layer.cornerRadius = 10
//        drivingSide.setTitleColor(UIColor.black, for: .normal)
//        drivingSide.setTitle("Traffic side", for: .normal)
//        drivingSide.alpha = 0
//        let dsLeadingConstraint = drivingSide.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
//        let dsTrailingConstraint = drivingSide.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
//        dsLeadingConstraint.isActive = true
//        dsTrailingConstraint.isActive = true
//        //drivingSide.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)

//          self.view.addSubview(drivingSide)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        UIView.animate(withDuration: 0.5) {
//            self.drivingSide.alpha = 1
//        }
    }
    
    // please work modifing thing swift thing

    @IBAction func animateInterstate(_ sender: Any) {
        print("interstate button pressed")
        var colorList: [UIColor] = []
        if interstateVisible {
            colorList = invisColors
            interstateVisible = false
        } else {
            colorList = visColors
            interstateVisible = true
        }
        print(colorList)
        UIView.animate(withDuration: 0.5) {
            self.interstate.setTitleColor(colorList[1], for: .normal)
            self.interstate.backgroundColor = colorList[0]
        }
    }
    
    @IBAction func animateYield(_ sender: Any) {
        print("interstate button pressed")
        var colorList: [UIColor] = []
        if yieldVisible {
            colorList = invisColors
            yieldVisible = false
        } else {
            colorList = visColors
            yieldVisible = true
        }
        print(colorList)
        UIView.animate(withDuration: 0.5) {
            self.yield.setTitleColor(colorList[1], for: .normal)
            self.yield.backgroundColor = colorList[0]
        }
    }
    
    @IBAction func animateRighTurn(_ sender: Any) {
        print("interstate button pressed")
        var colorList: [UIColor] = []
        if rightTurnVisible {
            colorList = invisColors
            rightTurnVisible = false
        } else {
            colorList = visColors
            rightTurnVisible = true
        }
        print(colorList)
        UIView.animate(withDuration: 0.5) {
            self.rightTurn.setTitleColor(colorList[1], for: .normal)
            self.rightTurn.backgroundColor = colorList[0]
        }
    }
    
    
    @IBAction func animateSpeedLimit(_ sender: Any) {
        print("speedLimit button pressed")
        var colorList: [UIColor] = []
        if speedLimitVisible {
            colorList = invisColors
            speedLimitVisible = false
        } else {
            colorList = visColors
            speedLimitVisible = true
        }
        print(colorList)
        UIView.animate(withDuration: 0.5) {
            self.speedLimit.setTitleColor(colorList[1], for: .normal)
            self.speedLimit.backgroundColor = colorList[0]
        }
    }
    

}
