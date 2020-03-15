//
//  ViewController.swift
//  BluetoothCentralForIOSPeriheral
//
//  Created by xudeyan on 2020/2/20.
//  Copyright © 2020 Deyan XU. All rights reserved.
//



// this is the simulation
import UIKit
import CoreBluetooth

let serviceUUID = CBUUID(string: "53129BF2-2BAB-4540-A90C-BBE3DC81387E")

let pm1p0UUID = CBUUID(string: "72A898AB-361A-42AB-AD0A-A42E23A18B7F")
let pm2p5UUID = CBUUID(string: "88AF254F-47E1-410C-BA0D-0B34149B49F0")
let pm10UUID = CBUUID(string: "ABA86B42-B481-4939-A307-D3B81C3C00B8")
let pmC0p3UUID = CBUUID(string: "AC609827-2B80-4846-9AE3-406314EE797B")
let pmC0p5UUID = CBUUID(string: "C1DE6D29-CEA4-4838-9418-3FEA3F97BA2B")
let pmC1p0UUID = CBUUID(string: "48B42E06-4724-40BE-A7AE-8A15E045F829")
let pmC2p5UUID = CBUUID(string: "BB830FE2-E303-4AAC-B177-FBB24DD4E977")
let pmC5p0UUID = CBUUID(string: "43404283-77F9-484D-AD87-FFC5AFCEB8DD")
let pmC10UUID = CBUUID(string: "040C3D02-0903-4661-BE74-BAB868D003D8")
let tovcUUID = CBUUID(string: "12D1AA93-EAEE-4697-8662-8FB276FC4441")
let illuminanceUUID = CBUUID(string: "FEB585B0-F4B5-41C6-AC07-9918C2E97D42")
let uvUUID = CBUUID(string: "308F3233-E882-456B-B608-F65868849137")
let humidityUUID = CBUUID(string: "3D23AD20-357D-411F-A23E-D193F614E554")
let tempUUID = CBUUID(string: "3E14F35C-D157-438D-90DA-38D3F6B0C7F9")
let pressureUUID = CBUUID(string: "F07CE70A-0794-48E9-9FB3-3331738CECBA")
let altitudeUUID = CBUUID(string: "D9AF3D0E-3072-4F7D-97FA-C7C4C3E62142")


class ViewController: UIViewController {

    // 声明一个外设管理
    var peripheralManager: CBPeripheralManager!
    
    var pm1p0Characteristic: CBMutableCharacteristic!
    var pm2p5Characteristic: CBMutableCharacteristic!
    var pm10Characteristic: CBMutableCharacteristic!
    var pmC0p3Characteristic: CBMutableCharacteristic!
    var pmC0p5Characteristic: CBMutableCharacteristic!
    var pmC1p0Characteristic: CBMutableCharacteristic!
    var pmC2p5Characteristic: CBMutableCharacteristic!
    var pmC5p0Characteristic: CBMutableCharacteristic!
    var pmC10Characteristic: CBMutableCharacteristic!
    var tovcCharacteristic: CBMutableCharacteristic!
    var illuminanceCharacteristic: CBMutableCharacteristic!
    var uvCharacteristic: CBMutableCharacteristic!
    var humidityCharacteristic: CBMutableCharacteristic!
    var tempCharacteristic: CBMutableCharacteristic!
    var pressureCharacteristic: CBMutableCharacteristic!
    var altitudeCharacteristic: CBMutableCharacteristic!
    var timer: Timer?
    
    @IBOutlet weak var pm1p0Label: UILabel!
    @IBOutlet weak var pm2p5Label: UILabel!
    @IBOutlet weak var pmC0p3Label: UILabel!
    @IBOutlet weak var pmC0p5Label: UILabel!
    @IBOutlet weak var pm10Label: UILabel!
    @IBOutlet weak var pmC1p0Label: UILabel!
    @IBOutlet weak var pmC2p5Label: UILabel!
    @IBOutlet weak var pmC5p0Label: UILabel!
    @IBOutlet weak var pmC10Label: UILabel!
    @IBOutlet weak var TOVCLabel: UILabel!
    @IBOutlet weak var illuminanceLabel: UILabel!
    @IBOutlet weak var uvLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
}

extension ViewController: CBPeripheralManagerDelegate{
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state{
            
        case .unknown:
            print("unkonw status.")
        case .resetting:
            print("resetting status.")
        case .unsupported:
            print("unsupported status.")
        case .unauthorized:
            print("unauthorized status.")
        case .poweredOff:
            print("poweredOff status.")
        case .poweredOn:
            print("OK.")
            // 创建服务, 设置服务和特征
            let service = CBMutableService(type: serviceUUID, primary: true)
            pm1p0Characteristic = CBMutableCharacteristic(type: pm1p0UUID, properties: .notify, value: nil, permissions: .readable)
            pm2p5Characteristic = CBMutableCharacteristic(type: pm2p5UUID, properties: .notify, value: nil, permissions: .readable)
            pm10Characteristic = CBMutableCharacteristic(type: pm10UUID, properties: .notify, value: nil, permissions: .readable)
            pmC0p3Characteristic = CBMutableCharacteristic(type: pmC0p3UUID, properties: .notify, value: nil, permissions: .readable)
            pmC0p5Characteristic = CBMutableCharacteristic(type: pmC0p5UUID, properties: .notify, value: nil, permissions: .readable)
            pmC1p0Characteristic = CBMutableCharacteristic(type: pmC1p0UUID, properties: .notify, value: nil, permissions: .readable)
            pmC2p5Characteristic = CBMutableCharacteristic(type: pmC2p5UUID, properties: .notify, value: nil, permissions: .readable)
            pmC5p0Characteristic = CBMutableCharacteristic(type: pmC5p0UUID, properties: .notify, value: nil, permissions: .readable)
            pmC10Characteristic = CBMutableCharacteristic(type: pmC10UUID, properties: .notify, value: nil, permissions: .readable)
            tovcCharacteristic = CBMutableCharacteristic(type: tovcUUID, properties: .notify, value: nil, permissions: .readable)
            illuminanceCharacteristic = CBMutableCharacteristic(type: illuminanceUUID, properties: .notify, value: nil, permissions: .readable)
            uvCharacteristic = CBMutableCharacteristic(type: uvUUID, properties: .notify, value: nil, permissions: .readable)
            humidityCharacteristic = CBMutableCharacteristic(type: humidityUUID, properties: .notify, value: nil, permissions: .readable)
            tempCharacteristic = CBMutableCharacteristic(type: tempUUID, properties: .notify, value: nil, permissions: .readable)
            pressureCharacteristic = CBMutableCharacteristic(type: pressureUUID, properties: .notify, value: nil, permissions: .readable)
            altitudeCharacteristic = CBMutableCharacteristic(type: altitudeUUID, properties: .notify, value: nil, permissions: .readable)
            
            service.characteristics = [pm1p0Characteristic, pm2p5Characteristic, pm10Characteristic, pmC0p3Characteristic, pmC0p5Characteristic, pmC1p0Characteristic, pmC2p5Characteristic, pmC5p0Characteristic, pmC10Characteristic, tovcCharacteristic, illuminanceCharacteristic, uvCharacteristic, humidityCharacteristic, tempCharacteristic, pressureCharacteristic, altitudeCharacteristic]
            // 添加服务
            peripheral.add(service)
            peripheralManager.startAdvertising([CBAdvertisementDataServiceUUIDsKey:[serviceUUID]])
            
        @unknown default:
             print("unkonw status.")
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        if let error = error{
            print("can not add service, reason is: \(error.localizedDescription)")
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error{
            print("can not advertise, reason is: \(error.localizedDescription)")
        }
    }
//    写入数值 a暂时不需要
//    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
//
//    }
    
//    读取数值, 暂时不需要
//    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
//        if request.characteristic.properties.contains(.read){
//            request.value = readLable.text!.data(using: .utf8)
//            peripheral.respond(to: request, withResult: .success)
//        } else{
//            peripheral.respond(to: request, withResult: .readNotPermitted)
//        }
//    }
    
    // 当中心设备订阅了某个值时, 调用这个
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        switch characteristic.uuid{
        case pm1p0UUID:
            updatePM1p0()
        case pm2p5UUID:
            updatePM2p5()
        case pm10UUID:
             updatePM10()
        case tovcUUID:
             updateTOVC()
        case illuminanceUUID:
             updateIlluminance()
        case uvUUID:
             updateUV()
        case humidityUUID:
            updateHumidity()
        case tempUUID:
           updateTemp()
        case pressureUUID:
            updatePressure()
        case altitudeUUID:
            updateAltitude()
        default:
            break
        }
//        updatePM1p0()
//        updatePM2p5()
//        updatePM10()
//        updateTOVC()
//        updateUV()
//        updateTemp()
//        updateHumidity()
//        updatePressure()
//        updateIlluminance()
//        updateAltitude()
//        updateValue()
        
    }
    
    func peripheralManagerIsReady(toUpdateSubscribers peripheral: CBPeripheralManager) {
//        updatePM1p0()
//        updatePM2p5()
//        updatePM10()
//        updateTOVC()
//        updateUV()
//        updateTemp()
//        updateHumidity()
//        updatePressure()
//        updateIlluminance()
//        updateAltitude()
        updateValue()
    }

    // 取消订阅时 关闭计时器
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        timer?.invalidate()
    }
    
    func updateValue(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            // pm2.5
            let randomPM2p5 = Int.random(in: 10..<45)
            let pm2p5Str = "\(randomPM2p5)"
            self.peripheralManager.updateValue(pm2p5Str.data(using: .utf8)!, for: self.pm2p5Characteristic, onSubscribedCentrals: nil)
            print("1")
            self.pm2p5Label.text = pm2p5Str
            // PM1.0
            let randomPM1p0 = Int.random(in: 20..<50)
            let pm1p0Str = "\(randomPM1p0)"
            self.peripheralManager.updateValue(pm1p0Str.data(using: .utf8)!, for: self.pm1p0Characteristic, onSubscribedCentrals: nil)
            print("2")
            self.pm1p0Label.text = pm1p0Str
            // PM10
            let randomPM10 = Int.random(in: 25..<125)
            let pm10Str = "\(randomPM10)"
            self.peripheralManager.updateValue(pm10Str.data(using: .utf8)!, for: self.pm10Characteristic, onSubscribedCentrals: nil)
            print("3")
            self.pm10Label.text = pm10Str
            //TOVC
            let randomTOVC = Int.random(in: 0..<15)
            let tovcStr = "\(randomTOVC)"
            self.peripheralManager.updateValue(tovcStr.data(using: .utf8)!, for: self.tovcCharacteristic, onSubscribedCentrals: nil)
            self.TOVCLabel.text = tovcStr
            //illuminance
            let randomillu = Int.random(in: 50..<550)
            let illStr = "\(randomillu)"
            self.peripheralManager.updateValue(illStr.data(using: .utf8)!, for: self.illuminanceCharacteristic, onSubscribedCentrals: nil)
            self.illuminanceLabel.text = illStr
            //uv
            let randomUV = Int.random(in: 0..<25)
            let uvStr = "\(randomUV)"
            self.peripheralManager.updateValue(uvStr.data(using: .utf8)!, for: self.uvCharacteristic, onSubscribedCentrals: nil)
            self.uvLabel.text = uvStr
            //humidity
            let randomHumidity = Int.random(in: 30..<60)
            let humidityStr = "\(randomHumidity)"
            self.peripheralManager.updateValue(humidityStr.data(using: .utf8)!, for: self.humidityCharacteristic, onSubscribedCentrals: nil)
            self.humidityLabel.text = humidityStr
            //temp
            let randomTemp = Int.random(in: 15..<34)
            let tempStr = "\(randomTemp)"
            self.peripheralManager.updateValue(tempStr.data(using: .utf8)!, for: self.tempCharacteristic, onSubscribedCentrals: nil)
            self.tempLabel.text = tempStr
            // pressure
            let randomPressure = Int.random(in: 1..<3)
            let pressureStr = "\(randomPressure)"
            self.peripheralManager.updateValue(pressureStr.data(using: .utf8)!, for: self.pressureCharacteristic, onSubscribedCentrals: nil)
            self.pressureLabel.text = pressureStr
            // altitude
            let randomAltitude = Int.random(in: 100..<2200)
            let altitudeStr = "\(randomAltitude)"
            self.peripheralManager.updateValue(altitudeStr.data(using: .utf8)!, for: self.altitudeCharacteristic, onSubscribedCentrals: nil)
            self.altitudeLabel.text = altitudeStr
       }
    }
    
    // PM2.5
    func updatePM2p5(){
        // 发送实时数据
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            let randomInt = Int.random(in: 10..<45)
            let pm2p5Str = "\(randomInt)"
            self.peripheralManager.updateValue(pm2p5Str.data(using: .utf8)!, for: self.pm2p5Characteristic, onSubscribedCentrals: nil)
            self.pm2p5Label.text = pm2p5Str
        }
    }
    // PM1.0
    func updatePM1p0(){
        // 发送实时数据
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            let randomInt = Int.random(in: 20..<50)
            let pm1p0Str = "\(randomInt)"
            self.peripheralManager.updateValue(pm1p0Str.data(using: .utf8)!, for: self.pm1p0Characteristic, onSubscribedCentrals: nil)
            self.pm1p0Label.text = pm1p0Str
        }
    }
    // PM10
    func updatePM10(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            let randomInt = Int.random(in: 25..<125)
            let pm10Str = "\(randomInt)"
            self.peripheralManager.updateValue(pm10Str.data(using: .utf8)!, for: self.pm10Characteristic, onSubscribedCentrals: nil)
            self.pm10Label.text = pm10Str
        }
    }
    // PMcount0.3
    // PMcount0.5
    // PMcount1.0
    // PMcount2.5
    // PMcount5.0
    // PMcount10

    // TOVC
    func updateTOVC(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            let randomInt = Int.random(in: 0..<15)
            let tovcStr = "\(randomInt)"
            self.peripheralManager.updateValue(tovcStr.data(using: .utf8)!, for: self.tovcCharacteristic, onSubscribedCentrals: nil)
            self.TOVCLabel.text = tovcStr
        }
    }
    // illuminance
    func updateIlluminance(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            let randomInt = Int.random(in: 50..<550)
            let illStr = "\(randomInt)"
            self.peripheralManager.updateValue(illStr.data(using: .utf8)!, for: self.illuminanceCharacteristic, onSubscribedCentrals: nil)
            self.illuminanceLabel.text = illStr
        }
    }

    // UV index
    func updateUV(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            let randomInt = Int.random(in: 0..<25)
            let uvStr = "\(randomInt)"
            self.peripheralManager.updateValue(uvStr.data(using: .utf8)!, for: self.uvCharacteristic, onSubscribedCentrals: nil)
            self.uvLabel.text = uvStr
        }
    }

    // humidity
    func updateHumidity(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            let randomInt = Int.random(in: 30..<60)
            let humidityStr = "\(randomInt)"
            self.peripheralManager.updateValue(humidityStr.data(using: .utf8)!, for: self.humidityCharacteristic, onSubscribedCentrals: nil)
            self.humidityLabel.text = humidityStr
        }
    }

    // temperature
    func updateTemp(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
           let randomInt = Int.random(in: 15..<34)
           let tempStr = "\(randomInt)"
           self.peripheralManager.updateValue(tempStr.data(using: .utf8)!, for: self.tempCharacteristic, onSubscribedCentrals: nil)
           self.tempLabel.text = tempStr
        }
    }

    // pressure
    // 可以用l网络api请求
    func updatePressure(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            let randomInt = Int.random(in: 1..<3)
            let pressureStr = "\(randomInt)"
            self.peripheralManager.updateValue(pressureStr.data(using: .utf8)!, for: self.pressureCharacteristic, onSubscribedCentrals: nil)
            self.pressureLabel.text = pressureStr
        }
    }

    // altitude
    func updateAltitude(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
           let randomInt = Int.random(in: 100..<2200)
           let altitudeStr = "\(randomInt)"
            self.peripheralManager.updateValue(altitudeStr.data(using: .utf8)!, for: self.altitudeCharacteristic, onSubscribedCentrals: nil)
           self.altitudeLabel.text = altitudeStr
       }
    }
}
    
//
// service.characteristics = [pm1p0Characteristic, pm2p5Characteristic, pm10Characteristic, pmC0p3Characteristic, pmC0p5Characteristic, pmC1p0Characteristic, pmC2p5Characteristic, pmC5p0Characteristic, pmC10Characteristic, tovcCharacteristic, illuminanceCharacteristic, uvCharacteristic, humidityCharacteristic, tempCharacteristic, pressureCharacteristic, altitudeCharacteristic]
