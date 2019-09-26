//
//  TimelineTableViewController.swift
//  Project20
//
//  Created by 馬丹君 on 2019/7/3.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit
import CoreData

class TimelineTableViewController: UITableViewController {
    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext : NSManagedObjectContext!
    var timeLineList: [[String:String]] = []
    var imageList: [[String:Data]] = []
    
    @IBOutlet var TimeLinetableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = app.persistentContainer.viewContext
        
        print(NSPersistentContainer.defaultDirectoryURL())
        //insertUserData()
//        queryWithPredicate()
        loadData()
        
  //      TimeLinetableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func insertUserData(){
        var timeLine = NSEntityDescription.insertNewObject(forEntityName: "TimelineEntity", into: viewContext) as! TimelineEntity
        timeLine.dateTime = Date()
        timeLine.descript = "Subqueries (also known as inner queries or nested queries) are a tool for performing operations in multiple steps. For example, if you wanted to take the sums of several columns, then average all of those values, you’d need to do each aggregation in a distinct step."
        timeLine.id = "1"
        timeLine.location = "TW"
        timeLine.photo = UIImage(named: "2")!.pngData()
        
        app.saveContext()
    }
//    func queryWithPredicate(){
//        let fetchRequest: NSFetchRequest<TimelineEntity> = TimelineEntity.fetchRequest()
//        let predicate = NSPredicate(format: "id like '*'")
//        fetchRequest.predicate = predicate
//        let sort = NSSortDescriptor(key: "id", ascending: true)
//        fetchRequest.sortDescriptors = [sort]
//        do{
//            let timeLines = try viewContext.fetch(fetchRequest)
//            for timeLine in timeLines {
//             //   print(timeLine.dateTime ?? default value)
//                timeLineList.append(["id":"\(String(describing: timeLine.id))"
//                    ,"location":"\(String(describing: timeLine.location))"
//                    ,"descript":"\(String(describing: timeLine.descript))"
//                    ,"dateTime":"\(String(describing: timeLine.dateTime))"])
//
//
//            }
//        }catch{
//            print(error)
//        }
//
//    }
    func loadData(){
        let fetchRequest: NSFetchRequest<TimelineEntity> = TimelineEntity.fetchRequest()
        let predicate = NSPredicate(format: "id like '*'")
        fetchRequest.predicate = predicate
        let sort = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        do{
            let timeLines = try viewContext.fetch(fetchRequest)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd,YYYY 'at' HH:mm a"
            
            for timeLine in timeLines {
               print(timeLine.location!)
                 print(timeLine.descript!)
                 print(dateFormatter.string(from: timeLine.dateTime!))
                imageList.append([
                    "photo":timeLine.photo!])
                timeLineList.append(["id":"\(timeLine.id!)"
                    ,"location":"\(timeLine.location!)"
                    ,"descript":"\(timeLine.descript!)"
                    ,"dateTime":"\(dateFormatter.string(from: timeLine.dateTime!))"])
                
            }
        }catch{
            print(error)
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timeLineList.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "LineTimeCell", for: indexPath) as? TimeLineTableViewCell
        
        cell?.dateLabel.text = timeLineList[indexPath.row]["dateTime"]
        cell?.descriptLabel.text = timeLineList[indexPath.row]["descript"]
        cell?.locationLabel.text = timeLineList[indexPath.row]["location"]
//        print(indexPath.row)
//        print(imageList.count)
       // cell?.timeLineImageView?.image = UIImage(named: "05")
        cell?.timeLineImageView?.image = UIImage(data: imageList[indexPath.row]["photo"]!)
        
       
        
        
        
    
     // Configure the cell...
     
        return cell!
     }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
