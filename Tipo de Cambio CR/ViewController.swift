//
//  ViewController.swift
//  Tipo de Cambio CR
//
//  Created by Allan Guzman on 5/22/20.
//  Copyright © 2020 Allan Guzman. All rights reserved.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

  


    @IBOutlet weak var mejorVentaBanco: UILabel!
    @IBOutlet weak var mejorCompraBanco: UILabel!
    @IBOutlet weak var mejorCompra: UILabel!
    @IBOutlet weak var mejorVenta: UILabel!
    @IBOutlet weak var listaGeneral: UITableView!
    
    
    override func viewDidLoad() {
//        completionHandler?(listaGeneral.
        super.viewDidLoad()
        arraysData()
        mejores()
        listaGeneral.delegate = self
        listaGeneral.dataSource = self
        }
    public var completionHandler: ((String?) -> Void)?
    var tipoEntidad = [String]()
    public var banco = [String]()
    public var precioCompra = [Float]()
    public var precioVenta = [Float]()
    var precioDif = [Float]()
    var actualizacion = [String]()
    let bancosDiminutivo = ["Entidad Autorizada","BCR", "BNCR", "BPDC", "BAC San José", "BCT S.A.", "Cathay S.A.", "CMB", "Davivienda S.A.", "Banco General S.A.", "Improsa S.A.", "Lafise S.A.", "Promérica S.A.", "Scotiabank S.A.", "Prival Bank S.A.", "Cafsa S.A.", "Comeca S.A.", "Desyfin S.A.", "Gente S.A.", "Mutual Alajuela", "Mutual Cartago", "COOPEANDE R.L.", "COOCIQUE R.L.", "COOEPALIANZA R.L.", "CREDECOOP R.L.", "COOPENAE R.L.", "COOPE SAN MARCOS R.L.", "COOPESERVIDORES R.L.", "Casa de cambio Exchange", "Teledolar S.A.", "BCT Valores S.A.", "BN Valores S.A.", "Mercado de valores ", "PB Inversiones", "Popular Valores"]
 //              Se llama al url y se llena la matriz con los datos del html
    func arraysData() {
        var table = [[String]]()
        do {
             let url = URL(string: "https://gee.bccr.fi.cr/IndicadoresEconomicos/Cuadros/frmConsultaTCVentanilla.aspx")
             let html = try String(contentsOf: url!, encoding: .utf8)
             let info: Document = try SwiftSoup.parse(html)
             for row in try info.select("table[id=\"Table2\"] table[id=\"DG\"] tr") {
                 var rowContent = [String]()

                 for col in try row.select("td") {
                     let colContent = try! col.text()
                     rowContent.append(colContent)
                 }
                 table.append(rowContent)
             }
            let floatFormatter = FloatFormatter()
            //Se llenan los vectores de las columnas para generar los datos facilmente
             for i in 1...table.count-2 {
                 for j in 0...table[0].count-1 {
                     if j == 0 {
                         tipoEntidad.append(table[i][j])
                     } else if j == 1 {
                         banco.append(bancosDiminutivo[i])
                     } else if j == 2 {
                         precioCompra.append(floatFormatter.float(from: table[i][j])!)
                     } else if j == 3 {
                         precioVenta.append(floatFormatter.float(from: table[i][j])!)
                     } else if j == 4 {
                         precioDif.append(floatFormatter.float(from: table[i][j])!)
                     } else if j == 5 {
                         actualizacion.append(table[i][j])
                     }
                 }
             }
         } catch Exception.Error(type: let type, Message: let message) {
             print(type)
             print(message)
         } catch {
             print("")
       }
        print(precioVenta)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banco.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "banco", for: indexPath) as! generalTableViewCell
        cell.nombreBanco.text = banco[indexPath.row]
        cell.precioCompra.text = String(precioCompra[indexPath.row])
        cell.precioVenta.text = String(precioVenta[indexPath.row])
        //print("a")
        return cell
        
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let vc = storyboard?.instantiateViewController(identifier:  "calculadora") as! CalculadoraViewController
//        vc.prVenta.text = precioVenta[indexPath.row]
        
        present(vc, animated: true)
            
    }
    func mejores() {
        mejorCompra.text = String(precioCompra.max()!)
        mejorVenta.text = String(precioVenta.min()!)
        let indexMejorCompra = precioCompra.firstIndex(of: precioCompra.max()!)
        let indexMejorVenta = precioVenta.firstIndex(of: precioVenta.min()!)
        mejorVentaBanco.text = banco[indexMejorVenta!]
        mejorCompraBanco.text = banco[indexMejorCompra!]
    }
    
   
    
    // MARK: classes extra
    class FloatFormatter {
        let formatter: NumberFormatter
        init() {
            formatter = NumberFormatter()
            formatter.decimalSeparator = ","
        }

        func float(from string: String) -> Float? {
            formatter.number(from: string)?.floatValue
        }
    }
}
