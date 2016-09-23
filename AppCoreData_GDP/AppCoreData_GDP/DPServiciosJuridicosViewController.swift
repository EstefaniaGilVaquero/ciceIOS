//
//  DPServiciosJuridicosViewController.swift
//  AppCoreData_GDP
//
//  Created by formador on 14/9/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit

class DPServiciosJuridicosViewController: UIViewController {
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myCustomScrollView: UIScrollView!
    @IBOutlet weak var myCustomPageControll: UIPageControl!
    
    
    
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let alturaVariableSegunDispositivo = self.view.frame.height
        
        //1 - Creacion del bucle de fotos
        for indiceFotos in 0..<15{
            let imagenesSerJur = UIImageView(image: UIImage(named: NSString(format: "AJ_%d.jpg", indiceFotos)as String))
            imagenesSerJur.frame = CGRectMake(CGFloat(indiceFotos - 1) * 540, 0, 540, 352)
            myCustomScrollView.addSubview(imagenesSerJur)
        }
        
        myCustomScrollView.delegate = self
        myCustomScrollView.contentSize = CGSizeMake(14 * 540, 352)
        myCustomScrollView.pagingEnabled = true
        
        myCustomPageControll.numberOfPages = 14
        myCustomPageControll.currentPage = 0
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

//MARK: - EXTENCION DE SCROLL VIEW
extension DPServiciosJuridicosViewController : UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let paginado = myCustomScrollView.contentOffset.x / myCustomScrollView.frame.width
        myCustomPageControll.currentPage = Int(paginado)
    }
}
