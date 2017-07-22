import UIKit

let list = ["1", "2", "54", "21", "124"]

let intList = list.map { Int($0); }
//print(intList)

class Person {
    var name = ""
    var age = 0
}

let names = ["Tor", "Widow", "Tony", "Hulk"]

let persons = names.map { value -> Person in
    let person = Person()
    person.name = value
    return person
}
print(persons)

let numbers = [-1, 0 ,121, -10, -30, -80, 100]
let filtered = numbers.filter {
    return $0 >= 0
}

print(filtered)

let changed = numbers.map {
    return $0 < 0
    }.map {
        $0 * 2
}
//}
//print(changed)
//
//numbers.forEach {
//    $0 * 2
//}
//print(numbers)
