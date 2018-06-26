//
//  ManosViewController.swift
//  sGs
//
//  Created by Fernando F Duarte on 18/06/18.
//  Copyright © 2018 Fernando F Duarte. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ManosViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEsporte: UITextField!
    @IBOutlet weak var txtCidade: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var sliderNota: UISlider!
    @IBOutlet weak var btnSalvar: UIButton!
    
    var bd: BDSQLite! = nil
    var manoSegue: Mano! = nil
    
    override func viewDidLoad() {
        //Text Field
        txtNome.placeholder = "Nome"
        txtEsporte.placeholder = "Esporte"
        txtCidade.placeholder = "Cidade"
        txtEmail.placeholder = "Email"
        
        if(manoSegue != nil) {
            txtNome.text = manoSegue.nome
            txtEsporte.text = manoSegue.esporte
            txtCidade.text = manoSegue.cidade
            txtEmail.text = manoSegue.email
        }
        
        txtEmail.delegate = self
        
        //Botao
        btnSalvar.setTitle("Salvar", for: .normal)
                
    }    
    
    @IBAction func salvarMano(){
        let man: Mano = Mano()
        man.nome = txtNome.text!
        man.esporte = txtEsporte.text!
        man.cidade = txtCidade.text!
        man.email = txtEmail.text!
        man.nota = sliderNota.value
        
        let dictionary = ["nome": man.nome,"esporte":man.esporte,"cidade":man.cidade,"email":man.email,"nota":man.nota] as [String : Any]
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("sGs").child("manos").childByAutoId().setValue(dictionary)
        
        
        bd.insereMano(mano: man)
        
        dismiss(animated: true, completion: nil)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension ManosViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
