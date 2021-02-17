//
//  ToDoListViewController.swift
//  TODOList
//
//  Created by 이문정 on 2021/02/16.
//

import UIKit

var list = [TodoList]()

class ToDoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAllData()
        print(list.description)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveAllData()
        tableView.reloadData()
    }
    
    func saveAllData() {
        let data = list.map {
            [
                "title": $0.title,  // $0 : 0번부터
                "content": $0.summary!,
                "isComplete": $0.isComplete
            ]
        }
        
        print(type(of: data))
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "items")
        userDefaults.synchronize()
    }
    
    // userDefault 데이터 불러오기
    func loadAllData() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "items") as? [[String: AnyObject]] else {
            return
        }
        
        print(data.description)
        
        // list 배열에 저장하기
        print(type(of: data))
        list = data.map {
            let title = $0["title"] as? String
            let summary = $0["content"] as? String
            let isComplete = $0["isComplete"] as? Bool
            
            return TodoList(title: title!, summary: summary!, isComplete: isComplete!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListTableViewCell") as? ToDoListTableViewCell else { fatalError("ToDoListTableViewCell did not configured")
        }
        cell.titleLabel?.text = list[indexPath.row].title
        cell.summaryLabel?.text = list[indexPath.row].summary
        if list[indexPath.row].isComplete {
            cell.checkImageView?.isHidden = false
        }else{
            cell.checkImageView?.isHidden = true
        }
        return cell
    }
}

extension ToDoListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        guard list.count > indexPath.row else { return }
        var lists = list[indexPath.row]
        lists.isComplete.toggle()
        list[indexPath.row] = lists
        tableView.reloadData()
        return
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
