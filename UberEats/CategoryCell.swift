//
//  CategoryCell.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 12/02/25.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.text = "Mercado"
        image.image = UIImage()
    }
    
    func setUp(nomeCategoria: String){
        label.text = nomeCategoria
        image.image = UIImage(named: "Épou")
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true

    }

}
