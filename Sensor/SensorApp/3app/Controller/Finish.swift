//
//  Finish.swift
//  3app
//
//  Created by 肖政铎 on 2020/2/20.
//  Copyright © 2020年 肖政铎. All rights reserved.
//

import UIKit

class Finish: UIViewController {

    @IBOutlet weak var finalPMValues: UILabel!
    
    @IBOutlet weak var finalLI: UILabel!
    
    @IBOutlet weak var finalTemperature: UILabel!
    
    @IBOutlet weak var finalHunidity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalPMValues.text = dataTransfer.shareInstance.PMDataTransfer
        finalLI.text = dataTransfer.shareInstance.LMDataTransfer
        finalTemperature.text = dataTransfer.shareInstance.temperatureTransfer
        finalHunidity.text = dataTransfer.shareInstance.humidityTransfer
        // Do any additional setup after loading the view.
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
