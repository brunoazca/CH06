//
//  CategoryCollectionViewController.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 12/02/25.
//

import Foundation
import UIKit


class CategoryCollectionViewController: UIViewController, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
}

extension CategoryCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Loja.Tipo.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath)
        
        guard let categoryCell = cell as? CategoryCell else {
            return cell
        }

        categoryCell.setUp(nomeCategoria: Loja.Tipo.allCases[indexPath.row].rawValue)
        
        return categoryCell
    }
    
}
