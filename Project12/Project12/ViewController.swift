//
//  ViewController.swift
//  Project12
//
//  Created by 馬丹君 on 2019/7/1.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newMovieTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        newMovieTextField.returnKeyType = .done
        newMovieTextField.delegate = self
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MovieList") as? FoodTableViewController{
            if textField.text != nil{
                controller.list.append(textField.text!)
              //  present(controller, animated: true, completion: nil)
                //self.navigationController?.present(controller, animated: true, completion: nil)
                  self.navigationController?.pushViewController(controller, animated: true)
               //  self.navigationController?.popToViewController(controller, animated: true)
                //   self.navigationController?.present(controller, animated: true, completion: nil)
            }
            
            
        }
        return true
    }

}

