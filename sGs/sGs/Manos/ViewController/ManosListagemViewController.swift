//
//  ManosListagemViewController.swift
//  sGs
//
//  Created by Fernando F Duarte on 18/06/18.
//  Copyright © 2018 Fernando F Duarte. All rights reserved.
//

import UIKit

class ManosListagemViewController: UIViewController {
    
    @IBOutlet weak var tbvManos: UITableView!
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var btnAdd: UIButton!
    
    var manos: Array<Mano>!
    let bd = BDSQLite()
    var manoSegue: Mano! = nil
    
    override func viewDidLoad() {
        setLayout()
    }
    
    func setLayout() {
        
        if bd.criaTabelaMano() {
                manos = bd.selecionaManos()
                tbvManos.reloadData()
        }
        
        tbvManos.delegate = self
        tbvManos.dataSource = self
        tbvManos.tableFooterView = viewFooter
        
        btnAdd.setTitle("Adicionar", for: .normal)
    }
    
    @IBAction func adicionarMano(){
        performSegue(withIdentifier: "segue_mano_add", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let manoHAHA: ManosViewController = segue.destination as! ManosViewController
        
        manos = bd.selecionaManos()
        tbvManos.reloadData()
        
        if manoSegue != nil {
            manoHAHA.manoSegue = manoSegue
        }
    }

}

extension ManosListagemViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(manos != nil) {
            return manos.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ManoDoCell = tableView.dequeueReusableCell(withIdentifier: "Mano") as! ManoDoCell
        let maninho: Mano = manos[indexPath.row]
        cell.configuraMano(nome: maninho.nome)
        
        return cell
    }
}

extension ManosListagemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        manoSegue = manos[indexPath.row]
        performSegue(withIdentifier: "segue_mano_add", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
