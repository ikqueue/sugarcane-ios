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
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageTextView: GrowingTextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    @IBAction func didSendMessage(_ sender: Any) {
        messageTextView.text = ""
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupView()
        setupTextView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.addObserverNotificationCenter()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.removeObserverNotificationCenter()
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
    
    func setupView() {
        messageView.layer.borderWidth = 0.5
        messageView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setupTextView() -> Void {
        messageTextView.maxLength = 1000
        messageTextView.trimWhiteSpaceWhenEndEditing = false
        messageTextView.placeHolder = "ส่งคำตอบ"
        messageTextView.placeHolderColor = UIColor(white: 0.8, alpha: 1.0)
        messageTextView.minHeight = 25.0
        messageTextView.maxHeight = 150.0
        messageTextView.backgroundColor = UIColor.clear
        messageTextView.layer.cornerRadius = 8.0
        messageTextView.layer.borderWidth = 1.0
        messageTextView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func addObserverNotificationCenter() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(QuestionDetailViewController.keyboardWillShow(_:)),
            name: NSNotification.Name.UIKeyboardWillShow,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(QuestionDetailViewController.keyboardWillHide(_:)),
            name: NSNotification.Name.UIKeyboardWillHide,
            object: nil)
    }
    
    func removeObserverNotificationCenter() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                bottomConstraint?.constant = keyboardSize.height
                
                UIView.animate(withDuration: 0, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification){
        bottomConstraint.constant = 0.0
    }

}
extension QuestionDetailViewController: GrowingTextViewDelegate {
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        heightViewConstraint.constant = height
        UIView.animate(withDuration: 0) {
            self.view.layoutIfNeeded()
        }
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
