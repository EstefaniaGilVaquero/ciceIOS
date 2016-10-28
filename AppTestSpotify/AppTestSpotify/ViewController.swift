//
//  ViewController.swift
//  AppTestSpotify
//
//  Created by CICE on 28/10/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var busquedaURLSpotify = "https://api.spotify.com/v1/search?q=Muse&type=track,artist&market=US&limit=10&offset=5"
    typealias JSONStandard = [String : AnyObject]
    var arrayNombres = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        llamadaAlamoFireToSP(busquedaURLSpotify)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UTILS
    func llamadaAlamoFireToSP(_ conexionURL : String){
        
        Alamofire.request(conexionURL).responseJSON { (responseData) in
            self.parseAlamofiresFromSP(JSONData: responseData.data!)
        }
        
    }
    
    //PARSEO
    
    func parseAlamofiresFromSP(JSONData : Data){
        do{
            var lectorJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
           // print(lectorJSON)
            if let tracksData = lectorJSON["tracks"] as? JSONStandard{
                if let items = tracksData["items"]{
                    for indice in 0..<items.count{
                        let itemData = items[indice] as! JSONStandard
                        let nameData = itemData["name"]
                        arrayNombres.append(nameData as! String)
                        self.tableView.reloadData()
                    }
                }
            }
        }catch{
            print(error)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNombres.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = arrayNombres[indexPath.row]
        return cell!
    }


}


