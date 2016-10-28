//
//  InterfaceController.swift
//  AppTest1WatchOSX2 WatchKit Extension
//
//  Created by CICE on 24/10/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    //MARK: - VARIABLES LOCALES
    var myNombre = "Andres"
    let colorNaranja = UIColor.orangeColor()
    let colorAzul = UIColor.blueColor()
    var valorSlider = 0
    
    //MARK - IBOUTLET
    
    @IBOutlet var myButton: WKInterfaceButton!
    @IBOutlet var mySwitch: WKInterfaceSwitch!
    @IBOutlet var mySlider: WKInterfaceSlider!
    @IBOutlet var myLabel: WKInterfaceLabel!
    
    @IBAction func myBotonAction() {
        actionUno()
    }
    @IBAction func mySwitchAction(value: Bool) {
        
        if value{
            actionDos()
        }else{
            
        }
        
        
    }
    @IBAction func mySliderAction(value: Float) {
        
        valorSlider = Int(value)
        actionTres()
    }
    
    
    //MARK: - UTILS ACTIONS
    func actionUno(){
        myButton.setTitle("CICE")
        myButton.setBackgroundColor(colorNaranja)
        myLabel.setText("HOLA MUNDO")
        myLabel.setTextColor(colorNaranja)
        mySwitch.setColor(colorNaranja)
        mySwitch.setOn(false)
        mySlider.setColor(colorNaranja)
    }
    
    func actionDos(){
        
        myButton.setTitle("ICOLOGIC")
        myButton.setBackgroundColor(colorAzul)
        myLabel.setTextColor(colorAzul)
        myLabel.setText("HOLA ESTEFI")
        mySlider.setColor(colorAzul)
    }
    
    func actionTres(){
        switch valorSlider {
        case 1:
            mySlider.setColor(colorAzul)
            myLabel.setText(String(valorSlider))
        case 2:
            mySlider.setColor(UIColor.magentaColor())
        case 3:
            mySlider.setColor(UIColor.yellowColor())
        case 4:
            mySlider.setColor(UIColor.whiteColor())
        case 5:
            mySlider.setColor(UIColor.orangeColor())
        case 6:
            mySlider.setColor(UIColor.greenColor())
        default:
            mySlider.setColor(UIColor.brownColor())
        }
    }
    
    
    //MARK: - LIFE VC
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
