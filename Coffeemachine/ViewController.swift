//
//  ViewController.swift
//  Coffeemachine
//
//  Created by Zed on 9/5/19.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var espressoButton: UIButton!
    @IBOutlet weak var americanoButton: UIButton!
    @IBOutlet weak var cappuccinoButton: UIButton!
    @IBOutlet weak var latteButton: UIButton!
    @IBOutlet weak var addBeansButton: UIButton!
    @IBOutlet weak var addWaterButton: UIButton!
    @IBOutlet weak var addMilkButton: UIButton!
    @IBOutlet weak var coffeeMachineDisplay: UILabel!
    @IBOutlet weak var clearContainerButton: UIButton!
    @IBOutlet weak var progressLine: UIProgressView!
    
    private let coffeeMachine = CoffeeMachine(coffeeBeans: 0, water: 0, milk: 0, wasteContainer: 0)
    //    private let progress = Progress(totalUnitCount: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    }

    @IBAction func espressoButtonAction(_ sender: UIButton) {
        clearDisplay()
        let message = coffeeMachine.makeDrink(drink: .espresso)
        if message.ready == false {
            coffeeMachineDisplay.text = message.message
        } else if message.ready == true {
            _ = showProgressBarAnimation()
//            {
//                didSet {
//                    if animationEnded == true {
//                        print("inside didset")
                        coffeeMachineDisplay.text = message.message
//                        progressLine.progress = 0
//                    }
//                }
//            }
        }
    }
    @IBAction func cappuccinoButtonAction(_ sender: UIButton) {
        let message = coffeeMachine.makeDrink(drink: .cappuccino)
        coffeeMachineDisplay.text = message.message
    }
    @IBAction func americanoButtonAction(_ sender: UIButton) {
        let message = coffeeMachine.makeDrink(drink: .americano)
        coffeeMachineDisplay.text = message.message
    }
    @IBAction func latteButtonAction(_ sender: UIButton) {
        let message = coffeeMachine.makeDrink(drink: .latte)
        coffeeMachineDisplay.text = message.message
    }
    @IBAction func addBeansButtonAction(_ sender: UIButton) {
        coffeeMachineDisplay.text = coffeeMachine.addCoffeeBeans()
    }
    @IBAction func addWaterButtonAction(_ sender: UIButton) {
        coffeeMachineDisplay.text = coffeeMachine.addWater()
    }
    @IBAction func addMilkButtonAction(_ sender: UIButton) {
        coffeeMachineDisplay.text = coffeeMachine.addMilk()
    }
    @IBAction func clearContainerAction(_ sender: UIButton) {
        coffeeMachineDisplay.text = coffeeMachine.cleanWasteContainer()
    }
    func clearDisplay() {
        coffeeMachineDisplay.text = ""
    }
    func showProgressBarAnimation() -> Bool {
        progressLine.progress = 0
        UIView.animate(withDuration: 3, animations: {
            self.progressLine.setProgress(1.0, animated: true)
            
        }) { (true) in
            print("animation ended")
        }
        return true
    }

}

