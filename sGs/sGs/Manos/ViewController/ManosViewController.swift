//
//  ManosViewController.swift
//  sGs
//
//  Created by Fernando F Duarte on 18/06/18.
//  Copyright © 2018 Fernando F Duarte. All rights reserved.
//

import Foundation
import UIKit
import SQLite3

class ManosViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEsporte: UITextField!
    @IBOutlet weak var txtCidade: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var sliderNota: UISlider!
    @IBOutlet weak var btnSalvar: UIButton!
    
    override func viewDidLoad() {
        //Text Field
        txtNome.placeholder = "Nome"
        txtEsporte.placeholder = "Esporte"
        txtCidade.placeholder = "Cidade"
        txtEmail.placeholder = "Email"
        
        //Botao
        btnSalvar.setTitle("Salvar", for: .normal)
                
    }
    
    @IBAction func salvarMano(){
        dismiss(animated: true, completion: nil)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
