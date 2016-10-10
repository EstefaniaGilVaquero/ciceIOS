//
//  WWGaleriaImagenesCochesViewControllerViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 10/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class WWGaleriaImagenesCochesViewControllerViewController: UIViewController {

    //MARK: - IBOUTLET
    @IBOutlet weak var myCustomScrollView: UIScrollView!
    @IBOutlet weak var myCustomPageControll: UIPageControl!
    
    
    @IBAction func hideVC(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let altura = self.view.frame.height
        let ancho = self.view.frame.width
        
        //let alturaVariableSegunDispositivo = self.view.frame.height
        
        //1 - Creacion del bucle de fotos
        for indiceFotos in 0..<6{
            let imagenesSerJur = UIImageView(image: UIImage(named: NSString(format: "FOTO_%d.png", indiceFotos)as String))
            imagenesSerJur.frame = CGRectMake(CGFloat(indiceFotos) * ancho,0,ancho,altura)
            myCustomScrollView.addSubview(imagenesSerJur)
        }
        
        myCustomScrollView.delegate = self
        myCustomScrollView.contentSize = CGSizeMake(5 * ancho, altura)
        myCustomScrollView.pagingEnabled = true
        
        myCustomPageControll.numberOfPages = 5
        myCustomPageControll.currentPage = 0
        
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

//MARK: - EXTENCION DE SCROLL VIEW
extension WWGaleriaImagenesCochesViewControllerViewController : UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let paginado = myCustomScrollView.contentOffset.x / myCustomScrollView.frame.width
        myCustomPageControll.currentPage = Int(paginado)
    }
}