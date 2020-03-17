import UIKit

// task 1
// ax2 + bx + c = 0
// D = b2 − 4ac

let a: Double = 1;
let b: Double = -2;
let c: Double = -3;
let d = pow(Double(b), 2) - 4 * a * c;

print("1. Квадратное уровнение:")
print("a = \(a), b = \(b), c = \(c)")

if (d > 0) {
    print("Есть 2 корня")
    print("x1 = \((-b + sqrt(d))/(2 * a))")
    print("x2 = \((-b - sqrt(d))/(2 * a))")
    
} else if (d == 0) {
    print("Есть 1 корень")
    print("x = \((-b + sqrt(d))/(2 * a))")
    
} else {
    print("Корней нет")
}

// task 2
let cat1: Double = 3;
let cat2: Double = 4;
let gip = sqrt(pow(cat1, 2) + pow(cat2, 2));

print("2. Квадратное уровнение:")
print("Катет 1 = \(cat1), катет 2 = \(cat2)")

print("Площадь = \((cat1 * cat2) / 2)")
print("Периметр = \(cat1 + cat2 + gip)")
print("Гипотинуза = \(gip)")

//task 3
print("3. Подсчет накоплений:")

let percent = 1.06;
let years = 5;
var amount: Double = 50_000

for _ in 1...years {
    amount *= percent;
}

print("Через \(years) лет сумма составит \(amount)")
