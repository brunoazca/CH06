//
//  MyUILabel.swift
//  AulaRicViewCode
//
//  Created by Bruno Azambuja Carvalho on 10/02/25.
//

import UIKit

class MyUILabel: UILabel {

    init(_ text: String){
        super.init(frame: .zero)
        self.text = text
        self.textColor = .black
        self.font = .systemFont(ofSize: 50)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func addToView(_ view: UIView){
        let margins = view.layoutMarginsGuide
        
        view.addSubview(self)
        self.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        
        let centerYConstraint = self.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: -40)
        centerYConstraint.priority = .defaultLow
        centerYConstraint.isActive = true
    }
    
}
