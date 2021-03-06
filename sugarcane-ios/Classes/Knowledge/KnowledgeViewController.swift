//
//  KnowledgeViewController.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/30/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

class KnowledgeViewController: UIViewController {
    
    @IBOutlet weak var collectionVIEW: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackgroundWhite()
        collectionVIEW.setBackgroundCollectionWhite()
        navigationController?.setTitleKnowledgeNavi()
        navigationController?.setColorKnowledgeNavi()
        collectionVIEW.registerKnowledgeCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

// MARK: - Collection View DelegateFlow Layout
extension KnowledgeViewController: UICollectionViewDelegateFlowLayout {
    
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

extension KnowledgeViewController : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KnowledgeCollectionCell", for: indexPath) as! KnowledgeCollectionCell
        
        return cell
    }
    
    
}

extension KnowledgeViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "KnowledgeDetailViewController", sender: nil)
    }
}
