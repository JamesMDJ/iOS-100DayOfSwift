//
//  FeaturedViewController.swift
//  Project30
//
//  Created by 馬丹君 on 2019/7/8.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionCellLayout: UICollectionViewFlowLayout!
    var movieList:Array<String> =
        ["Trailer 2","Good Boys",
         "Playmobil: The Movie",
         "Aquarela","Aladdin",
         "Frozen II","Downton Abbey",
         "Shaft","Spies in Disguise",
         "The Sun Is Also a Star","Dark Phoenix",
         "The Angry Birds Movie 2","Shazam!"
    ]
    

    @IBOutlet weak var movieScrollView: UIScrollView!
    var movieUIImageView : UIImageView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        let movieUIImage = UIImage(named:"1")
        movieUIImageView = UIImageView(image:movieUIImage)
        movieUIImageView?.frame = CGRect(
            x: 0, y: 0, width: movieScrollView.bounds.width, height: movieScrollView.bounds.height)
        movieUIImageView?.contentMode = .scaleToFill
        movieScrollView.addSubview(movieUIImageView!)
        let movieUIImage2 = UIImage(named:"2")
        movieUIImageView = UIImageView(image:movieUIImage2)
        movieUIImageView?.frame = CGRect(
            x: movieScrollView.bounds.width, y: 0, width: movieScrollView.bounds.width, height: movieScrollView.bounds.height)
        movieUIImageView?.contentMode = .scaleToFill
        movieScrollView.addSubview(movieUIImageView!)
        let movieUIImage3 = UIImage(named:"3")
        movieUIImageView = UIImageView(image:movieUIImage3)
        movieUIImageView?.frame = CGRect(
            x: movieScrollView.bounds.width * 2, y: 0, width: movieScrollView.bounds.width, height: movieScrollView.bounds.height)
        movieUIImageView?.contentMode = .scaleToFill
        movieScrollView.addSubview(movieUIImageView!)
        movieScrollView.contentSize = CGSize(width: movieScrollView.bounds.width * 3, height: movieScrollView.bounds.height)
        movieScrollView.delegate = self
        collectionCellLayout.minimumLineSpacing = 0
        collectionCellLayout.minimumInteritemSpacing = 0
        
        collectionCellLayout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.333-20, height: 200)
        
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCell", for: indexPath) as! FeaturedCollectionViewCell
        
        cell.movieImageView.image = UIImage(named: "m\(indexPath.row+1)")
        cell.movieNameLabel.text = movieList[indexPath.row]
        return cell
    }

}
