//
//  Testing.swift
//  3app
//
//  Created by 肖政铎 on 2020/2/20.
//  Copyright © 2020年 肖政铎. All rights reserved.
//

import UIKit


class Testing: UIViewController {
    
    
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var PMValues: UILabel!
    @IBOutlet weak var LMValues: UILabel!
    @IBOutlet weak var temperatureValue: UILabel!
    @IBOutlet weak var humidityValues: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func testBegin(_ sender: Any) {
        let PMTest = Float(arc4random()%6400)
        PMValues.text = String(format: "%.2f", PMTest/100)
        
        let LMTest = Float(arc4random()%6400)
        LMValues.text = String(format:"%.2f", LMTest/100)
        
        let temperatureTest = Float(arc4random()%6400)
        temperatureValue.text = String(format:"%.2f", temperatureTest/100)
        
        let humidityTest = Float(arc4random()%6400)
        humidityValues.text = String(format:"%.2f",humidityTest/100)
        
        dataTransfer.shareInstance.PMDataTransfer = PMValues.text ?? "none"
        dataTransfer.shareInstance.LMDataTransfer = LMValues.text ?? "none"
        dataTransfer.shareInstance.temperatureTransfer = temperatureValue.text ?? "none"
        dataTransfer.shareInstance.humidityTransfer = humidityValues.text ?? "none"
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
