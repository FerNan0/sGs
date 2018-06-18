//
//  ViewController.swift
//  sGs
//
//  Created by Fernando F Duarte on 24/04/18.
//  Copyright © 2018 Fernando F Duarte. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    @IBOutlet weak var labelPrimeira: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor .black
        //labelPrimeira.text = "eaeeee!"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

