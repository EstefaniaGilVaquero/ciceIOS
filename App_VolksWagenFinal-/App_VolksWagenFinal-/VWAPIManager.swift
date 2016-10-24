//
//  VWAPIManager.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 5/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class VWAPIManager: NSObject {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    private let CONSTANTES = Constantes()
    private let concesionarios = VWConcesionariosParser()
    private let catalogoPruebas = VWCatalogoPruebasParser()
    private let ofertas = VWOfertasParser()
    
    
    //MARK: - SINGLETON
    class var sharedInstance : VWAPIManager{
        struct SingletonApp {
            static let instance = VWAPIManager()
        }
        return SingletonApp.instance
    }
    
    
    //MARK: - GETCONCESIONARIO
    func getConcesionarioParse() -> [VWConcesionariosModel]{
        let url = NSURL(string: CONSTANTES.BASE_URL_CONCESIONARIOS)
        let jsonData = NSData(contentsOfURL: url!)
        let arrayConcesionarios = concesionarios.getConcesionariosModel(jsonData!)
        return arrayConcesionarios
    }
    
    //MARK: - GETCATALOGO_PRUEBAS
    func getCatalogoPruebasParse() -> [VWCatalogoPruebasModel]{
        let url = NSURL(string: CONSTANTES.BASE_URL_CATALOGO_PRUEBAS)
        let jsonData = NSData(contentsOfURL: url!)
        let arrayCatalogoPruebas = catalogoPruebas.getCatalogoPruebasModel(jsonData!)
        return arrayCatalogoPruebas
    }
    
    
    //MARK: - GETOFERTAS
    func getOfertasParse() -> [VWOfertasModel]{
        let url = NSURL(string: CONSTANTES.BASE_URL_OFERTAS)
        let jsonData = NSData(contentsOfURL: url!)
        let arrayOfertas = ofertas.getOfertasModel(jsonData!)
        return arrayOfertas
    }



}
