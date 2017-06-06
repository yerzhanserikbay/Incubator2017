func someFunc() {
    
}

func someFunc1() -> Bool {
    return true
}

func someFunc2(input: Int) -> Bool {
    return true
}


class Human {
    var name: String?
    var surname: String?
    var age = 0
}

class Animal {
    var species: String?
    var canFly: Bool = false
    var weight: Float = 0.0
    
    
    init(species: String?, canFly: Bool, weight: Float) {
        self.species = species
        self.canFly = canFly
        self.weight = weight
        
    }
    func makeNoise(){
        print("Brbrbr")
    }
}


class Cat: Animal {
    
    override func makeNoise() {
        print("Meaw")
    }
}

class Dog: Animal {
    override func makeNoise() {
        print("Wow")
    }
}


let cat = Cat(species: "Cat", canFly: false, weight: 2.5 )

print(cat.weight)

let dog = Dog(species: "Dog", canFly: false, weight: 5.5 )

print(dog.weight)

//let cat = Cat()
//cat.makeNoise()









