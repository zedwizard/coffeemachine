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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    }

    @IBAction func espressoButtonAction(_ sender: UIButton) {
        clearDisplay()
        let message = coffeeMachine.makeDrink(drink: .espresso)
        showMessageAfterProgressBarAnimation(ready: message.ready, message: message.message)
    }
    @IBAction func cappuccinoButtonAction(_ sender: UIButton) {
        clearDisplay()
        let message = coffeeMachine.makeDrink(drink: .cappuccino)
        showMessageAfterProgressBarAnimation(ready: message.ready, message: message.message)
    }
    @IBAction func americanoButtonAction(_ sender: UIButton) {
        clearDisplay()
        let message = coffeeMachine.makeDrink(drink: .americano)
        showMessageAfterProgressBarAnimation(ready: message.ready, message: message.message)
    }
    @IBAction func latteButtonAction(_ sender: UIButton) {
        clearDisplay()
        let message = coffeeMachine.makeDrink(drink: .latte)
        showMessageAfterProgressBarAnimation(ready: message.ready, message: message.message)
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
    func showMessageAfterProgressBarAnimation(ready: Bool, message: String) {
        if ready == false {
            coffeeMachineDisplay.text = message
        } else if ready == true {
            CATransaction.setCompletionBlock { [weak self] in
                print("before message: \(message)")
                self?.coffeeMachineDisplay.text = message
                self?.progressLine.progress = 0
                print("after message: \(message)")
            }
            self.progressLine.setProgress(1.0, animated: true)
            CATransaction.commit()
        }
        
    }

}

