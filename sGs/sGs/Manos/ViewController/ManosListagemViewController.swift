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
    
    let manos: [String] = ["Joao", "Zé", "Gabriel", "Sapo", "Shinir", "Bacteria", "Tiguera"]
    
    override func viewDidLoad() {
        tbvManos.delegate = self
        tbvManos.dataSource = self
        
        tbvManos.tableFooterView = viewFooter
    }

}

extension ManosListagemViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ManoDoCell = tableView.dequeueReusableCell(withIdentifier: "Mano") as! ManoDoCell
        cell.configuraMano(nome: manos[indexPath.row])
        return cell
    }
}

extension ManosListagemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue_mano_add", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
