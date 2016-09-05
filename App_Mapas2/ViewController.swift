//
//  ViewController.swift
//  App_Mapas2
//
//  Created by cice on 5/9/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myPrimerMapaMV: MKMapView!
    
    @IBAction func showMyLocation(sender: AnyObject) {
        
        let location = CLLocationCoordinate2DMake(40.433667, -3.676266)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(location, span)
        myPrimerMapaMV.setRegion(region, animated: true)
        
        let annotationMap = MKPointAnnotation()
        annotationMap.coordinate = location
        annotationMap.title = "Madrid"
        annotationMap.subtitle = "Estamos aqui :"
        myPrimerMapaMV.addAnnotation(annotationMap)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.actionLongPress(_:)))
        longPressGR.minimumPressDuration = 2
        myPrimerMapaMV.addGestureRecognizer(longPressGR)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - UTILS
    func actionLongPress(gesture : UIGestureRecognizer){
        if gesture.state == UIGestureRecognizerState.Began{
            let touchePoint = gesture.locationInView(myPrimerMapaMV)
            let newCoordinate : CLLocationCoordinate2D = myPrimerMapaMV.convertPoint(touchePoint, toCoordinateFromView: myPrimerMapaMV)
            let annotation = MKPointAnnotation()
            annotation.coordinate = newCoordinate
            annotation.title = "Nueva ubicacion"
            annotation.subtitle = "Estamos aqui"
            myPrimerMapaMV.addAnnotation(annotation)
            
        }
        
    }

}
