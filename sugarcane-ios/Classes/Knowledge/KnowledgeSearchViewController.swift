//
//  KnowledgeSearchViewController.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/31/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

class KnowledgeSearchViewController: UIViewController {
    
    @IBOutlet weak var collectionVIEW: UICollectionView!
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackgroundWhite()
        collectionVIEW.setBackgroundCollectionWhite()
        collectionVIEW.registerKnowledgeSearchCell()
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = UISearchBarStyle.prominent
            controller.searchBar.sizeToFit()
            controller.searchBar.tintColor = UIColor.white
            controller.searchBar.barTintColor = UIColor(red:0.16, green:0.54, blue:0.80, alpha:1.0)
            
            self.navigationItem.titleView = controller.searchBar
//            self.navigationItem.searchController = controller
//            self.navigationItem.hidesSearchBarWhenScrolling = false
            return controller
            
        })()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

}

// MARK: - UISearchController
extension KnowledgeSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension KnowledgeSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionVIEW.sizeCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectionVIEW.UIEdgeInsetsCell()
    }
}

extension KnowledgeSearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KnowledgeSearchCollectionViewCell", for: indexPath) as! KnowledgeSearchCollectionViewCell
        
        return cell
    }
    
    
}

extension KnowledgeSearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "KnowledgeDetailViewController", sender: nil)
    }
}
