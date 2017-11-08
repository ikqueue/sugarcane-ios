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
        setUpSearchBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    func setUpSearchBar() -> Void {
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = UISearchBarStyle.prominent
            controller.searchBar.sizeToFit()
            controller.searchBar.placeholder = ""
            controller.searchBar.tintColor = UIColor.white
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
            
            if #available(iOS 11.0, *) {
                controller.searchBar.barTintColor = UIColor.white
                if let textfield = controller.searchBar.value(forKey: "searchField") as? UITextField {
                    textfield.textColor = UIColor.blue
                    if let backgroundview = textfield.subviews.first {
                        
                        backgroundview.backgroundColor = UIColor.lightGray
                        backgroundview.layer.cornerRadius = 10;
                        backgroundview.clipsToBounds = true;
                    }
                }
                
                if let navigationbar = self.navigationController?.navigationBar {
                    navigationbar.barTintColor = UIColor.header()
                }
                
                navigationItem.title = "ค้นหา"
                navigationItem.searchController = controller
                navigationItem.hidesSearchBarWhenScrolling = false
            } else {
                controller.searchBar.barTintColor = UIColor.white
                navigationItem.titleView = controller.searchBar
            }
            
            return controller
            
        })()
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
