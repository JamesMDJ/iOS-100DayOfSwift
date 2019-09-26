//
//  ViewController.swift
//  Project4
//
//  Created by 馬丹君 on 2019/6/28.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var perLabel: UILabel!
    
    @IBOutlet weak var perMoney: UILabel!
    
    @IBOutlet weak var totalMoney: UILabel!
    
    @IBOutlet weak var moneyTextFiled: UITextField!
    var enterValue:Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moneyTextFiled.delegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.3) {
            self.view.endEditing(true)
        }
    
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let textFieldInt: Int? = Int(textField.text ?? String(0))
        enterValue = Float(textField.text!)
        if textFieldInt != nil{
        let number = NSNumber(value:textFieldInt!)
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        //print("$\(numberFormatter.string(for: number))")
        moneyTextFiled.text = "$\(numberFormatter.string(for: number) ?? String(0.00))"
        }else{
            moneyTextFiled.text = "$\(String(0.00))"
        }

    }

    @IBAction func valueChange(_ sender: UISlider) {
        print(String(format: "%.2f", sender.value * 100))
        perLabel.text = "Tip("+"\(Int(sender.value * 100))"+"%)"
 
        if enterValue != nil{
            perMoney.text = "$\(getMinimum(value: enterValue! * Float(sender.value)))"
        }
        var total:Float = enterValue! * Float(sender.value) + enterValue!
        totalMoney.text = "$\(getMinimum(value: total))"
    }
    
    func getMinimum(value:Float)->String{
        let number = NSNumber(value:value)
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        return numberFormatter.string(for: number)!
    }
}

