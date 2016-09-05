//
//  SegundaDetailViewController.swift
//  App_Mapas2
//
//  Created by cice on 5/9/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit
import CoreLocation

class SegundaDetailViewController: UIViewController {
    
    let customLocationManager = CLLocationManager()
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myLatitudLBL: UILabel!
    @IBOutlet weak var myLongitudLBL: UILabel!
    @IBOutlet weak var myRumboLBL: UILabel!
    @IBOutlet weak var myVelocidadLBL: UILabel!
    @IBOutlet weak var myAltitud: UILabel!
    @IBOutlet weak var myDireccionLBL: UILabel!
    
    
    //MARK: - IBACTION
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customLocationManager.delegate = self
        customLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        customLocationManager.requestWhenInUseAuthorization()
        customLocationManager.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SegundaDetailViewController : CLLocationManagerDelegate{
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let userLocation = locations[0]
        if let userLocation = locations.first{
            myLatitudLBL.text = "\(userLocation.coordinate.latitude)"
            myLongitudLBL.text = "\(userLocation.coordinate.longitude)"
            myRumboLBL.text = "\(userLocation.course)"
            myVelocidadLBL.text = "\(userLocation.speed)"
            myAltitud.text = "\(userLocation.altitude)"
            
            //GEOCOIFICACION INVERSA
            
        }
    }
    
}