import UIKit

//usefull funcs
func printArray(array: [Int]) {
    for i in array {
        print(i)
    }
}

func copyFromIntArrayToDoubleArray(array: [Int]) -> [Double] {
    var doubleArray: [Double] = []
    
    for i in array {
        doubleArray.append(Double(i))
    }
    return doubleArray
}

func createArrayFrom (startFrom: Int = 2, getTo: Int) -> [Int] {
    var array: [Int] = []
    
    for i in startFrom ... getTo {
        array.append(i)
    }
    
    return array
}

//=========================================================================
// 1. Написать функцию, которая определяет, четное число или нет.
func numberIsEven(num: Int) -> Bool {
    return num % 2 == 0
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func numberIsDevidedByThree(num: Int) -> Bool {
    return num % 3 == 0
}

// 3. Создать возрастающий массив из 100 чисел.
func getArrayFrom (number: inout Int) -> [Int] {
    var arr: [Int] = [];
    
    for _ in 1...100 {
        arr.append(number)
        number += 1
    }
    
    return arr
}

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func deleteNumbersFromArray(array: inout [Int]) {
    for (index, value) in array.enumerated().reversed() {
        if (numberIsEven(num: value) || !numberIsDevidedByThree(num: value)) {
            array.remove(at: index)
        }
    }
}

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
// Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func getFibonacciArray(intArray: [Int]) -> [Double] {
    var bigArray: [Double] = copyFromIntArrayToDoubleArray(array: intArray)
    
    for _ in 1...100 {
        bigArray.append(bigArray[bigArray.endIndex - 1] + bigArray[bigArray.endIndex - 2])
    }
    
    return bigArray
}

// 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.
func getEratosfenArray () -> [Int] {
    var array: [Int] = createArrayFrom(getTo: 1000)
    var resultArray: [Int] = []

    for (index, p) in array.enumerated() {
        if (index >= array.endIndex) {
            break
        }

        for i in index + 1 ... array.endIndex {
            if (i >= array.endIndex) {
                break
            }

            if (array[i] % p == 0) {
                array.remove(at: i)
            }
        }
    }
    
    for i in array {
        if (resultArray.endIndex >= 100) {
            break
        }
        resultArray.append(i)
    }
    
    return resultArray
}


//=========================================================================
var number: Int = 0
var arr: [Int] = getArrayFrom(number: &number)
deleteNumbersFromArray(array: &arr)
var bigArray: [Double] = getFibonacciArray(intArray: arr)
var eratosfenArray: [Int] = getEratosfenArray()
