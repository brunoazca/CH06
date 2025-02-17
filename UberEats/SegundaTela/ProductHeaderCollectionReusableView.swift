//
//  ProductHeaderCollectionReusableView.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 17/02/25.
//

import UIKit

class ProductHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(title: String){
        self.title.text = title
    }
}
