//
//  ViewController.swift
//  TODOList
//
//  Created by 이문정 on 2021/02/15.
// 

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 조건에 맞는 비밀번호일 경우 다음화면으로 전환, 아닐 경우 얼럿 창 표시
    @IBAction private func loginButtonClicked(_ sender: Any) {
        if validPassword(passwordTextField?.text) {
            presentToDoList()
        } else {
            presentAlert()
        }
    }
    
    //  비밀번호를 1234 로 설정하고 다른 비밀번호 입력 시 false를 출력하는 함수
    private func validPassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        return password == "1234"
    }
    
    // 뷰 전환 함수 - 네비게이션 컨트롤러로 전환하고, rootViewController: viewController 설정
    private func presentToDoList() {
        let viewController = self.storyboard?.instantiateViewController(identifier: "ToDoList") as! ToDoListViewController
        let navigaionController = UINavigationController(rootViewController: viewController)
        navigaionController.modalPresentationStyle = .fullScreen
        self.present(navigaionController, animated: true, completion: nil)
        
    }
    
    // 비밀번호 오류 시 나타나는 얼럿
    private func presentAlert() {
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
