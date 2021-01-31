import UIKit

struct queue<T: Comparable> {
    var queueElements: [T]
    
    mutating func addElement (_ element: T) {
        return queueElements.append(element)
    }
    mutating func takeAwayElement() -> T? {
       return queueElements.removeFirst()
    }
    func clientsFilter(element: T){
       let filtred = queueElements.filter{$0 != element}
        print(filtred)
    }
}

var queueInThePharmacy = queue<Int>(queueElements: [55, 56, 57, 58, 59])

// Проверка

queueInThePharmacy.addElement(60)

print(queueInThePharmacy.queueElements)

queueInThePharmacy.takeAwayElement()

print(queueInThePharmacy.queueElements)

// Методы высшего порядка

queueInThePharmacy.clientsFilter(element: 57)
