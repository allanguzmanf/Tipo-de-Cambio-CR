//
//  CalculadoraViewController.swift
//  Tipo de Cambio CR
//
//  Created by Allan Guzman on 5/22/20.
//  Copyright © 2020 Allan Guzman. All rights reserved.
//

import UIKit
import SwiftSoup

class CalculadoraViewController: UIViewController {
    
    @IBOutlet weak var montoUSD: UITextField!
    @IBOutlet weak var montoCRC: UITextField!
    @IBOutlet weak var prVenta: UILabel!
    @IBOutlet weak var prCompra: UILabel!
    
    override func viewDidLoad() {
//        let vc1 = storyboard?.instantiateViewController(identifier: "home") as! ViewController
//        vc1.completionHandler = { text in
//            self.prVenta.text = "Venta\(String(describing: text))"
//        }
        montoUSD.placeholder = montoCRC.text
        super.viewDidLoad()
    }
}
