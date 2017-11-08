//
//  QuestionViewController.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/31/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit
import XMSegmentedControl

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl1: XMSegmentedControl!
    @IBOutlet weak var tableVIEW: UITableView!
    
    var indexOfSegment = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setTitleQuestionNavi()
        segmentedControl1.delegate = self
        setupSegment()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "สอบถามและปรึกษา"
        navigationItem.backBarButtonItem = backItem
    }
    
    func setupSegment() -> Void {
        segmentedControl1.segmentTitle = ["คำถามของฉัน", "ติดต่อเรา"]
        segmentedControl1.selectedItemHighlightStyle = XMSelectedItemHighlightStyle.Background
        segmentedControl1.backgroundColor = UIColor.white
        segmentedControl1.highlightColor = UIColor(red:0.16, green:0.54, blue:0.80, alpha:1.0)
        segmentedControl1.tint = UIColor.lightGray
        segmentedControl1.highlightTint = UIColor.white
    }
    
    func setupTableView() -> Void {
        tableVIEW.registerQuestionTableViewCell()
        tableVIEW.registerHotilneTableViewCell()
        tableVIEW.registerAddressTableViewCell()
        tableVIEW.registerEmailTableViewCell()
        tableVIEW.tableFooterView = UIView(frame: .zero)
        tableVIEW.backgroundColor = UIColor(red:0.84, green:0.93, blue:0.96, alpha:1.0)
        tableVIEW.contentInset.top = 5
        tableVIEW.setHeightCellAutomatic(estimatedRowHeight: 100)
    }
}

extension QuestionViewController: XMSegmentedControlDelegate {
    
    func xmSegmentedControl(xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        if xmSegmentedControl == segmentedControl1 {
            indexOfSegment = selectedSegment
            tableVIEW.reloadData()
            
            if indexOfSegment == 1 {
                tableVIEW.separatorColor = UIColor.lightGray
                tableVIEW.allowsSelection = false
            }else {
                tableVIEW.separatorColor = UIColor.clear
                tableVIEW.allowsSelection = true

            }
        }
    }
}

extension QuestionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 5))
        view.backgroundColor = UIColor(red:0.84, green:0.93, blue:0.96, alpha:1.0)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexOfSegment == 0 {
            return 100
        }else {
            
            if indexPath.section == 0 {
                return 150
            }else if indexPath.section == 1 {
                return 150
            }else {
                return 80
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if indexOfSegment == 0 {
            return 5
        }else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if indexOfSegment == 0 {
            return 5
        }else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexOfSegment == 0 {
            let cell = tableVIEW.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as! QuestionTableViewCell
            return cell
        }else {
            
            if indexPath.section == 0 {
                let cell = tableVIEW.dequeueReusableCell(withIdentifier: "HotilneTableViewCell", for: indexPath) as! HotilneTableViewCell
                cell.delegate = self
                return cell
            }else if indexPath.section == 1 {
                let cell = tableVIEW.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
                return cell
            }else {
                let cell = tableVIEW.dequeueReusableCell(withIdentifier: "EmailTableViewCell", for: indexPath) as! EmailTableViewCell
                return cell
            }
        }
    }  
}

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.white
        
        if indexOfSegment == 0 {
            performSegue(withIdentifier: "QuestionDetailView", sender: nil)
        }
    }
}

extension QuestionViewController: didSendCallDelegate {
    func sendPhone(phone: String) {
        if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
