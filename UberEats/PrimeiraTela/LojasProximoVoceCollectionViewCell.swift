//
//  LojasProximoVoceCollectionViewCell.swift
//  UberEats
//
//  Created by clara tapparo on 12/02/25.
//

import UIKit

class LojasProximoVoceCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(nomeCategoria: String){
        label.text = nomeCategoria
        image.image = UIImage(named: "Épou")
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true

    }
}
