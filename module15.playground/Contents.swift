import UIKit

print("Обработка ошибок")
enum ServerErrors: Error {
    case error_400
    case error_404
    case error_500
}
var error_400 = false
var error_404 = true
var error_500 = false
func serverControl() throws {
    if error_400 {
        throw ServerErrors.error_400
    }
    if error_404 {
        throw ServerErrors.error_404
    }
    if error_500 {
        throw ServerErrors.error_500
    }
}
do {
    try serverControl()
} catch ServerErrors.error_400 {
    print("400 Bad Request")
} catch ServerErrors.error_404 {
    print("404 Not Found")
} catch ServerErrors.error_500 {
    print("500 Internal Server Error")
}


print("\nСравнение типов")
enum TypeComparisonResult: Error {
    case equalTypes
    case notEqualTypes
}
func typeComparison<A,B>(a: A, b: B) throws -> Void {
    if type(of: a) == type(of: b) {
        throw TypeComparisonResult.equalTypes
    } else {
        throw TypeComparisonResult.notEqualTypes
    }
}
var intNumber = 7
var doubleNumber = 5.0
do {
    try typeComparison(a: intNumber, b: doubleNumber)
} catch TypeComparisonResult.equalTypes {
    print("Yes")
} catch TypeComparisonResult.notEqualTypes {
    print("No")
}


print("\nСравнение чисел")
func numbersComparison<A: Equatable>(_ a: A, _ b: A) -> Void {
    if a == b {
        print("Числа равны")
    } else {
        print("Числа не равны")
    }
}
let num1 = 7
let num2 = 8
numbersComparison(num1, num2)
