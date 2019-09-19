//
//  CoffeeMachine.swift
//  Coffeemachine
//
//  Created by Zed on 9/16/19.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation



struct Drink {
    let title: String
    let water: Int
    let coffeeBeans: Int
    let milk: Int
}
class CoffeeMachine {
    var coffeeBeans: Int
    var water: Int
    var milk: Int
    var wasteContainer: Int
    enum CoffeeDrink {
        case espresso
        case americano
        case cappuccino
        case latte
        var drink: Drink {
            switch self {
            case .espresso: return Drink(title: "espresso", water: 30, coffeeBeans: 50, milk: 0)
            case .americano: return Drink(title: "americano", water: 60, coffeeBeans: 50, milk: 0)
            case .cappuccino: return Drink(title: "cappuccino", water: 10, coffeeBeans: 50, milk: 60)
            case .latte: return Drink(title: "latte", water: 0, coffeeBeans: 30, milk: 70)
            }
        }
        
    }
    init(coffeeBeans: Int, water: Int, milk: Int, wasteContainer: Int) {
        self.coffeeBeans = coffeeBeans
        self.water = water
        self.milk = milk
        self.wasteContainer = wasteContainer
    }
    func makeDrink(drink: CoffeeDrink) -> (message: String, ready: Bool) {
        let currentDrink = drink.drink
        if coffeeBeans < currentDrink.coffeeBeans {
            return ("not enough coffee beans", ready: false)
        } else if water < currentDrink.water {
            return ("not enough water", ready: false)
        } else if milk < currentDrink.milk {
            return ("not enough milk", ready: false)
        } else if wasteContainer >= 500 {
            return ("waste beans container is full", ready: false)
        } else {
            coffeeBeans -= currentDrink.coffeeBeans
            water -= currentDrink.water
            milk -= currentDrink.milk
            wasteContainer += currentDrink.coffeeBeans
            return ("Your \(currentDrink.title) is ready", ready: true)
        }
    }
    func addCoffeeBeans() -> String {
        coffeeBeans = 250
        return "coffee beans was added"
    }
    func addWater() -> String {
        water = 250
        return "water was added"
    }
    func addMilk() -> String {
        milk = 250
        return "milk was added"
    }
    func cleanWasteContainer() -> String {
        wasteContainer = 0
        return "waste bean container was cleaned"
    }
    
    
}
