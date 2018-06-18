//
//  ManoDoCell.swift
//  sGs
//
//  Created by Fernando F Duarte on 18/06/18.
//  Copyright © 2018 Fernando F Duarte. All rights reserved.
//

import Foundation
import UIKit

class ManoDoCell: UITableViewCell {
    
    @IBOutlet weak var lblNome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblNome.textColor = UIColor .black
        lblNome.textAlignment = .left
    }
    
    func configuraMano(nome: String) {
        lblNome.text = nome
    }
}
