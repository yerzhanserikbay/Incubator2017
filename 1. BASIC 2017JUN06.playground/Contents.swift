//1. let & var

let a = 5
var b = 5 //change

//2. Comments

/*
 00000
 */

//3. Semicolons 

let c = 3; let e = 6;

//4. Integers

let i: Int = 4

//5. Floating point number 

let d: Double = 10.0001
let f: Float = 10.00001

//6. Type safety

var value: Int? = nil

if let v = value {
    print(v)
} else {
    
}

//7. Booleans

let bool = true // or false 

let boo: Bool? = false

//8. Tuples 

let tuple = (13, "Hello")
print(tuple.0)
print(tuple.1)

//111

let name = "Tony"
var name1: String? = "Stark"

print(name ?? name1)

//9. Range

for i in 8...11 {
    print(i)
}


//10. Collection types

var list = [1, 2, 3, 4, 5, 6]
list.append(7)
list.remove(at: 2)
print(list)

var dict: [String:Int] = ["one" : 1]
print(dict["one"])

//guard let 
//if let
print("\n")
//let set = Set<Int>()
var set: Set<Int> = [] // append is not sure. for append, convert set to massive
set.insert(1)
set.insert(2)
set.insert(3)
set.insert(2)

set.contains(5)

print(set)

//if let guard let 

print("\n")

var opt: Int? = 3

if let safeValue = opt {
    print(safeValue)
} else {
    print("ERROR")
}



func someFunc() {
    var opt: Int? = nil
    guard let safeValue = opt else {
        print("Unsafe")
        return
    }
    print("Safe")
    }
someFunc()

print("\n")
// Loops

for i in (10...15) {
    
}

let iter  = ["Hello", "Bonjour", "Privet", "Salam"]
for i in iter {
    print(i)
}

print("\n")

for (i, value) in iter.enumerated() {
    print("\(i)|\(value)")
}

print("\n")

var t = 0
while t < 10 { //
    print(t, terminator: " ")
    t += 1
}

//Class
















