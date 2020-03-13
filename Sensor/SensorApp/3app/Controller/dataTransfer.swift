//
//  dataTransfer.swift
//  3app
//
//  Created by 肖政铎 on 2020/3/13.
//  Copyright © 2020年 肖政铎. All rights reserved.
//

import Foundation
import UIKit

class dataTransfer: NSObject{
    var PMDataTransfer = ""
    var LMDataTransfer = ""
    var temperatureTransfer = ""
    var humidityTransfer = ""
    static let shareInstance = dataTransfer()
    
    private override init(){
        
    }
}
