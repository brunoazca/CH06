//
//  ViewController.swift
//  AulaRicViewCode
//
//  Created by Bruno Azambuja Carvalho on 10/02/25.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .magenta
        let label: MyUILabel = MyUILabel("Hello")
        label.addToView(self.view)

        let label2: UILabel = UILabel()
        
        label2.text = "Coe"
        label2.textColor = .black
        label2.font = .systemFont(ofSize: 20)
        self.view.addSubview(label2)
        
        let margins = view.layoutMarginsGuide

        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        label2.centerYAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        
    }


}

#Preview{
    ViewController()
}
