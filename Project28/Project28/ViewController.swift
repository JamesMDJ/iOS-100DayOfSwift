//
//  ViewController.swift
//  Project28
//
//  Created by 馬丹君 on 2019/7/6.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
    var movieUIImageView:UIImageView? = nil
    var movieList:Array<String> =
        ["Trailer 2","Good Boys",
         "Playmobil: The Movie",
         "Aquarela","Aladdin",
         "Frozen II","Downton Abbey",
         "Shaft","Spies in Disguise",
         "The Sun Is Also a Star","Dark Phoenix",
         "The Angry Birds Movie 2","Shazam!"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let movieUIImage = UIImage(named:"01")
        movieUIImageView = UIImageView(image:movieUIImage)
        movieUIImageView?.frame = CGRect(
            x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        movieUIImageView?.contentMode = .scaleToFill
        scrollView.addSubview(movieUIImageView!)
        let movieUIImage2 = UIImage(named:"02")
        movieUIImageView = UIImageView(image:movieUIImage2)
        movieUIImageView?.frame = CGRect(
            x: scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        movieUIImageView?.contentMode = .scaleToFill
        scrollView.addSubview(movieUIImageView!)
        let movieUIImage3 = UIImage(named:"03")
        movieUIImageView = UIImageView(image:movieUIImage3)
        movieUIImageView?.frame = CGRect(
            x: scrollView.bounds.width * 2, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        movieUIImageView?.contentMode = .scaleToFill
        scrollView.addSubview(movieUIImageView!)
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * 3, height: scrollView.bounds.height)
        scrollView.delegate = self
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x  >= 60 {
            print("now is \(scrollView.contentOffset.x)")
            
        }
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("end")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
     
     // Configure the cell...
     cell.textLabel?.text = movieList[indexPath.row]
     return cell
     }
    
}

