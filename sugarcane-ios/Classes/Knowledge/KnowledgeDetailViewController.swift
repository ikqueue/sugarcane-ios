//
//  KnowledgeDetailViewController.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/31/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit
import StretchHeader

class KnowledgeDetailViewController: UIViewController {
    
    @IBOutlet weak var tableVIEW: UITableView!
    
    var header : StretchHeader!
    var navigationView = UIView()
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
        tableVIEW.registerKnowledgeDetailCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setupHeaderView() -> Void {
        
        tableVIEW.separatorColor = UIColor.clear
        tableVIEW.backgroundColor = UIColor.white
        tableVIEW.setHeightCellAutomatic(estimatedRowHeight: 90)
        tableVIEW.tableFooterView = UIView(frame: .zero)
        tableVIEW.allowsSelection = false

        button.frame = CGRect(x: 7, y: 25, width: 30, height: 30)
        button.setImage(UIImage(named: "left-nav-gray")?.withRenderingMode(.alwaysTemplate), for: UIControlState())
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(KnowledgeDetailViewController.leftButtonAction(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        let options = StretchHeaderOptions()
        options.position = .fullScreenTop
        let width = self.view.bounds.width
        let height = CGFloat(280)
        header = StretchHeader()
        header.stretchHeaderSize(headerSize: CGSize(width: width, height: height), imageSize: CGSize(width: width, height: height), controller: self, options: options)
        header.imageView.image = UIImage()
        tableVIEW.tableHeaderView = header
        
        // MARK: - Auto Layout Close button
        button.translatesAutoresizingMaskIntoConstraints = false
        let widthConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        let heightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        let xConstraint = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 20)
        let yConstraint = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([widthConstraint, heightConstraint, xConstraint, yConstraint])
    }
    
    @objc func leftButtonAction(_ sender: AnyObject?) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

extension KnowledgeDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        header.updateScrollViewOffset(scrollView)
    }
}

extension KnowledgeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVIEW.dequeueReusableCell(withIdentifier: "KnowledgeDetailTableViewCell", for: indexPath) as! KnowledgeDetailTableViewCell
        
        return cell
    }
    
    
}
