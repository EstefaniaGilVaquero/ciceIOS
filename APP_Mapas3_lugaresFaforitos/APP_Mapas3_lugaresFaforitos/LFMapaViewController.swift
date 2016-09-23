//
//  ViewController.swift
//  APP_Mapas3_lugaresFaforitos
//
//  Created by cice on 7/9/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LFMapaViewController: UIViewController {
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myLugaresFavoritos: MKMapView!
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    var customLocationManager = CLLocationManager()
    let prefs = NSUserDefaults.standardUserDefaults()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if filaActivaSeleccionada == -1{
        
            customLocationManager.delegate = self
            customLocationManager.desiredAccuracy = kCLLocationAccuracyBest
            customLocationManager.requestWhenInUseAuthorization()
            customLocationManager.startUpdatingLocation()
            
        }else{
            
            let latitud = NSString(string: lugaresGuardados[filaActivaSeleccionada]["lat"]!).doubleValue
            let longitud = NSString(string: lugaresGuardados[filaActivaSeleccionada]["long"]!).doubleValue
            let centerMap = CLLocationCoordinate2DMake(latitud, longitud)
            let region = MKCoordinateRegionMake(centerMap, MKCoordinateSpanMake(0.01, 0.01))
            myLugaresFavoritos.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = centerMap
            annotation.title = lugaresGuardados[filaActivaSeleccionada]["calle"]
            annotation.subtitle = lugaresGuardados[filaActivaSeleccionada]["numero"]
            myLugaresFavoritos.addAnnotation(annotation)
        }
        
        myLugaresFavoritos.mapType = MKMapType.Satellite
        let longGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(LFMapaViewController.presionaMapaParaNuevoPunto(_:)))
        longGestureRecognizer.minimumPressDuration = 1
        myLugaresFavoritos.addGestureRecognizer(longGestureRecognizer)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UTILS
    func presionaMapaParaNuevoPunto(gesture : UIGestureRecognizer){
        
        if gesture.state == UIGestureRecognizerState.Began{
            let touchePoint = gesture.locationInView(myLugaresFavoritos)
            let newCoordinate = myLugaresFavoritos.convertPoint(touchePoint, toCoordinateFromView: myLugaresFavoritos)
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                var newTitle = ""
                var newSubTitle = ""
                
                if let placemarkData = placemarks?[0]{
                    if placemarkData.thoroughfare != nil{
                        newTitle += "\(placemarkData.thoroughfare!)"
                    }
                    if placemarkData.subThoroughfare != nil{
                        newSubTitle += "\(placemarkData.subThoroughfare!)"
                    }
                    if newTitle == ""{
                        newSubTitle += "La calle no existe"
                    }
                    if newSubTitle == ""{
                        newSubTitle += "Punto añadido el \(NSDate())"
                    }
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = newCoordinate
                    annotation.title = newTitle
                    annotation.subtitle = newSubTitle
                    self.myLugaresFavoritos.addAnnotation(annotation)
                    
                    lugaresGuardados.append(["calle": newTitle, "numero": newSubTitle, "lat": "\(newCoordinate.latitude)", "long": "\(newCoordinate.longitude)"])
                    //lo guardamos tb en las preferencias de usuario
                    self.prefs.setObject(lugaresGuardados, forKey: "luegaresGuardados")
                    
                }
                
            })
            
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = newCoordinate
//            annotation.title = "Nueva ubicacion"
//            annotation.subtitle = "Aqui estamos de nuevo"
//            myLugaresFavoritos.addAnnotation(annotation)
            
        }
        
    }


}

extension LFMapaViewController : CLLocationManagerDelegate{
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first{

            let region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude), MKCoordinateSpanMake(0.01, 0.01))
            self.myLugaresFavoritos.setRegion(region, animated: true)
        }
    }
}

