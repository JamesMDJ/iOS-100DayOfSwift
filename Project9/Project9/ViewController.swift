//
//  ViewController.swift
//  Project9
//
//  Created by 馬丹君 on 2019/6/29.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func selectPhotoOnClick(_ sender: Any) {
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self
        imagePickerVC.modalPresentationStyle = .fullScreen
        show(imagePickerVC, sender: sender)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoImageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}

