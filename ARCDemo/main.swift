//
//  main.swift
//  ARCDemo
//
//  Created by Abhishek Gupta on 14/05/24.
//

import Foundation

//print("Hello, World!")


class Vechile {
    weak var car: Car?
    var id: String?
    
    init(car: Car? = nil, id: String? = nil) {
        self.car = car
        self.id = id
        print("\(self) init")
    }
    
    deinit {
        print("\(self) deinit")
    }
    
}

class Car {
    weak var vechile: Vechile?
    var name: String?
    
    init(vechile: Vechile? = nil, name: String? = nil) {
        self.vechile = vechile
        self.name = name
        print("\(self) init")
    }
    
    deinit {
        print("\(self) deinit")
    }
    
}
//here we are just initializing our class
  //Vechile(car: nil, id: "123")
// OutPut:
// ARCDemo.Vechile init
// ARCDemo.Vechile deinit

// We are stroing our Vechile class object into a variable.
  //let vechile = Vechile(car: nil, id: "1234")
// Output:
// ARCDemo.Vechile init


var vechile: Vechile? = Vechile(car: nil, id: "12345")
var car: Car? = Car(vechile: nil, name: "TATA")

vechile?.car = car
car?.vechile = vechile
// Output:
//ARCDemo.Vechile init
//ARCDemo.Car init
// Here we are getting memory leak because of retail cycle
// as the both objects are holding reference of each other
// To fix this any one object we should define as weak or unowned

vechile = nil
car = nil
