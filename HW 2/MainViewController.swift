//
//  MainViewController.swift
//  HW 2
//
//  Created by Роман Захаров on 06.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! ColorViewController
        colorVC.delegate = self
        colorVC.currentColor = view.backgroundColor
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }
    
}

extension MainViewController: ColorViewControllerDelegate {
    func setColor(as color: UIColor) {
        view.backgroundColor = color
    }
}
