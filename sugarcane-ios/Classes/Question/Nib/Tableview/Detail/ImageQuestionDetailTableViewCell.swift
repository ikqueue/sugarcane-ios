//
//  ImageQuestionDetailTableViewCell.swift
//  sugarcane-ios
//
//  Created by Riseplus on 11/1/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

class ImageQuestionDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionVIEW: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionVIEW.dataSource = self
        collectionVIEW.delegate = self
        collectionVIEW.setBackgroundCollectionWhite()
        collectionVIEW.registerImageQuestionDetailCollectionViewCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension ImageQuestionDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.sizeImageCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectionView.ImageUIEdgeInsetsCell()
    }
}
extension ImageQuestionDetailTableViewCell: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageQuestionDetailCollectionViewCell", for: indexPath) as! ImageQuestionDetailCollectionViewCell
        
        return cell
    }
    
    
}
extension ImageQuestionDetailTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
