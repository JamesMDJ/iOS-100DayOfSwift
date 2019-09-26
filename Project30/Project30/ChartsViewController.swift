//
//  ChartsViewController.swift
//  Project30
//
//  Created by 馬丹君 on 2019/7/8.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ChartsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChartsTableViewCell
        // Configure the cell...
        cell.movieTitle.text = "\(indexPath.row+1)"
        cell.movieImageView.image = UIImage(named: "m\(indexPath.row+1)")
        cell.movieNameLabel.text = movieList[indexPath.row]
        cell.movieDescriptionLabel.text = "Descript Movie"
        return cell
    }

}
