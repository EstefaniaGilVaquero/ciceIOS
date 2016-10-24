//
//  VWUsersParseTableViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 19/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Parse

class VWUsersParseTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var usersFromParse = [String]()
    var usersFollowing = [Bool]()

    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        actualizarDatosUsuariosSeguidos()
        //consultaUsuariosParse()
        self.title = PFUser.currentUser()?.username
    }
    
    func actualizarDatosUsuariosSeguidos(){
        //1. Consulta a Followers
        let queryFollowers = PFQuery(className: "Followers")
        queryFollowers.whereKey("follower", equalTo: (PFUser.currentUser()?.username)!)
        queryFollowers.findObjectsInBackgroundWithBlock { (objectFollowers, errorFollowers) in
            if errorFollowers == nil{
                if let followingPersonas = objectFollowers{
                    //2. consulta de PFQuey
                    let queryUsuariosFromParse = PFUser.query()
                    queryUsuariosFromParse?.findObjectsInBackgroundWithBlock({ (objectsUsuarios, errorUsuarios) in
                        self.usersFromParse.removeAll()
                        self.usersFollowing.removeAll()
                        for objectsData in objectsUsuarios!{
                            //3. Consulta
                            let userData = objectsData as! PFUser
                            if userData.username != PFUser.currentUser()?.username{
                                self.usersFromParse.append(userData.username!)
                                var isFollowing = false
                                for followingPersonaje in followingPersonas{
                                    if followingPersonaje["following"] as? String == userData.username{
                                        isFollowing = true
                                    }
                                }
                                self.usersFollowing.append(isFollowing)
                            }
                        }
                        self.tableView.reloadData()
                    })
                }
            }else{
                print("Error: \(errorFollowers?.userInfo)")
            }
        }
    }
    
    
    
    
    //TODO: - METODO DE CONSULTA DE USUARIOS DE PARSE
    func consultaUsuariosParse(){
        let queryUsuariosFromParse = PFUser.query()
        queryUsuariosFromParse?.findObjectsInBackgroundWithBlock({ (objectsUsuarios, errorUsuarios) in
            self.usersFromParse.removeAll()
            for objectsData in objectsUsuarios!{
                let userData = objectsData as! PFUser
                if userData.username != PFUser.currentUser()?.username{
                    self.usersFromParse.append(userData.username!)
                }
            }
            self.tableView.reloadData()
        })
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
        return usersFromParse.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let modelData = usersFromParse[indexPath.row]
        let followingData = usersFollowing[indexPath.row]
        cell.textLabel?.text = modelData
        if followingData{
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.Checkmark{
            cell?.accessoryType = UITableViewCellAccessoryType.None
            let queryFollowing = PFQuery(className: "Followers")
            queryFollowing.whereKey("follower", equalTo: (PFUser.currentUser()?.username)!)
            queryFollowing.whereKey("following", equalTo: (cell?.textLabel?.text)!)
            queryFollowing.findObjectsInBackgroundWithBlock({ (objectFollowers, errorFollowers) in
                if errorFollowers == nil{
                    if let objectFollowersData = objectFollowers{
                        for object in objectFollowersData{
                            object.deleteInBackgroundWithBlock(nil)
                        }
                    }
                }else{
                    print("Error: \(errorFollowers?.userInfo)")
                }
            })
        }else{
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            let following = PFObject(className: "Followers")
            following["following"] = cell?.textLabel?.text
            following["follower"] = PFUser.currentUser()?.username
            following.saveInBackgroundWithBlock(nil)
        }
    }
    
}














