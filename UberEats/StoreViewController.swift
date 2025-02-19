import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var storePlace: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    @IBOutlet weak var cartItensLabel: UILabel!
    @IBOutlet weak var cartPriceLabel: UILabel!
    @IBOutlet weak var storeCartImage: UIImageView!
    @IBOutlet weak var productSelectedView: UIView!
    @IBOutlet weak var cartButton: UIButton!
   
    @IBAction func onCartButtonTouch(_ sender: UIButton) {
    }
    
    var categorias: [Produto.Categoria] = []
    var loja: Loja = Loja(nome: "a", tipo: .alcool, local: "aa", horario: HorarioFuncionamento(inicio: 1, final: 1), produtos: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productSelectedView.isHidden = true
        storeName.text = loja.nome
        storePlace.text = loja.local
        timeLabel.text = "\(Int.random(in: 5...50)) min"
        storeImage.image = UIImage(named: loja.nome)
        storeImage.clipsToBounds = true
        categorias = loja.getProductCategories()
        
        // Definindo delegate e dataSource para a collection view
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
        // Registrando os nibs
        let productXib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        let headerXib = UINib(nibName: "ProductHeaderCollectionReusableView", bundle: nil)
        productsCollectionView.register(productXib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        productsCollectionView.register(headerXib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProductHeaderCollectionReusableView")
        
        // Configurando o layout da collection view para scroll horizontal usando Compositional Layout
        let layout = createCompositionalLayout()
        layout.configuration.interSectionSpacing = 15
        productsCollectionView.setCollectionViewLayout(layout, animated: false)
        
        if let carrinho = AppLibrary.instance.user?.carrinho {
            storeCartImage.image = UIImage(named: carrinho.loja.nome)
            cartPriceLabel.text = "R$ \(String(format: "%.2f", carrinho.valor ?? 0))"
            cartItensLabel.text = "\(carrinho.produtos.count ?? 0) itens"
            productSelectedView.isHidden = false
        }
        
    }

    func setUp(loja: Loja){
        self.loja = loja
    }

    // Função para criar o Compositional Layout
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        // Definindo o layout das seções
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(170))  // Itens com largura 30% da seção
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10) // Espaço entre os itens
        
        // Configurando o grupo para os itens horizontais
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(170))  // O grupo ocupa toda a largura da seção
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Configurando a seção com o grupo
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous // Faz a seção rolar horizontalmente
        
        // Definindo o tamanho do cabeçalho da seção
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)),
                                                       elementKind: UICollectionView.elementKindSectionHeader,
                                                       alignment: .top)
        ]
        
        // Retorna o layout composto
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
extension StoreViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let produto = loja.getProductsFromCategory(categorias[indexPath.section])[indexPath.row]
        
        if let carrinho = AppLibrary.instance.user?.carrinho {
            if (carrinho.loja != loja) {
                AppLibrary.instance.user?.carrinho = Compra(
                    loja: loja,
                    produtos: [produto],
                    endereco: AppLibrary.instance.user?.enderecos.first ?? "address",
                    horarioPedido: 0,
                    horarioChegada: 0,
                    status: .aguardandoPagamento
                )
            } else {
                carrinho.produtos.append(produto)
            }
        } else {
            AppLibrary.instance.user?.carrinho = Compra(
                loja: loja,
                produtos: [produto],
                endereco: AppLibrary.instance.user?.enderecos.first ?? "address",
                horarioPedido: 0,
                horarioChegada: 0,
                status: .aguardandoPagamento
            )
        }
        storeCartImage.image = UIImage(named: loja.nome)
        cartPriceLabel.text = "R$ \(String(format: "%.2f", AppLibrary.instance.user?.carrinho?.valor ?? 0))"
        cartItensLabel.text = "\(AppLibrary.instance.user?.carrinho?.produtos.count ?? 0) itens"
        productSelectedView.isHidden = false
    }
}



extension StoreViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categorias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loja.getProductsFromCategory(categorias[section]).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath)
        
        guard let productCell = cell as? ProductCollectionViewCell else {
            return cell
        }
        
        var productList = loja.getProductsFromCategory(categorias[indexPath.section])
        
        productCell.setUp(produto: productList[indexPath.row])
        return productCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProductHeaderCollectionReusableView", for: indexPath) as! ProductHeaderCollectionReusableView
            
            header.setUp(title: categorias[indexPath.section].rawValue)
            
            return header
        }
        return UICollectionReusableView()
    }
}
