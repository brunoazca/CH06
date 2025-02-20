//
//  CartCollectionViewCell.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 19/02/25.
//
import UIKit

class CartCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var excludeButton: UIButton!
    var id: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(produto: Produto, enableEdition: Bool) {
        self.id = produto.ID
        valueLabel.text = "R$\(produto.preco)"
        descriptionLabel.text = produto.descricao
        productImage.image = UIImage(named: produto.imageName) // Defina a imagem adequada
        productImage.layer.cornerRadius = productImage.frame.size.width / 2
        productImage.clipsToBounds = true
        if(!enableEdition){
            excludeButton.isHidden = true
        }
    }

    @IBAction func onEcludeButtonTouch(_ sender: UIButton) {
        // Encontrar o índice do produto no carrinho usando o nome
        if let carrinho = AppLibrary.instance.user?.carrinho {
            if let index = carrinho.produtos.firstIndex(where: { $0.ID == id }) {
                // Remover o produto do carrinho
                carrinho.produtos.remove(at: index)
                
                // Remover a célula da UICollectionView
                if let collectionView = self.superview as? UICollectionView {
                    collectionView.deleteItems(at: [IndexPath(row: IndexPath.Element(index), section: 0)])
                }
            }
        }
    }
}
