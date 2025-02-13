//
//  HorizontalStoreTableViewCell.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 12/02/25.
//

import UIKit

class HorizontalStoreTableViewCell: UITableViewCell {
    @IBOutlet weak var nomeRestaurante: UILabel!
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = "Banana"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(loja: Loja){
        nomeRestaurante.text = loja.nome
        label.text = "\(Int.random(in: 5...50)) min"
        storeImage.image = UIImage(named: loja.nome)
        storeImage.layer.cornerRadius = storeImage.frame.size.width / 2
        storeImage.clipsToBounds = true
    }
}
