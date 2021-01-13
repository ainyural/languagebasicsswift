import UIKit

// Класс car имеет следующие свойства: марка автомобиля, год выпуска, состояние двигателя и окон, общий объем места для перевозки груза и уже заполненный объем. Также есть возможность выгрузить/загрузить груз, открыть/закрыть окна и запустить/отключить двигатель.

class car {
    let carBrand: String
    let yearOfManufacture: Int
    var carEngineRunning: engineRunning
    var storageAreaVolume: Double
    var carWindowsState: windowsState
    let fullStorageAreaVolume: Double
    
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
    
    init (carBrand: String, yearOfManufacture: Int, carEngineRunning: engineRunning, storageAreaVolume: Double, carWindowsState: windowsState, fullStorageAreaVolume: Double) {
        self.carBrand = carBrand
        self.yearOfManufacture = yearOfManufacture
        self.carEngineRunning = carEngineRunning
        self.storageAreaVolume = storageAreaVolume
        self.carWindowsState = carWindowsState
        self.fullStorageAreaVolume = fullStorageAreaVolume
    }

    func actionsWithWindows (carAction: actionWithWindows) {
        switch carAction {
            case .closeWindows:
                self.carWindowsState = .close
            case .openWindows:
                self.carWindowsState = .open
        }
    }
    
    func actionsWithEngine (carAction: actionWithEngine) {
        switch carAction {
            case .launch:
                self.carEngineRunning = .launched
            case .switchOff:
                self.carEngineRunning = .switchedOff
        }
    }
    
    func actionWithStorageArea (carAction: actionWithStorageArea )  {
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
    
    func descriptionOfCar () {
        print("В машине \(carEngineRunning.rawValue) и \(carWindowsState.rawValue). Заполненный объем места для груза \(storageAreaVolume) литров, доступно еще \(fullStorageAreaVolume - storageAreaVolume) литров. ")
    }
}

// В подклассе sportCar появилось три новых свойства - количество посадочных мест, количество занятых посадочных мест, тип спортивной машины и возможность рассчитать количество свободных мест. Также в спортивной машине в целях безопасности нельзя запустить двигатель, если в салоне находится более двух человек.

class sportCar: car {
    let numberOfSeats: Int
    var numberOfOccupiedSeats: Int
    var sportsCarType: typesOfSportCar
    
    enum typesOfSportCar: String {
        case european = "европейская"
        case american = "американская"
    }
    
    init(carBrand: String, yearOfManufacture: Int, carEngineRunning: engineRunning, storageAreaVolume: Double, carWindowsState: windowsState, fullStorageAreaVolume: Double, numberOfSeats: Int, numberOfOccupiedSeats: Int, sportsCarType: typesOfSportCar) {
        self.numberOfSeats = numberOfSeats
        self.numberOfOccupiedSeats = numberOfOccupiedSeats
        self.sportsCarType = sportsCarType
        super.init(carBrand: carBrand, yearOfManufacture: yearOfManufacture, carEngineRunning: carEngineRunning, storageAreaVolume: storageAreaVolume, carWindowsState: carWindowsState, fullStorageAreaVolume: fullStorageAreaVolume)
    }
    
    override func actionsWithEngine(carAction: actionWithEngine) {
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
    
    override func descriptionOfCar () {
        super.descriptionOfCar()
        print("Тип машины - спортивная, а именно \(sportsCarType.rawValue). Количество мест в салоне автомобиля - \(numberOfSeats). Из них занято \(numberOfOccupiedSeats).")
    }
}

// В подклассе trunkCar прибавилось два новых свойства - рекомендуемая дальность поездок в километрах и наличие системы кондиционирования. В машине подобного подкласса нельзя открывать окна, если включен двигатель и, соответсвенно, запущена система кондиционирования

class trunkCar: car {
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
    
    init (carBrand: String, yearOfManufacture: Int, carEngineRunning: car.engineRunning, storageAreaVolume: Double, carWindowsState: car.windowsState, fullStorageAreaVolume: Double, recommendedTravelDistance: Int, airConditionerStatus: airConditionerWork) {
        self.airConditionerStatus = airConditionerStatus
        self.recommendedTravelDistance = recommendedTravelDistance
        super.init(carBrand: carBrand, yearOfManufacture: yearOfManufacture, carEngineRunning: carEngineRunning, storageAreaVolume: storageAreaVolume, carWindowsState: carWindowsState, fullStorageAreaVolume: fullStorageAreaVolume)
    }

    func actionsWithAirConditioner (carAction: actionWithAirConditioner) {
        switch carAction {
            case .activate:
                self.airConditionerStatus = .activated
            case .deactivate:
                self.airConditionerStatus = .deactivated
        }
    }
    
    override func actionsWithWindows(carAction: actionWithWindows) {
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
    
    override func descriptionOfCar () {
        super.descriptionOfCar()
        print("Тип машины - грузовая. Рекомендуемая дальность поезки в километрах: \(recommendedTravelDistance). В машине присутствует система кондиционирования, в данный момент \(airConditionerStatus.rawValue).")
    }
}

var toyotaRavFour = sportCar(carBrand: "Toyota", yearOfManufacture: 2015, carEngineRunning: .launched, storageAreaVolume: 500, carWindowsState: .close, fullStorageAreaVolume: 700, numberOfSeats: 4, numberOfOccupiedSeats: 3, sportsCarType: .american)

var hyundaiMighty = trunkCar(carBrand: "Hyundai", yearOfManufacture: 2008, carEngineRunning: .switchedOff, storageAreaVolume: 600, carWindowsState: .close, fullStorageAreaVolume: 2000, recommendedTravelDistance: 500, airConditionerStatus: .activated)

// Проверка

hyundaiMighty.actionsWithWindows(carAction: .openWindows)

hyundaiMighty.descriptionOfCar()

toyotaRavFour.numberOfOccupiedSeats = 1

toyotaRavFour.actionsWithEngine(carAction: .launch)

toyotaRavFour.descriptionOfCar()
