//
//  ToDoListTableViewCell.swift
//  TODOList
//
//  Created by 이문정 on 2021/02/17.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var summaryLabel: UILabel?
    @IBOutlet weak var checkImageView: UIImageView?
   
//    func configure(with list: TodoList) {
//      titleLabel?.text = list.title
//      summaryLabel?.text = list.summary
//      checkImageView?.isHidden = !list.isComplete
//    }
    
}
