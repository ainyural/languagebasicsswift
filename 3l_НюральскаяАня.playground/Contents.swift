import UIKit

enum windowsState: String {
    case open = "окна открыты"
    case close = "окна закрыты"
}

enum actionWithWindows: String {
    case openWindows = "Открыть окна"
    case closeWindows = "Закрыть окна"
}

enum engineRunning: String {
    case launched = "двигатель запущен"
    case switchedOff = "двигатель отключен"
}

enum actionWithEngine: String {
    case launch = "Запустить двигатель"
    case switchOff = "Отключить двигатель"
}

enum actionWithBody {
    case loadCargo(liters: Double)
    case unloadCargo(liters: Double)
}

enum actionWithTrunk {
    case loadCargo(liters: Double)
    case unloadCargo(liters: Double)
}
struct sportCar {
    let carBrand: String
    let yearOfManufacture: Int
    var sportCarEngineRunning: engineRunning
    var bodyVolume: Double
    var sportCarWindowsState: windowsState
    var fullBodyVolume: Double
    
    mutating func actionsWithWindows (sportCarAction: actionWithWindows) {
        switch sportCarAction {
        case .closeWindows:
            self.sportCarWindowsState = .close
        case .openWindows:
            self.sportCarWindowsState = .open
        }
    }
    
    mutating func actionsWithEngine (sportCarAction: actionWithEngine) {
        switch sportCarAction {
        case .launch:
            self.sportCarEngineRunning = .launched
        case .switchOff:
            self.sportCarEngineRunning = .switchedOff
        }
    }
    
    mutating func actionWithBody (sportCarAction: actionWithBody )  {
        switch sportCarAction {
        case .loadCargo(let liters):
            if (bodyVolume + liters) <= fullBodyVolume {
                bodyVolume = bodyVolume + liters
                print("Груз загружен в багажник машины. Заполненный объем: \(bodyVolume)")
            }
            else {
                print("Багажник машины уже полон, заполненный объем: \(fullBodyVolume) ")
            }
        case .unloadCargo(let liters):
            if (bodyVolume - liters) >= 0 {
                bodyVolume = bodyVolume - liters
                print("Груз выгружен из машины. Заполненный объем багажника: \(bodyVolume)")
            }
            else {
                print("Недостаточно груза, заполненный объем багажника: \(bodyVolume)")
            }
        }
    }
    
    func descriptionOfSportCar () {
        print("В легковой машине \(sportCarEngineRunning.rawValue) и \(sportCarWindowsState.rawValue). Заполненный объем багажника \(bodyVolume) литров, доступно еще \(fullBodyVolume - bodyVolume) литров.")
    }
}

struct trunkCar {
    let carBrand: String
    let yearOfManufacture: Int
    var trunkCarEngineRunning: engineRunning
    var trunkVolume: Double
    var trunkCarWindowsState: windowsState
    let fullTrunkVolume: Double // в литрах
    
    mutating func actionsWithWindows (trunkCarAction: actionWithWindows) {
        switch trunkCarAction {
        case .closeWindows:
            self.trunkCarWindowsState = .close
        case .openWindows:
            self.trunkCarWindowsState = .open
        }
    }
    
    mutating func actionsWithEngine (trunkCarAction: actionWithEngine) {
        switch trunkCarAction {
        case .launch:
            self.trunkCarEngineRunning = .launched
        case .switchOff:
            self.trunkCarEngineRunning = .switchedOff
        }
    }
    
    mutating func actionWithTrunk (trunkCarAction: actionWithTrunk )  {
        switch trunkCarAction {
        case .loadCargo(let liters):
            if (trunkVolume + liters) <= fullTrunkVolume {
                trunkVolume = trunkVolume + liters
                print("Груз загружен в кузов машины. Заполненный объем: \(trunkVolume)")
            }
            else {
                print("Кузов машины уже полон, заполненный объем: \(fullTrunkVolume) ")
            }
        case .unloadCargo(let liters):
            if (trunkVolume - liters) >= 0 {
                trunkVolume = trunkVolume - liters
                print("Груз выгружен из машины. Заполненный объем кузова: \(trunkVolume)")
            }
            else {
                print("Недостаточно груза, заполненный объем кузова: \(trunkVolume)")
            }
        }
    }
    
    func descriptionOfTrunkCar () {
        print("В грузовой машине \(trunkCarEngineRunning.rawValue) и \(trunkCarWindowsState.rawValue). Заполненный объем кузова \(trunkVolume) литров, доступно еще \(fullTrunkVolume - trunkVolume) литров.")
    }
}

var toyotaRavFour = sportCar(carBrand: "Toyota", yearOfManufacture: 2019, sportCarEngineRunning: .launched, bodyVolume: 50, sportCarWindowsState: .open, fullBodyVolume: 500)

var hyundaiMighty = trunkCar(carBrand: "Hyundai", yearOfManufacture: 2007, trunkCarEngineRunning: .launched, trunkVolume: 40, trunkCarWindowsState: .close, fullTrunkVolume: 700)

toyotaRavFour.actionWithBody(sportCarAction: .loadCargo(liters: 40))

hyundaiMighty.actionsWithWindows(trunkCarAction: .closeWindows)

hyundaiMighty.descriptionOfTrunkCar()

