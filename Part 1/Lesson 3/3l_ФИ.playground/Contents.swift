import UIKit

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


enum CarAction {
    case startEngine(val: Bool = true)
    case openWindow(val: Bool = true)
    case loadCargo(short: Int = 5, middle: Int = 30, long: Int = 150)
}

struct Car {
    var brand: String
    var createDate: String
    let maxBootVolume: Int = 50
    var currentBootVolume: Int
    var engineIsRunning: Bool
    var openWindows: Bool
    
    mutating func loadСargo (volume: Int) -> Bool{
        let newBootVolume = currentBootVolume + volume
        
        if (maxBootVolume < newBootVolume) {
            print("Объем груза превышает максимальный на \(newBootVolume - maxBootVolume) для \(brand)")
            return false
        }
        
        self.currentBootVolume = newBootVolume
        return true
    }
    
    mutating func doAction (action: CarAction) {
        switch action {
        case let .openWindow(val):
            self.openWindows = val
            
        case let .startEngine(val):
            self.engineIsRunning = val
            
        case let .loadCargo(_, middle, _):
            loadСargo(volume: middle)
        }
    }
}

struct Truck {
    var brand: String
    var createDate: String
    let maxBootVolume: Int = 500
    var currentBootVolume: Int
    var engineIsRunning: Bool
    var openWindows: Bool
    
    mutating func loadСargo (volume: Int) -> Bool{
        let newBootVolume = currentBootVolume + volume
        
        if (maxBootVolume < newBootVolume) {
            print("Объем груза превышает максимальный на \(newBootVolume - maxBootVolume) для \(brand)")
            return false
        }
        
        self.currentBootVolume = newBootVolume
        return true
    }
    
    mutating func doAction (action: CarAction) {
        switch action {
        case let .openWindow(val):
            self.openWindows = val
            
        case let .startEngine(val):
            self.engineIsRunning = val
            
        case let .loadCargo(_, _, long):
            loadСargo(volume: long)
        }
    }
}

var firstCar = Car(brand: "BMW", createDate: "21.03,1987", currentBootVolume: 10, engineIsRunning: false, openWindows: false)
var secondCar = Car(brand: "KIA", createDate: "03.07,2011", currentBootVolume: 33, engineIsRunning: false, openWindows: false)
var firstTruck = Truck(brand: "Ford", createDate: "23.09,2017", currentBootVolume: 100, engineIsRunning: false, openWindows: false)

firstCar.doAction(action: .startEngine(val: true))
firstCar.doAction(action: .openWindow(val: true))
firstCar.doAction(action: .loadCargo())

secondCar.doAction(action: .startEngine(val: false))
secondCar.doAction(action: .openWindow(val: true))
secondCar.doAction(action: .loadCargo())

firstTruck.doAction(action: .startEngine(val: true))
firstTruck.doAction(action: .openWindow(val: false))
firstTruck.doAction(action: .loadCargo())

print(firstCar)
print(secondCar)
print(firstTruck)
