//
//  ViewController.swift
//  TODOList
//
//  Created by 이문정 on 2021/02/15.
// 

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        if validPassword(passwordTextField?.text) {
            presentToDoList()
        } else {
            presentAlert()
        }
    }
    
    func validPassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        return password == "1234"
    }
    
    func presentToDoList() {
        let viewController = self.storyboard?.instantiateViewController(identifier: "toDoList") as! ToDoListViewController
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "비밀번호 오류!",
                                      message: "정확한 비밀번호를 입력해 주세요.",
                                      preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK",
                                        style: UIAlertAction.Style.default,
                                        handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}
