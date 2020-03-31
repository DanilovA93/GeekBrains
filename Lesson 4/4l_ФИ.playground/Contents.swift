import UIKit

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
*/

enum CarAction {
    case startEngine(val: Bool = true)
    case openWindow(val: Bool = true)
    case loadCargo(volume: Int)
    case unloadCargo
    case winTheRace(val: Bool)
}

class Car {
        let brand: String
        let createDate: String
        var engineIsRunning: Bool
        var windowIsOpen: Bool
    
    init(brand: String, createDate: String, engineIsRunning: Bool, windowIsOpen: Bool) {
        self.brand = brand
        self.createDate = createDate
        self.engineIsRunning = engineIsRunning
        self.windowIsOpen = windowIsOpen
    }
    
    func action(action: CarAction) {
    }
}

class TrunkCar: Car, CustomStringConvertible {
    var numberOfDeliveredCargo: Int
    let maxBootVolume: Int
    var currentBootVolume: Int
    
    init(numberOfDeliveredCargo: Int, maxBootVolume: Int, currentBootVolume: Int, brand: String, createDate: String, engineIsRunning: Bool, windowIsOpen: Bool) {
        self.numberOfDeliveredCargo = numberOfDeliveredCargo
        self.maxBootVolume = maxBootVolume
        self.currentBootVolume = currentBootVolume
        
        super.init(brand: brand, createDate: createDate, engineIsRunning: engineIsRunning, windowIsOpen: windowIsOpen)
    }
    
    func deliverTheCargo(cargoWasDelivered: Bool) {
        if (cargoWasDelivered) {
            numberOfDeliveredCargo += 1
        }
    }
    
    func loadСargo (volume: Int) -> Bool{
        let newBootVolume = currentBootVolume + volume
    
        if (maxBootVolume < newBootVolume) {
            print("Объем груза превышает максимальный на \(newBootVolume - maxBootVolume) для \(brand) \(createDate) года, загрузка отменена.\n")
            return false
        }
    
        self.currentBootVolume = newBootVolume
        return true
    }
    
    func unloadCargo () {
        self.currentBootVolume = 0
        self.numberOfDeliveredCargo += 1
    }
    
    override func action(action: CarAction) {
        switch action {
        case let .startEngine(val):
            self .engineIsRunning = val
        case let .openWindow(val):
            self.windowIsOpen = val
        case let .loadCargo(volume: volume):
            loadСargo(volume: volume)
        case .unloadCargo:
            unloadCargo()
        default:
            print("No actions")
        }
    }
    
    var description: String {
        var description = ""
        description += "TrunkCar\n"
        description += "brand: \(self.brand)\n"
        description += "createDate: \(self.createDate)\n"
        description += "engineIsRunning: \(self.engineIsRunning)\n"
        description += "windowIsOpen: \(self.windowIsOpen)\n"
        description += "numberOfDeliveredCargo: \(self.numberOfDeliveredCargo)\n"
        description += "numberOfDeliveredCargo: \(self.currentBootVolume)\n"
        description += "numberOfDeliveredCargo: \(self.maxBootVolume)\n"
        
        return description
    }
}

class SportСar: Car, CustomStringConvertible {
    var numberOfRaceVictories: Int
    
    init(numberOfRaceVictories: Int, brand: String, createDate: String, engineIsRunning: Bool, windowIsOpen: Bool) {
        self.numberOfRaceVictories = numberOfRaceVictories
        
        super.init(brand: brand, createDate: createDate, engineIsRunning: engineIsRunning, windowIsOpen: windowIsOpen)
    }
    
    func startTheRace(raceWasWon: Bool) {
        if (raceWasWon) {
            numberOfRaceVictories += 1
        }
    }
    
    override func action(action: CarAction) {
        switch action {
        case let .startEngine(val):
            self .engineIsRunning = val
        case let .openWindow(val):
            self.windowIsOpen = val
        case let .winTheRace(val):
            startTheRace(raceWasWon: val)
        default:
            print("No actions")
        }
    }
    
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


var sportCarOne = SportСar(numberOfRaceVictories: 0, brand: "BMW", createDate: "2020/03/31", engineIsRunning: false, windowIsOpen: false)
var sportCarTwo = SportСar(numberOfRaceVictories: 17, brand: "Ford", createDate: "1983/05/28", engineIsRunning: true, windowIsOpen: false)
var sportCarThree = SportСar(numberOfRaceVictories: 0, brand: "Audi", createDate: "2003/11/07", engineIsRunning: false, windowIsOpen: true)

var trunkCarOne = TrunkCar(numberOfDeliveredCargo: 0, maxBootVolume: 300, currentBootVolume: 170, brand: "BMW", createDate: "2005/05/13", engineIsRunning: true, windowIsOpen: true)
var trunkCarTwo = TrunkCar(numberOfDeliveredCargo: 3, maxBootVolume: 200, currentBootVolume: 70, brand: "Ford", createDate: "2001/02/11", engineIsRunning: false, windowIsOpen: true)
var trunkCarThree = TrunkCar(numberOfDeliveredCargo: 30, maxBootVolume: 150, currentBootVolume: 140, brand: "Audi", createDate: "1995/04/20", engineIsRunning: false, windowIsOpen: true)


sportCarOne.action(action: .winTheRace(val: true))
sportCarTwo.action(action: .openWindow(val: true))
sportCarThree.action(action: .startEngine(val: true))
trunkCarOne.action(action: .loadCargo(volume: 500))
trunkCarTwo.action(action: .unloadCargo)
trunkCarThree.action(action: .startEngine(val: true))

print(sportCarOne)
print(sportCarTwo)
print(sportCarThree)
print(trunkCarOne)
print(trunkCarTwo)
print(trunkCarThree)
