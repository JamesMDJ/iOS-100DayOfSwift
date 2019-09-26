//
//  ViewController.swift
//  Project39
//
//  Created by 馬丹君 on 2019/7/12.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var headerImageView: UIImageView!
    
    var productList:[String:String] = ["id":"1","productName":"空拍機"]


    @IBOutlet weak var cellLayout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        self.navigationController?.navigationBar.shadowImage = image
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isHidden = false
        cellLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width-20)/3, height: 140)
        cellLayout.minimumLineSpacing = 0
        cellLayout.minimumInteritemSpacing = 0
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            as! ProductCollectionViewCell
        cell.productImageView.image = UIImage(named:"p\(indexPath.row+1)")
        cell.productImageView.layer.cornerRadius = 30
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           print("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)")
    }
    
    
  
    
    @IBAction func panImageView(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began{
            print("begin")
            print("x:\(sender.location(in: sender.view).x),y:\(sender.location(in: sender.view).y)")
            updateImageView()
        }
//        if sender.state == .changed{
//            print("chane")
//            print("x:\(sender.location(in: sender.view).x),y:\(sender.location(in: sender.view).y)")
//        }
        
        if sender.state == .ended{
            print("end")
            print("x:\(sender.location(in: sender.view).x),y:\(sender.location(in: sender.view).y)")
            reductionImageView()
        }
    }
    
    func updateImageView(){
            self.headerImageView.frame = CGRect(x: -0.25*UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width*1.5, height: 500)
        
            self.stackView.frame.origin.y = self.stackView.frame.origin.y + 50
    }
    func reductionImageView(){
        UIView.animate(withDuration: 0.4) {
                 self.headerImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 450)
             self.stackView.frame.origin.y = self.stackView.frame.origin.y - 50
        }
       
    }
    
//    func updateImageView() {
//        var headerRect = CGRect(x: 0, y: -375, width: tableView.bounds.width, height: 375)
//        if tableView.contentOffset.y < -375 {
//            headerRect.origin.y = tableView.contentOffset.y
//            headerRect.size.height = -tableView.contentOffset.y
//        }
//        headerView.frame = headerRect
//    }


}

