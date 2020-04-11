import UIKit

/*
 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
 */

enum RobotError: Error {
    case unknownAssociation(_ message: String)
    case outOfMemory(_ message: String)
}

class Robot {
    private var memory: Memory = Memory()
    
    func rememberAssociation(key:String, value: String) {
        do {
            try self.memory.saveAssociation(key, value)
        } catch RobotError.outOfMemory(let message) {
            print(message)
        } catch {
            print("Something goes wrong")
        }
    }
    
    func getAssociation(_ key :String) throws -> String {
        guard let value = self.memory.associations[key.lowercased()] else {
            throw RobotError.unknownAssociation("I don't know what is \"\(key)\"")
        }
        
        return value
    }
    
    func forgetAll() {
        self.memory.associations = [String:String]()
    }
    
    private class Memory {
        private var fullMemorySpace: Int = 5
        var associations = [String:String]()
        
        func saveAssociation(_ key:String, _ value: String) throws {
            if (associations.count < fullMemorySpace) {
                self.associations[key] = value
            } else {
                throw RobotError.outOfMemory("Memory is full, \(key):\(value) not in memory")
            }
        }
    }
}

func printRobotAssociation(_ val: String) {
    do {
        try print("\(val) - \(robot.getAssociation(val))")
    } catch RobotError.unknownAssociation(let message) {
        print(message)
    } catch {
        print("Something goes wrong")
    }
}

var robot: Robot = Robot()
robot.rememberAssociation(key: "winter", value: "cold")
robot.rememberAssociation(key: "fire", value: "supper hot")
robot.rememberAssociation(key: "water", value: "flows")
robot.rememberAssociation(key: "dog", value: "barks")
robot.rememberAssociation(key: "wind", value: "blows")
robot.rememberAssociation(key: "errors", value: "happens")

printRobotAssociation("winter")
printRobotAssociation("fire")
printRobotAssociation("wind")
printRobotAssociation("cat")

robot.forgetAll()

printRobotAssociation("winter")
