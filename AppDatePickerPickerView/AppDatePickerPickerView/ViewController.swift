//
//  ViewController.swift
//  AppDatePickerPickerView
//
//  Created by cice on 20/5/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var pickerArrayData = ["Mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    
    var cheesImages: [UIImage] = [
        UIImage(named: "mozarella.jpg")!,
        UIImage(named: "gorgonzola.jpg")!,
        UIImage(named: "provolone.jpg")!,
        UIImage(named: "stilton.jpg")!,
        UIImage(named: "asiago.jpg")!
        
    ]
    
    
    
    //MARK: - IBOUTLET
    
    
    @IBOutlet weak var MyTituloAlimentoLBL: UILabel!
    
    
    @IBOutlet weak var myTextViewDetalleAlimentoTV: UITextView!
    
    
    @IBOutlet weak var myPickerViewSeleccionaAlimento: UIPickerView!
    
    
    @IBOutlet weak var myCheesImage: UIImageView!
    
    
    //MARK; - CICLO DE VIDA DEL CONTROLADOR
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: - Aqui va la implementacion de delegado y datasource del PickerView
        myPickerViewSeleccionaAlimento.delegate = self
        myPickerViewSeleccionaAlimento.dataSource = self
        
        //MyTituloAlimentoLBL.text = pickerArrayData[0]
        //self.title = pickerArrayData[0]
        //myTextViewDetalleAlimentoTV.text = pickerArrayData[0]
        myTextViewDetalleAlimentoTV.text = "La mozzarella1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

//MARK: - EXTENSION DEL PICKER VIEW

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    //Numero de componentes
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Numero de Fila
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->
    Int {
        return pickerArrayData.count
        
    }
    
    //Que me pinte cada uno de los objetos de array
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArrayData[row]
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.title = pickerArrayData[row]
        
        switch row {
        case 0:
            myTextViewDetalleAlimentoTV.text = "La mozzarella1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
            myCheesImage.image = cheesImages[0]
        case 1:
            myTextViewDetalleAlimentoTV.text = "El gorgonzola es un queso italiano de mesa, de pasta cremosa y untuosa, hecho con leche entera pasteurizada de vaca que se presenta en dos variedades: dulce y picante. La existencia de este queso se conoce desde la Edad Media, aunque solo fue en el siglo XI cuando comenzó a tener el aspecto enmohecido que posee en la actualidad. Se emplea frecuentemente como ingrediente en diversos platos de la cocina italiana."
            myCheesImage.image = cheesImages[1]
        case 2:
            myTextViewDetalleAlimentoTV.text = "El provolone (Provolone Val Padana) es un queso italiano originario del sur del país, donde se sigue produciendo en piezas de 10 a 15 cm con diversas formas (pera alargada, salchicha o cono). Sin embargo, la región de producción más importante de provolone es actualmente el norte de Italia (Piamonte, Lombardía y Véneto). La familia Provenzano de Venecia afirma haber sido la descubridora de este tipo de queso, pero no ha podido demostrarlo. El queso Provolone fue descubierto o creado por la Familia Visani en Deruta (centro de Italia) En Estados Unidos se comercializa con el nombre Provolone un queso relativamente barato comercializado como aliño para pizzas, que se parece al original italiano sólo en color y textura, no en sabor."
        case 3:
            myTextViewDetalleAlimentoTV.text = ""
            myCheesImage.image = cheesImages[2]
        case 4:
            myTextViewDetalleAlimentoTV.text = ""
            myCheesImage.image = cheesImages[3]
        case 5:
            myTextViewDetalleAlimentoTV.text = ""
            myCheesImage.image = cheesImages[4]
        default:
            break
        }
    }
    
}












































