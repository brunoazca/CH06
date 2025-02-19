//
//  ViewController.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 05/02/25.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var storeTableView: UITableView!
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    let categoryCollectionVC = CategoryCollectionViewController()
   
    @IBOutlet weak var nearStoresCollection: UICollectionView!
    let nearStoresCollectionVC = NearStoresCollectionViewController()

    
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    var selectedStore: Loja? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let endereco = AppLibrary.instance.user?.enderecos.first
        addressButton.setTitle(endereco ?? "Selecione seu endereço", for: .normal)
        
        categoryCollection.delegate = categoryCollectionVC
        categoryCollection.dataSource = categoryCollectionVC
        let categoryXib = UINib(nibName: "CategoryCell", bundle: nil)
        categoryCollection.register(categoryXib, forCellWithReuseIdentifier: "CategoryCell")
        categoryCollection.isScrollEnabled = false
        
        let nearStoresXib = UINib(nibName: "LojasProximoVoceCollectionViewCell", bundle: nil)
        nearStoresCollection.delegate = self
        nearStoresCollection.dataSource = nearStoresCollectionVC
        nearStoresCollection.register(nearStoresXib, forCellWithReuseIdentifier: "LojasProximoVoceCollectionViewCell")
        
        storeTableView.delegate = self
        storeTableView.dataSource = self
        storeTableView.isScrollEnabled = false
        let horizontalStoreXib = UINib(nibName: "HorizontalStoreTableViewCell", bundle: nil)
        storeTableView.register(horizontalStoreXib, forCellReuseIdentifier: "id")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var selectedIndexPath: Int? = nil
        
        if let indexPathsForSelectedItems = nearStoresCollection.indexPathsForSelectedItems {
            if !indexPathsForSelectedItems.isEmpty {
                if let index = nearStoresCollection.indexPathsForSelectedItems?[0].row {
                    selectedIndexPath = index
                }
            }
        }
        
        if let index = storeTableView.indexPathForSelectedRow?.row{
            selectedIndexPath = index
        }
        if let selectedIndexPath{
            // Se o destino for o destino que estamos esperando...
            if let destination = segue.destination as? StoreViewController {
                destination.setUp(loja: AppLibrary.instance.lojas[selectedIndexPath])
            } else {
                print("Destino desconhecido para o segue \(segue.identifier ?? "?")!")
            }
        }
        
    }
    
    @IBAction func onAddressButtonTouch(_ sender: Any) {
        print("botao endereco clicado")
    }
    
    @IBAction func onSearchFieldEditChanged(_ sender: Any) {
        print("Edição mudou")
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedStore = AppLibrary.instance.lojas[indexPath.row]
        performSegue(withIdentifier: "store", sender: self)
    }
}

extension MainViewController: UICollectionViewDataSource {
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

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppLibrary.instance.lojas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storeTableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! HorizontalStoreTableViewCell
        
        cell.setUp(loja: AppLibrary.instance.lojas[indexPath.row])
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "store", sender: self)
    }
}
