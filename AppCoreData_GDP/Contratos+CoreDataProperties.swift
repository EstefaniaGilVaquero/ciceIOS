//
//  Contratos+CoreDataProperties.swift
//  AppCoreData_GDP
//
//  Created by cice on 19/9/16.
//  Copyright © 2016 iCologic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contratos {

    @NSManaged var despachoAbogados: String?
    @NSManaged var direccionEmpresa: String?
    @NSManaged var mesFecha: String?
    @NSManaged var nombreEmpresa: String?
    @NSManaged var nombreTitularCuenta: String?
    @NSManaged var nombreYApellido: String?
    @NSManaged var numeroCaja: String?
    @NSManaged var numeroColegiado1: String?
    @NSManaged var numeroColegiado2: String?
    @NSManaged var numeroCuenta: String?
    @NSManaged var numeroFecha: String?
    @NSManaged var observacionesGenerales: String?

}
