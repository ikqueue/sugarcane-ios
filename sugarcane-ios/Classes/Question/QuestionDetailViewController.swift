//
//  QuestionDetailViewController.swift
//  sugarcane-ios
//
//  Created by Riseplus on 11/1/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit
import GrowingTextView
import IQKeyboardManagerSwift

class QuestionDetailViewController: UIViewController {

    @IBOutlet weak var tableVIEW: UITableView!
    @IBOutlet weak var messageTextView: GrowingTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTextView.delegate = self
        setupTableView()
        setupTextView()

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
    
    func setupTableView() -> Void {
        tableVIEW.registerHeadQuestionDetailTableViewCell()
        tableVIEW.registerDescriptionQuestionDetailTableViewCell()
        tableVIEW.registerImageQuestionDetailTableViewCell()
        tableVIEW.allowsSelection = false
        tableVIEW.tableFooterView = UIView(frame: .zero)
        tableVIEW.separatorColor = UIColor.clear
        tableVIEW.backgroundColor = UIColor(red:0.84, green:0.93, blue:0.96, alpha:1.0)
        tableVIEW.contentInset.top = 5
        tableVIEW.setHeightCellAutomatic(estimatedRowHeight: 90)
    }
    
    func setupTextView() -> Void {
        messageTextView.maxLength = 1000
        messageTextView.trimWhiteSpaceWhenEndEditing = false
        messageTextView.placeHolder = "ส่งคำตอบ"
        messageTextView.placeHolderColor = UIColor(white: 0.8, alpha: 1.0)
        messageTextView.minHeight = 25.0
        messageTextView.maxHeight = 150.0
        messageTextView.backgroundColor = UIColor.white
        messageTextView.layer.cornerRadius = 4.0
        automaticallyAdjustsScrollViewInsets = false
    }

}
extension QuestionDetailViewController: GrowingTextViewDelegate {
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        UIView.animate(withDuration: 0) {
            self.view.layoutIfNeeded()
        }
    }
    func textViewDidChange(_ textView: UITextView) {

    }
    func textViewDidEndEditing(_ textView: UITextView) {

    }

}

extension QuestionDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 90
        }else if indexPath.section == 1 {
            return 108
        }else {
            return 110
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableVIEW.dequeueReusableCell(withIdentifier: "HeadQuestionDetailTableViewCell", for: indexPath) as! HeadQuestionDetailTableViewCell
            return cell
        }else if indexPath.section == 1 {
            let cell = tableVIEW.dequeueReusableCell(withIdentifier: "DescriptionQuestionDetailTableViewCell", for: indexPath) as! DescriptionQuestionDetailTableViewCell
            return cell
        }else {
            let cell = tableVIEW.dequeueReusableCell(withIdentifier: "ImageQuestionDetailTableViewCell", for: indexPath) as! ImageQuestionDetailTableViewCell
            return cell
        }
    }
    
    
}
