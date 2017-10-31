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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setTitleQuestionNavi()
        segmentedControl1.delegate = self
        setupSegment()
        tableVIEW.registerQuestionTableViewCell()
        tableVIEW.separatorColor = UIColor.clear
        tableVIEW.tableFooterView = UIView(frame: .zero)
        tableVIEW.backgroundColor = UIColor(red:0.84, green:0.93, blue:0.96, alpha:1.0)
        tableVIEW.contentInset = UIEdgeInsets(top: 10,left: 0,bottom: 0,right: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupSegment() -> Void {
        segmentedControl1.segmentTitle = ["คำถามของฉัน", "ติดต่อเรา"]
        segmentedControl1.selectedItemHighlightStyle = XMSelectedItemHighlightStyle.Background
        segmentedControl1.backgroundColor = UIColor.white
        segmentedControl1.highlightColor = UIColor(red:0.16, green:0.54, blue:0.80, alpha:1.0)
        segmentedControl1.tint = UIColor.lightGray
        segmentedControl1.highlightTint = UIColor.white
    }
    
}

extension QuestionViewController: XMSegmentedControlDelegate {
    
    func xmSegmentedControl(xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        if xmSegmentedControl == segmentedControl1 {
            print("SegmentedControl1 Selected Segment: \(selectedSegment)")
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
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVIEW.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as! QuestionTableViewCell
        
        return cell 
    }  
}

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.white
    }
}
