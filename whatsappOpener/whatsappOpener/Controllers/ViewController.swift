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
    @IBOutlet weak var zapImage: UIImageView!
    @IBOutlet weak var startChatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.startChatButton.layer.cornerRadius = 15
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imageClicked))
        zapImage.addGestureRecognizer(gesture)
        self.phoneNumberTxtField.becomeFirstResponder()
    }

    @IBAction func chatButtonDidTouch(_ sender: UIButton) {
        let number : String = phoneNumberTxtField.text!
        let numberUrl = "https://api.whatsapp.com/send?phone="+"55"+number
        
        print(numberUrl)
        UIApplication.shared.open(URL(string: numberUrl)!, options: [:])
    }
    
    @objc func imageClicked() {
        self.phoneNumberTxtField.resignFirstResponder()
    }
}
