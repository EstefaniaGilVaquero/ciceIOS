//
//  InterfaceController.swift
//  app_iwatch3 WatchKit Extension
//
//  Created by CICE on 27/10/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var comidaTotal : Double = 0
    var propinaTotal : Double = 0
    
    var comidaCostoArray = [10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0]
    var propinaArray = [0.10, 0.15, 0.20, 0.25, 0.50]
    
    var botonComidaNumero = 0
    var botonPropinaNumero = 0
    
    
    @IBOutlet var myTipsLBL: WKInterfaceLabel!
    @IBOutlet var myTotal: WKInterfaceLabel!
    @IBOutlet var myTotalBTN: WKInterfaceButton!
    @IBOutlet var myTipsButton: WKInterfaceButton!
    
    @IBAction func totalComidaAction() {
        botonComidaTotalNumero()
        calcularTotal()
    }
    
    @IBAction func totalPropinaAction() {
        botonPropinaTotalNumero()
        calcularTotal()
    }
    
    func botonComidaTotalNumero(){
        botonComidaNumero += 1
        if botonComidaNumero == comidaCostoArray.count{
            botonComidaNumero = 0
        }
        printBotones()
    }
    
    func botonPropinaTotalNumero(){
        botonPropinaNumero += 1
        if botonComidaNumero == propinaArray.count{
            botonPropinaNumero = 0
        }
        printBotones()
        
    }
    
    func printBotones(){
        myTotalBTN.setTitle("Comida total: \(comidaCostoArray[botonComidaNumero])")
        myTipsButton.setTitle("Comida total: \(propinaArray[botonPropinaNumero])")
    
    }
    
    func calcularTotal(){
        propinaTotal = comidaCostoArray[botonComidaNumero] * propinaArray[botonPropinaNumero]
        comidaTotal = propinaTotal + comidaCostoArray[botonComidaNumero]
        
        printPropina()
    }
    
    func printPropina(){
        myTipsLBL.setText("Propina : €\(propinaTotal)")
        myTotal.setText("Total: €\(comidaTotal)")
    }

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
