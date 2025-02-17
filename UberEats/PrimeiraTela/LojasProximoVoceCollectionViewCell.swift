//
//  LojasProximoVoceCollectionViewCell.swift
//  UberEats
//
//  Created by clara tapparo on 12/02/25.
//

import UIKit

class LojasProximoVoceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var storeImage: UIImageView!
    
    @IBOutlet weak var nomeRestaurante: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(loja: Loja){
        nomeRestaurante.text = loja.nome
        timeLabel.text = "\(Int.random(in: 5...50)) min"
        storeImage.image = UIImage(named: loja.nome)
        storeImage.layer.cornerRadius = storeImage.frame.size.width / 2
        storeImage.clipsToBounds = true
    }
}
