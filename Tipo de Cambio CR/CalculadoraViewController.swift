//
//  CalculadoraViewController.swift
//  Tipo de Cambio CR
//
//  Created by Allan Guzman on 5/22/20.
//  Copyright © 2020 Allan Guzman. All rights reserved.
//

import UIKit
import SwiftSoup

class CalculadoraViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var viewUSD: UIStackView!
    @IBOutlet weak var viewCRC: UIStackView!
    @IBOutlet weak var montos: UIStackView!
    @IBOutlet weak var nombreBancoCalc: UILabel!
    @IBOutlet weak var montoUSD: UITextField!
    @IBOutlet weak var montoCRC: UITextField!
    @IBOutlet weak var prVenta: UILabel!
    @IBOutlet weak var prCompra: UILabel!
    
    
    var prVentaText:String!
    var prCompraText:String!
    var nombreBancoCalcText:String!
    var isViewsSwitched = true
    
    
    override func viewDidLoad() {
        montoCRC.delegate = self
        montoUSD.delegate = self
        prVenta.text = prVentaText
        prCompra.text = prCompraText
        nombreBancoCalc.text = nombreBancoCalcText
//        NotificationCenter.default.addObserver(self,selector: #selector(self.batteryLevelChanged),name: Notification.Name("Text")object: nil)
        
        super.viewDidLoad()
    }
    
    
    @IBAction func swapButton(_ sender: Any) {
            //montos.addArrangedSubview(self.montos.subviews[0])
        if self.isViewsSwitched{
            montos.addArrangedSubview(self.montos.subviews[0])
            self.isViewsSwitched = false
        }else{
            montos.addArrangedSubview(self.montos.subviews[1])
            self.isViewsSwitched = true

        }
        //guard let btn = sender as? UIButton else { return }
//        let viewIndex = montos.arrangedSubviews.lastIndex(of: viewUSD)!
//        print(viewIndex)
        print(montos.arrangedSubviews[0] == viewUSD)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let viewIndexUSD = montos.arrangedSubviews.firstIndex(of: viewUSD)!
        let viewIndexCRC = montos.arrangedSubviews.firstIndex(of: viewCRC)!
//        if viewIndex == 1 {
//            textField = montoUSD
//        } else {
//            textField = montoCRC
//        }
        if textField == montoUSD && viewIndexUSD == 1 {
            return false
        } else if textField == montoCRC && viewIndexCRC == 1 {
            return false
        }
        return true
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == montoCRC {
//            montoUSD.placeholder = "6"
//        }
//    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if montoUSD. == montoUSD{
        }
    }
}
