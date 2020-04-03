import UIKit

/*
 +1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 +2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 +3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 +4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 +5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 +6. Вывести сами объекты в консоль.
 */

protocol Car {
    var brand: String {get set}
    var createDate: String {get}
    var engineIsRunning: Bool {get set}
    var windowIsOpen: Bool {get set}
    
    func action()
}

extension Car {
    var switchEngine: Bool {
        get {
            return self.engineIsRunning
        }
        set(newValue) {
            self.engineIsRunning = newValue
        }
    }
}
extension Car {
    var switchWindow: Bool {
        get {
            return self.windowIsOpen
        }
        set(newValue) {
            self.windowIsOpen = newValue
        }
    }
}

class SportCar: Car {
    var numberOfRaceVictories: Int = 0
    var brand: String
    var createDate: String
    var engineIsRunning: Bool
    var windowIsOpen: Bool
    
    func action() {
        engineIsRunning = true
        numberOfRaceVictories += 1
        engineIsRunning = false
    }

    init(brand: String, createDate: String, engineIsRunning: Bool, windowIsOpen: Bool) {
        self.brand = brand
        self.createDate = createDate
        self.engineIsRunning = engineIsRunning
        self.windowIsOpen = windowIsOpen
    }
}
class TrunkCar: Car {
    var numberOfDeliveredCargo: Int = 0
    let maxBootVolume: Int = 500
    var currentBootVolume: Int = 0
    var brand: String
    var createDate: String
    var engineIsRunning: Bool
    var windowIsOpen: Bool
    
    func action() {
        engineIsRunning = true
        numberOfDeliveredCargo += 1
        engineIsRunning = false
    }

    init(brand: String, createDate: String, engineIsRunning: Bool, windowIsOpen: Bool) {
        self.brand = brand
        self.createDate = createDate
        self.engineIsRunning = engineIsRunning
        self.windowIsOpen = windowIsOpen
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        var description = ""
        description += "SportCar\n"
        description += "brand: \(self.brand)\n"
        description += "createDate: \(self.createDate)\n"
        description += "engineIsRunning: \(self.engineIsRunning)\n"
        description += "windowIsOpen: \(self.windowIsOpen)\n"
        description += "numberOfRaceVictories: \(self.numberOfRaceVictories)\n"
        
        return description
    }
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        var description = ""
        description += "TrunkCar\n"
        description += "brand: \(self.brand)\n"
        description += "createDate: \(self.createDate)\n"
        description += "engineIsRunning: \(self.engineIsRunning)\n"
        description += "windowIsOpen: \(self.windowIsOpen)\n"
        description += "numberOfDeliveredCargo: \(self.numberOfDeliveredCargo)\n"
        description += "maxBootVolume: \(self.maxBootVolume)\n"
        description += "currentBootVolume: \(self.currentBootVolume)\n"
        
        return description
    }
}

var sportCarOne = SportCar(brand: "BMW", createDate: "2019/01/15", engineIsRunning: false, windowIsOpen: false)
var sportCarTwo = SportCar(brand: "Audi", createDate: "2019/02/15", engineIsRunning: false, windowIsOpen: false)
var sportCarThree = SportCar(brand: "Ford", createDate: "2019/03/15", engineIsRunning: false, windowIsOpen: false)
var trunkCarOne = TrunkCar(brand: "KAMAZ", createDate: "2019/04/15", engineIsRunning: false, windowIsOpen: false)
var trunkCarTwo = TrunkCar(brand: "GMC", createDate: "2019/05/15", engineIsRunning: false, windowIsOpen: false)
var trunkCarThree = TrunkCar(brand: "Chevrolet", createDate: "2019/06/15", engineIsRunning: false, windowIsOpen: false)

sportCarOne.action()
sportCarTwo.switchWindow = true
sportCarThree.switchEngine = true
trunkCarOne.action()
trunkCarTwo.switchWindow = true
trunkCarThree.switchEngine = true

print(sportCarOne)
print(sportCarTwo)
print(sportCarThree)
print(trunkCarOne)
print(trunkCarTwo)
print(trunkCarThree)
