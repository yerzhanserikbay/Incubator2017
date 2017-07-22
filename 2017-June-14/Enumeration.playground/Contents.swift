//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum TasteType {
    case undefined
    case chocolate
    case marmalade
    case milk
}

class Candy {
    
    var name = ""
    var tasteType: TasteType = .undefined
    
    var types: [TasteType] = []
    
    init(name: String, type: TasteType) {
        self.name = name
        self.tasteType = type
    }
}

let candies = [
    Candy(name: "Choco", type: .chocolate),
    Candy(name: "Ferrero", type: .chocolate),
    Candy(name: "Rakhat", type: .marmalade),
    Candy(name: "Rafaello", type: .milk)
]

let filtered = candies.filter{
    $0.tasteType == .chocolate
}

filtered.forEach{
    print($0.name)
}
