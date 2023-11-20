//
//  ViewController.swift
//  menuBarwithCollectionview
//
//  Created by Talib on 23/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMenuBar()
    }
    
    let menubar:MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
        
    }()

    func setupMenuBar(){
        view.addSubview(menubar)
        NSLayoutConstraint.activate([
        
            menubar.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            menubar.trailingAnchor.constraint(equalTo:view.trailingAnchor),
            menubar.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            menubar.heightAnchor.constraint(equalToConstant:50)
            
        
        
        ])
        
    }
}





