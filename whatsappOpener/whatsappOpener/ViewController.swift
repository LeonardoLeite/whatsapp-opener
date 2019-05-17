//
//  ViewController.swift
//  whatsappOpener
//
//  Created by Leonardo A B Leite on 17/05/19.
//  Copyright © 2019 Leonardo A B Leite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func chatButtonDidTouch(_ sender: UIButton) {
        let number : String = phoneNumberTxtField.text!
        let numberUrl = "https://api.whatsapp.com/send?phone="+"55"+number
        
        print(numberUrl)
        UIApplication.shared.openURL(URL(string: numberUrl)!)
    }
    
}
