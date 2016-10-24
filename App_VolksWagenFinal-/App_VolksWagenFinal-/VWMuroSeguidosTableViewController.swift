//
//  VWMuroSeguidosTableViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 24/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Parse

class VWMuroSeguidosTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var postDataParseFollowings = [VWUserDataModel]()


    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //MARK: - UTILS
    func getFollowingsQueryDDBB(){
        
        //1. Consulta
        let getFollowersQuery = PFQuery(className: "Followers")
        getFollowersQuery.whereKey("follower", equalTo: (PFUser.currentUser()?.username)!)
        getFollowersQuery.findObjectsInBackgroundWithBlock { (objectUno, error) in
            
        if error != nil{
            if let objectUnoDes = objectUno{
                var followedUser = ""
                for objectData in objectUnoDes{
                    followedUser = objectData["following"] as! String
                    //2. Consulta
                    let query = PFQuery(className: "PostImagenVW")
                    query.whereKey("username", equalTo: followedUser)
                    query.findObjectsInBackgroundWithBlock({ (objectDos, errorDos) in
                        if errorDos != nil{
                            if let objectDosDes = objectDos{
                                for objectDataDos in objectDosDes{
                                    let postImagenFinal = VWUserDataModel(pdescripcionData: objectDataDos["descripcionImagen"] as! String,
                                            puserNameData: objectDataDos["username"] as! String,
                                            pimagePostData: objectDataDos["imageFileVW"] as! PFFile)
                                    self.postDataParseFollowings.append(postImagenFinal)
                                }
                                self.tableView.reloadData()
                            }else{
                                    print("Error : \(errorDos?.userInfo)")
                            }
                        }
                    })
                }
            }else{
                print("Error : \(error?.userInfo)")
            }
        }else{
            self.presentViewController(showAlertVC("Estimado usuario", messageData: "ha ocurrido un problema al cargar la imagen"), animated: true, completion: nil)
        }
        
        }
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
        return postDataParseFollowings.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! VWMuroCustomCell

        let modelData = postDataParseFollowings[indexPath.row]
        let modelImageData = postDataParseFollowings[indexPath.row]
        
        cell.myNombreUsuario.text = modelData.userNameData
        cell.myDescripcionFoto.text = modelData.descripcionData
        
        modelImageData.imagePostData?.getDataInBackgroundWithBlock({ (dataImage, errorImage) in
            if errorImage == nil{
                let imageDownloaded = UIImage(data: dataImage!)
                cell.myImagen.image = imageDownloaded
            }else{
                self.presentViewController(showAlertVC("Estimado usuario", messageData: "ha ocurrido un problema al cargar la imagen"), animated: true, completion: nil)
            }
        })

        return cell
    }
    

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 371
    }
}
