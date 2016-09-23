//
//  SYBPrincipalWallTableViewController.swift
//  App_CustomCell_Dictionary_Practica
//
//  Created by cice on 13/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBPrincipalWallTableViewController: UITableViewController {
    
    //MARK: VARIABLES LOCALES GLOBALES
    
    var posteosArray = []
    var posteosDiccionario = [:]
    
override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("Contactos", ofType: "plist")
        posteosArray = NSArray(contentsOfFile: path!)!

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posteosArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SYBCustomCell

        // Configure the cell...
        posteosDiccionario = posteosArray.objectAtIndex(indexPath.row) as! NSDictionary
        
        let nameuser = posteosDiccionario["firstName"] as! String
        let apellido = posteosDiccionario["lastName"] as! String
        let usernameTwitter = posteosDiccionario["usernameTwitter"] as! String
        let datePost = posteosDiccionario["createdPost"] as! String
        let likeButton = posteosDiccionario["likeButton"] as! String
        let share = posteosDiccionario["share"] as! String
        let comment = posteosDiccionario["description"] as! String
        let description = posteosDiccionario["description"] as! String
        let imageProfile = posteosDiccionario["imageProfile"] as! String
        let imagePost = posteosDiccionario["imagePost"] as! String
        
        let imageProfileCustom = UIImage(named: imageProfile)
        let imagePostCustom = UIImage(named: imagePost)
        
        cell.myNameuserLBL.text = nameuser
        cell.myApellidoLBL.text = apellido
        cell.myUsernameTwitterLBL.text = usernameTwitter
        cell.myDatePostBL.text = datePost
        cell.myLikeStringLBL.text = likeButton
        cell.myShareStringLBL.text = share
        cell.myCommentStringLBL.text = comment
        cell.myDescriptionLBL.text = description
        cell.myImageProfileIV.image = imageProfileCustom
        cell.myImagePostIV.image = imagePostCustom



        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
