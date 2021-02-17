//
//  AddListViewController.swift
//  TODOList
//
//  Created by 이문정 on 2021/02/16.
//

import UIKit

class AddListViewController: UIViewController {
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var summaryTextField: UITextField!
    
    private var didAddHandler: ((TodoList)->Void)?
    
    @IBAction private func doneButtonClicked(_ sender: UIBarButtonItem) {
        let title = titleTextField.text!
        let summary = summaryTextField.text ?? ""
        
        let item: TodoList = TodoList(title: title, summary: summary)
        
        print("Add List title : \(item.title)")
        // TodoListViewController에 생성한 전역변수에 append
        list.append(item)
        
        // Done 버튼 클릭 시 새로운 TodoList 객체 생성
        // 생성한 객체에 입력한 정보 저장
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
