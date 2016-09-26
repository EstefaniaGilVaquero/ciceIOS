//
//  ICOUsersDataTableViewController.swift
//  App_RetoMVCWS
//
//  Created by User on 27/7/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class ICOUsersDataTableViewController: UITableViewController {
    
    var arrayUsers = [ICOUsersModel]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        arrayUsers = APIManager.sharedInstance.getUsersApi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayUsers.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ICOUsersCustomCell

        // Configure the cell...
        let userModel = arrayUsers[indexPath.row]
        
        cell.myIdLBL.text = "\(userModel.id!)"
        cell.myNameLBL.text = userModel.name
        cell.myUsernameLBL.text = userModel.username
        cell.myEmailLBL.text = userModel.email
        cell.myStreetLBL.text = userModel.address?.street
        cell.mySuiteLBL.text = userModel.address?.suite
        cell.myZipcodeLBL.text = userModel.address?.zipcode
        cell.myLatitudLBL.text = userModel.address?.geo?.lat
        cell.myLongitudLBL.text = userModel.address?.geo?.lng
        cell.myPhoneLBL.text = userModel.phone
        cell.myWebsiteLBL.text = userModel.website
        cell.myComapanyNameLBL.text = userModel.company?.name
        cell.myCatchPhraseLBL.text = userModel.company?.catchPhrase
        cell.myBsLBL.text = userModel.company?.bs

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let ventana2VC = self.storyboard?.instantiateViewControllerWithIdentifier("detalle") as! ICODetailViewController
        
        //ventana2VC.name = arrayMeses[indexPath.row]
        
        // navigationController?.pushViewController(ventana2VC, animated: true)
        self.presentViewController(ventana2VC, animated: true, completion: nil)
        print("Estas seleccionando el mes \(arrayMeses[indexPath.row])")
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
