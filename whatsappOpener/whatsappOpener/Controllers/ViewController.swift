//
//  ViewController.swift
//  whatsappOpener
//
//  Created by Leonardo A B Leite on 17/05/19.
//  Copyright © 2019 Leonardo A B Leite. All rights reserved.
//

import UIKit

struct Country : Decodable {
    let COUNTRY : String
    let CODE : String
    let ISO : String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var zapImage: UIImageView!
    @IBOutlet weak var startChatButton: UIButton!
    
    var countryCodes = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.startChatButton.layer.cornerRadius = 15
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imageClicked))
        zapImage.addGestureRecognizer(gesture)
        self.phoneNumberTxtField.becomeFirstResponder()
        
        self.getDataFromJsonFile()
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
    
    func getDataFromJsonFile()
    {
        let paths = Bundle.main.path(forResource: "countries", ofType: "json")!
        let datas = try! Data(contentsOf: URL(fileURLWithPath: paths), options: Data.ReadingOptions.mappedIfSafe)
        
        do {
            let decoder = JSONDecoder()
            self.countryCodes = try decoder.decode([Country].self, from: datas)
            print(countryCodes)
        } catch let error{
            print("Erro", error)
        }
    }
    
    /*
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
 */
}
