//
//  SBPerfilLinkedInTableViewController.swift
//  AppTableView_XIB
//
//  Created by cice on 17/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SBPerfilLinkedInTableViewController: UITableViewController {
    
    //MARK: - LIFE VC

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        -(void)viewWillAppear:(BOOL)animated
//        {
//            CGFloat tableBorderLeft = 20;
//            CGFloat tableBorderRight = 20;
//            
//            CGRect tableRect = self.view.frame;
//            tableRect.origin.x += tableBorderLeft; // make the table begin a few pixels right from its origin
//            tableRect.size.width -= tableBorderLeft + tableBorderRight; // reduce the width of the table
//            tableView.frame = tableRect;
//        }
//        
        
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "ubuntu.jpg" ))
        
        //Aqui registramos los XIB/NIB
        tableView.registerNib(UINib(nibName: "SYBPerfilCustomCell", bundle: nil), forCellReuseIdentifier: "PerfilCustomCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return 1
        }
        if section == 1{
            return 1
        }
        if section == 2{
            return 1
        }
        if section == 3{
            return 1
        }
        
        return Int()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cellProfile = tableView.dequeueReusableCellWithIdentifier("PerfilCustomCell", forIndexPath: indexPath) as! SYBPerfilCustomCell
            
            // Configure the cell...
            cellProfile.myImageProfile.image = UIImage(named: "deep.jpg")
            cellProfile.myNumberCount.text = "2º level"
            cellProfile.myNombreLBL.text = "Estefi Gil"
            cellProfile.myPuestoLBL.text = "Master of the Universe"
            cellProfile.myLugarLBL.text = "Madrid y alrrededores"
            cellProfile.mySeguidoresLBL.text = "Estefi tienes mas de 500 contactos"
            
            return cellProfile
        }
        if indexPath.section == 1{
            let cellFriendPost = tableView.dequeueReusableCellWithIdentifier("cellFriendPost", forIndexPath: indexPath) as! SYBPosteosTableViewCell
            
            // Configure the cell...
            cellFriendPost.myImageFriend.image = UIImage(named: "deep.jpg")
            cellFriendPost.myJobLBL.text = "Master of the universe"
            cellFriendPost.myNameFriend.text = "Jhony Depp"
            cellFriendPost.myPostNumber.text = "50"
            cellFriendPost.myDescriptionLBL.text = "lerem ipsum blablablabla"
            cellFriendPost.myImagePost.image = UIImage(named: "deep.jpg")
            cellFriendPost.myLastPostLBL.text = "2 semanas"
            cellFriendPost.myTitleLBL.text = "Marketing of lorem ipsum bla bla bla"
            cellFriendPost.myLikesNumber.text = "Me gusta 2"
            cellFriendPost.myFontPost.text = "El Pais.com"
  
            return cellFriendPost
        }

        
        
        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 200
        }
        if indexPath.section == 1{
            return 350
        }
        if indexPath.section == 2{
            return 1
        }
        if indexPath.section == 3{
            return 1
        }
        return CGFloat()

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
