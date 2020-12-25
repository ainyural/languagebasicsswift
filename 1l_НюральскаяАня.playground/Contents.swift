import UIKit

// Задание 1
print("Задание 1")
var a: Double = 5
var b: Double = 12
var c: Double = 6
var x: Double = 5
var firstX: Double
var secondX: Double

var discr: Double = b * b - 4 * a * c
print("Дискриминант равен " , discr)

if discr == 0 {
    x = -1*b/(2*a)
    print("Kорень равен ", x)
}

if discr < 0 {
    print("Уравнение не имее корнетй")
} else {
    firstX = (-1*b + sqrt(discr))/(2*a)
    print("Первый корень равен ", firstX)
    secondX = (-1*b - sqrt(discr))/(2*a)
    print("Второй корень равен ", secondX)
}

// Задание 2
print("Задание 2")
var sideA: Double = 15
var sideB: Double = 10
var sideC: Double
var S = (sideA * sideB)/2
print("Площадь прямоугольного треугольника равна ", S)
sideC = sqrt(sideA * sideA + sideB * sideB)
print("Гипотенуза прямоугольного треугольника равна ", sideC)
var P = sideA + sideB + sideC
print("Периметр прямоугольного треугольника равна ", P)

// Задание 3
print("Задание 3")
var depositSum: Float = 10000
var percent: Float = 5
var totalSum: Float = 5
var years: Int = 5
for _ in 1...years {
    totalSum = depositSum * (1+percent/100)
    depositSum = totalSum
}
print("Сумма вклада по истечении", years , "лет будет равна" , totalSum, "рублей")
