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
    var prVentaText:String!
    var prCompraText:String!
    
    
    override func viewDidLoad() {

        prVenta.text = prVentaText
        prCompra.text = prCompraText
        
        
        montoUSD.placeholder = montoCRC.text
        super.viewDidLoad()
    }
}
