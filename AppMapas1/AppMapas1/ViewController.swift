//
//  ViewController.swift
//  AppMapas1
//
//  Created by cice on 29/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myPrimerMapa: MKMapView!
    @IBOutlet weak var myInfoLBL: UILabel!
    
    
    @IBAction func myShowMap(sender: AnyObject) {
        
        //1 -> Creamos un punto en el mapa y este es nuestro centro del mapa
        let latitud : CLLocationDegrees = 40.389925
        let longitud : CLLocationDegrees = -3.760911
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
        myPrimerMapa.addAnnotation(annotation)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creamos un gesto de reconocimiento / TARGET - ACTION
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.actionGesture(_:)))
        longPressGestureRecognizer.minimumPressDuration = 2
        myPrimerMapa.addGestureRecognizer(longPressGestureRecognizer)
        
    }
    
    func actionGesture(gestureRecognizer : UIGestureRecognizer){
        
        let puntoTocado = gestureRecognizer.locationInView(myPrimerMapa)
        let nuevaCoordenada : CLLocationCoordinate2D = myPrimerMapa.convertPoint(puntoTocado, toCoordinateFromView: myPrimerMapa)
        let annotation = MKPointAnnotation()
        annotation.coordinate = nuevaCoordenada
        annotation.title = "Nuevo punto en el Mapa"
        annotation.subtitle = "Currando en iOS"
        myPrimerMapa.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

