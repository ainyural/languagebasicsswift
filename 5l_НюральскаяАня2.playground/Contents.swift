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

enum actionWithStorageArea {
    case loadStorageArea(liters: Double)
    case unloadStorageArea(liters: Double)
}

protocol car {
    var carBrand: String {get}
    var yearOfManufacture: Int {get}
    var carEngineRunning: engineRunning {get set}
    var storageAreaVolume: Double {get set}
    var carWindowsState: windowsState {get set}
    var fullStorageAreaVolume: Double {get}
    
    func actionsWithWindows (carAction: actionWithWindows)
    func actionsWithEngine (carAction: actionWithEngine)
    mutating func actionWithStorageArea (carAction: actionWithStorageArea )
    func descriptionOfCar () -> String
    
}

extension car {
    mutating func actionWithStorageArea (carAction: actionWithStorageArea )  {
        switch carAction {
            case .loadStorageArea(let liters):
                if (storageAreaVolume + liters) <= fullStorageAreaVolume {
                    storageAreaVolume = storageAreaVolume + liters
                    print("Груз загружен в багажник машины. Заполненный объем: \(storageAreaVolume)")
                }
                else {
                    print("Багажник машины уже полон, заполненный объем: \(fullStorageAreaVolume) ")
                }
                
            case .unloadStorageArea(let liters):
                if (storageAreaVolume - liters) >= 0 {
                    storageAreaVolume = storageAreaVolume - liters
                    print("Груз выгружен из машины. Заполненный объем багажника: \(storageAreaVolume)")
                }
                else {
                    print("Недостаточно груза, заполненный объем багажника: \(storageAreaVolume)")
                }
        }
    }
}

extension car {
    func descriptionOfCar () -> String {
            return "В машине \(carEngineRunning.rawValue) и \(carWindowsState.rawValue). Заполненный объем места для груза \(storageAreaVolume) литров, доступно еще \(fullStorageAreaVolume - storageAreaVolume) литров. "
    }
}
 
// Легковая машина

class sportCar: car {
    
    let carBrand: String
    let yearOfManufacture: Int
    var carEngineRunning: engineRunning
    var storageAreaVolume: Double
    var carWindowsState: windowsState
    let fullStorageAreaVolume: Double
    let numberOfSeats: Int
    var numberOfOccupiedSeats: Int
    var sportsCarType: typesOfSportCar
    
    enum typesOfSportCar: String {
        case european = "европейская"
        case american = "американская"
    }
    
    init(carBrand: String, yearOfManufacture: Int, carEngineRunning: engineRunning, storageAreaVolume: Double, carWindowsState: windowsState, fullStorageAreaVolume: Double, numberOfSeats: Int, numberOfOccupiedSeats: Int, sportsCarType: typesOfSportCar) {
        self.carBrand = carBrand
        self.yearOfManufacture = yearOfManufacture
        self.carEngineRunning = carEngineRunning
        self.storageAreaVolume = storageAreaVolume
        self.carWindowsState = carWindowsState
        self.fullStorageAreaVolume = fullStorageAreaVolume
        self.numberOfSeats = numberOfSeats
        self.numberOfOccupiedSeats = numberOfOccupiedSeats
        self.sportsCarType = sportsCarType
    }
    
    func actionsWithEngine(carAction: actionWithEngine) {
        switch carAction {
            case .launch:
                if numberOfOccupiedSeats <= 2 {
                    self.carEngineRunning = .launched
                }
                else {
                    print("Двигатель нельзя запустить, пока в салоне машины более 2 человек. Пожалуйста, попросите пассажиров покинуть салон.")
                }
            case .switchOff:
                self.carEngineRunning = .switchedOff
        }
    }

    func countNumberOfFreeSeats() {
        if numberOfSeats >= numberOfOccupiedSeats {
            print("Количество свободных мест в салоне: \(numberOfSeats - numberOfOccupiedSeats)")
        }
        else {
            print("Количество челоек в салоне превышает допустимое")
        }
    }
    
    func actionsWithWindows (carAction: actionWithWindows) {
        switch carAction {
            case .closeWindows:
                self.carWindowsState = .close
            case .openWindows:
                self.carWindowsState = .open
        }
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return self.descriptionOfCar() + ("Тип машины - спортивная, а именно \(sportsCarType.rawValue). Количество мест в салоне автомобиля - \(numberOfSeats). Из них занято \(numberOfOccupiedSeats).")
    }
}

// Грузовая машины

class trunkCar: car {
    
    let carBrand: String
    let yearOfManufacture: Int
    var carEngineRunning: engineRunning
    var storageAreaVolume: Double
    var carWindowsState: windowsState
    let fullStorageAreaVolume: Double
    let recommendedTravelDistance: Int
    var airConditionerStatus: airConditionerWork
    
    enum airConditionerWork: String {
        case activated = "система кондиционирования активирована"
        case deactivated = "система кондиционирования отключена"
    }
    enum actionWithAirConditioner: String {
        case activate = "Активировать систему кондиционирования"
        case deactivate = "Отключить систему кондиционирования"
    }
    
    init (carBrand: String, yearOfManufacture: Int, carEngineRunning: engineRunning, storageAreaVolume: Double, carWindowsState: windowsState, fullStorageAreaVolume: Double, recommendedTravelDistance: Int, airConditionerStatus: airConditionerWork) {
        self.airConditionerStatus = airConditionerStatus
        self.recommendedTravelDistance = recommendedTravelDistance
        self.carBrand = carBrand
        self.yearOfManufacture = yearOfManufacture
        self.carEngineRunning = carEngineRunning
        self.storageAreaVolume = storageAreaVolume
        self.carWindowsState = carWindowsState
        self.fullStorageAreaVolume = fullStorageAreaVolume
        
    }

    func actionsWithEngine (carAction: actionWithEngine) {
        switch carAction {
            case .launch:
                self.carEngineRunning = .launched
            case .switchOff:
                self.carEngineRunning = .switchedOff
        }
    }
    
    func actionsWithAirConditioner (carAction: actionWithAirConditioner) {
        switch carAction {
            case .activate:
                self.airConditionerStatus = .activated
            case .deactivate:
                self.airConditionerStatus = .deactivated
        }
    }
    
    func actionsWithWindows(carAction: actionWithWindows) {
        switch carAction {
            case .closeWindows:
                self.carWindowsState = .close
            case .openWindows:
                if self.airConditionerStatus == .deactivated {
                    self.carWindowsState = .open
                }
                else {
                    print("Нельзя открывать окна, если система кондиционирования активирована")
                }
        }
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return self.descriptionOfCar() + ("Тип машины - грузовая. Рекомендуемая дальность поезки в километрах: \(recommendedTravelDistance). В машине присутствует система кондиционирования, в данный момент \(airConditionerStatus.rawValue).")
    }
}

// Экземпляры каждого класса

var toyotaRavFour = sportCar(carBrand: "Toyota", yearOfManufacture: 2015, carEngineRunning: .launched, storageAreaVolume: 500, carWindowsState: .close, fullStorageAreaVolume: 700, numberOfSeats: 4, numberOfOccupiedSeats: 3, sportsCarType: .american)

var hyundaiMighty = trunkCar(carBrand: "Hyundai", yearOfManufacture: 2008, carEngineRunning: .switchedOff, storageAreaVolume: 600, carWindowsState: .close, fullStorageAreaVolume: 2000, recommendedTravelDistance: 500, airConditionerStatus: .activated)

// Проверка

print(hyundaiMighty)
hyundaiMighty.actionsWithEngine(carAction: .launch)
print(hyundaiMighty)

print(toyotaRavFour)
toyotaRavFour.actionWithStorageArea(carAction: .unloadStorageArea(liters: 300))
print(toyotaRavFour)

