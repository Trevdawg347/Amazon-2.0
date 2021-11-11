//
//  ViewController.swift
//  Amazon 2.0
//
//  Created by Wendy Buhler on 11/9/21.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 2, height: UIScreen.main.bounds.width / 3 - 2)
        collectionView.collectionViewLayout = layout
        collectionView.register(PostView.nib(), forCellWithReuseIdentifier: PostView.identifier)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), primaryAction: UIAction() { [weak self] _ in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "cart")
            vc.hidesBottomBarWhenPushed = true
            self?.navigationController?.pushViewController(vc, animated: true)
        })
    }

}

extension ShopViewController: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostView.identifier, for: indexPath) as! PostView
        cell.setup(title: indexPath.item.isMultiple(of: 3))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
