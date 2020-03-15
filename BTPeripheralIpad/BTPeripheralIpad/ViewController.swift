//
//  ViewController.swift
//  BluetoothPeripheral
//
//  Created by xudeyan on 2020/2/18.
//  Copyright © 2020 Deyan XU. All rights reserved.
//


// 这是接收模拟数据的app
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
    
    var centralManager: CBCentralManager!
    var deyanPeripheral: CBPeripheral!
    
    @IBOutlet weak var pm1p0Label: UILabel!
    @IBOutlet weak var pm2p5Label: UILabel!
    @IBOutlet weak var pm10Label: UILabel!
    @IBOutlet weak var pmC0p3Label: UILabel!
    @IBOutlet weak var pmC0p5Label: UILabel!
    @IBOutlet weak var pmC1p0Label: UILabel!
    @IBOutlet weak var pmC2p5Label: UILabel!
    @IBOutlet weak var pm5p0Label: UILabel!
    @IBOutlet weak var pmC10Label: UILabel!
    @IBOutlet weak var tovcLabel: UILabel!
    @IBOutlet weak var illuminanceLabel: UILabel!
    @IBOutlet weak var uvLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
}

extension ViewController: CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state{
            
        case .unknown,.resetting,.unsupported,.unauthorized,.poweredOff:
            print("please check your device...")
        case .poweredOn:
            print("OK")
            central.scanForPeripherals(withServices: [serviceUUID])
        @unknown default:
            print("unkonw error...")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        deyanPeripheral = peripheral
        central.stopScan()
        central.connect(deyanPeripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        central.connect(peripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices([serviceUUID])
    }
}

extension ViewController: CBPeripheralDelegate{
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let service = peripheral.services?.first else {return}
        peripheral.discoverCharacteristics([pm1p0UUID, pm2p5UUID, pm10UUID, pmC0p3UUID, pmC0p5UUID, pmC1p0UUID, pmC2p5UUID, pmC5p0UUID, pmC10UUID, tovcUUID, illuminanceUUID, uvUUID, humidityUUID, tempUUID, pressureUUID, altitudeUUID], for: service)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else{return}
//        print(service.uuid)
        for characteristic in characteristics{
            if characteristic.properties.contains(.write){
                print("write")
            }
            if characteristic.properties.contains(.read){
                print("read")
            }
            if characteristic.properties.contains(.notify){
                peripheral.setNotifyValue(true, for: characteristic)
                print(characteristic.uuid)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        switch characteristic.uuid{
        case pm1p0UUID:
            print("1")
            pm1p0Label.text = String(data: characteristic.value!, encoding: .utf8)
        case pm2p5UUID:
             print("2")
            pm2p5Label.text = String(data: characteristic.value!, encoding: .utf8)
        case pm10UUID:
             print("3")
            pm10Label.text = String(data: characteristic.value!, encoding: .utf8)
        case tovcUUID:
             print("4")
            tovcLabel.text = String(data: characteristic.value!, encoding: .utf8)
        case illuminanceUUID:
             print("5")
            illuminanceLabel.text = String(data: characteristic.value!, encoding: .utf8)
        case uvUUID:
             print("6")
            uvLabel.text = String(data: characteristic.value!, encoding: .utf8)
        case humidityUUID:
             print("7")
            humidityLabel.text = String(data: characteristic.value!, encoding: .utf8)
        case tempUUID:
            print("8")
            tempLabel.text = String(data: characteristic.value!, encoding: .utf8)
        case pressureUUID:
            print("9")
            pressureLabel.text = String(data: characteristic.value!, encoding: .utf8)
        case altitudeUUID:
            print("10")
            altitudeLabel.text = String(data: characteristic.value!, encoding: .utf8)
        default:
            break
        }
    }
}
