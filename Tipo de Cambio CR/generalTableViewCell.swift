//
//  generalTableViewCell.swift
//  Tipo de Cambio CR
//
//  Created by Allan Guzman on 5/22/20.
//  Copyright © 2020 Allan Guzman. All rights reserved.
//

import UIKit

class generalTableViewCell: UITableViewCell {

    
    @IBOutlet weak var precioCompra: UILabel!
    @IBOutlet weak var precioVenta: UILabel!
    @IBOutlet weak var nombreBanco: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
