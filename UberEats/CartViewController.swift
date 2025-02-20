//
//  CartViewController.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 19/02/25.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var cartCollectionView: UICollectionView!
    @IBOutlet weak var storeImage: UIImageView!

    
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    var enableEdition: Bool = true
    var cartCollectionViewVC = CartCollectionViewController(enableEdition: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(!enableEdition){
            cartCollectionViewVC = CartCollectionViewController(enableEdition: false)
        }
        if let carrinho = AppLibrary.instance.user?.carrinho {
            storeName.text = carrinho.loja.nome
            storeImage.image = UIImage(named: carrinho.loja.nome)
            timeLabel.text = "\(Int.random(in: 12...60)) min"
            let productXib = UINib(nibName: "CartCollectionViewCell", bundle: nil)
            cartCollectionView.register(productXib, forCellWithReuseIdentifier: "CartCollectionViewCell")
            cartCollectionView.dataSource = cartCollectionViewVC
            cartCollectionView.delegate = cartCollectionViewVC
            
            if let flowLayout = cartCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                flowLayout.minimumLineSpacing = 40 // Espaçamento vertical entre os itens
                flowLayout.minimumInteritemSpacing = 50 // Espaçamento horizontal entre os itens
                flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 85, right: 0) // Margem na parte inferior
            }
        }
        if(!enableEdition){
            buyButton.isHidden = true
            cleanButton.isHidden = true
        }
    }
    
    @IBAction func onCleanButtonTouch(_ sender: Any) {
        AppLibrary.instance.user?.carrinho?.produtos.removeAll()
        cartCollectionView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onPurchaseButtonTouch(_ sender: Any) {
        performSegue(withIdentifier: "deliver", sender: self)
        if let navigationController = self.navigationController {
                var viewControllers = navigationController.viewControllers
                if viewControllers.count > 1 {
                    viewControllers.remove(at: viewControllers.count - 2) // Remove a tela anterior
                    navigationController.viewControllers = viewControllers // Atualiza a pilha
                }
            }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    // Define o tamanho da célula (Item)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200) // Largura total sem margem à esquerda, altura 170
    }
}
