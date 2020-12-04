//
//  ViewController.swift
//  myFirstApp
//
//  Created by Guest User on 27.11.2020.
//  Copyright © 2020 Guest User. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSpinner

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBAction func buttonPressed(_ sender: Any) {
        SwiftSpinner.show("Downloading data");
        let user: String? = inputText.text;
        
        let address = "https://api.github.com/users/" + user! + "/repos"
        Alamofire.request(address).responseString {  response in
            switch response.result{
            case .success(let JSON):
                self.resultLabel.text = JSON
                print(JSON)
            case .failure(_):
                self.resultLabel.text = "Error"
            }
        }
        
        SwiftSpinner.hide()
        
    }
    
}


