//
//  ICODetailViewController.swift
//  
//
//  Created by cice on 29/7/16.
//
//

import UIKit

class ICODetailViewController: UIViewController {
    
    //MARK:- VARIABLES LOCALES GLOBALES
    var name : String?
    var street : String?
    var suit : String?
    var zipCode : String?
    var latitudData : String?
    var longitudData : String?
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myStreet: UILabel!
    @IBOutlet weak var mySuit: UILabel!
    @IBOutlet weak var myCity: UILabel!
    @IBOutlet weak var myZipCode: UILabel!
    @IBOutlet weak var myMapa: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        myName.text = name
        myStreet.text = street
        mySuit.text = suit
        myZipCode.text = zipCode
        
        
        //Calculos para pintar el mapa
        //1 -> Creamos un punto en el mapa y este es nuestro centro del mapa
        let latitud : CLLocationDegrees = Double(latitudData)
        let longitud : CLLocationDegrees = Double(longitudData)
        //2 --> Zoom
        let latDelta : CLLocationDegrees = 0.001
        let longDelta : CLLocationDegrees = 0.001
        //3 --> Unimos la localizacion y el zoom en una region
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitud, longitud)
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        myPrimerMapa.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Mi casa"
        annotation.subtitle = "Estudiando hasta las 3 de la mañana"
        myMapa.addAnnotation(annotation)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
