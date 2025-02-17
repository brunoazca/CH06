//
//  ProdutoCategoriaNomeTableViewCell.swift
//  UberEats
//
//  Created by clara tapparo on 12/02/25.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(produto: Produto){
        valueLabel.text = "R$\(produto.preco)"
        descriptionLabel.text = produto.descricao
        productImage.image = UIImage(named: "Assaí Atacadista")
        productImage.layer.cornerRadius = productImage.frame.size.width / 2
        productImage.clipsToBounds = true
    }
    
}
