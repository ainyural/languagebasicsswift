import UIKit

// Задание 1
func parityDefinition ( userNumber: Int ) { var
    coefficient = userNumber%2
    if coefficient == 0 { print("Число четное")}
    else { print("Число нечетное")} }

parityDefinition(userNumber: 5)

// Задание 2
func threeDivision ( numberForDivision: Int ) { var
    divisionRemainder = numberForDivision%3
    if divisionRemainder == 0 { print("Число делится на три без остатка")}
    else { print("Число не делится на три без остатка")} }

threeDivision(numberForDivision: 6)

// Задание 3
var massive: Array <Int> = []
var element: Int = 1
while element < 101 { massive.append (element)
    element = element + 1
}
print (massive)

// Задание 4
var num: Int = massive.count - 1
while num >= 0  {
    var leftAfterDivisionTwo: Int = massive[num]%2
    var leftAfterDivisionThree: Int = massive[num]%3
    if leftAfterDivisionTwo == 0 || leftAfterDivisionThree != 0 { massive.remove(at: num) }
    num = num - 1
}
print(massive)

// Задание 5

var massiveFibonacci: Array <Int> = [0, 1]
var indexFibonacci: Int = 0
while massiveFibonacci.count <= 92 { massiveFibonacci.append(massiveFibonacci[indexFibonacci] + massiveFibonacci[indexFibonacci + 1])
indexFibonacci = indexFibonacci + 1
}
print(massiveFibonacci)

