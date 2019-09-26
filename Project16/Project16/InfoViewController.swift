//
//  InfoViewController.swift
//  Project16
//
//  Created by 馬丹君 on 2019/7/2.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var indexUser:Int = 0
    var modelUserInfo:ModelContactInfos = ModelContactInfos()
    @IBOutlet weak var infoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTableView.delegate = self
        
        print(String("InfoViewController:\(indexUser)"))
        // Do any additional setup after loading the view.
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? UserInfoTableViewCell
        cell?.InfoImageView.image = UIImage(named: String(indexUser+1))
        cell?.emailLabel.text = modelUserInfo.recent[indexUser]["email"]
        cell?.InfoNameLabel.text = modelUserInfo.recent[indexUser]["name"]
        cell?.noteLabel.text = modelUserInfo.recent[indexUser]["notes"]
        cell?.phoneLabel.text = modelUserInfo.recent[indexUser]["mobile"]
        
        // Configure the cell...

        return cell!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
