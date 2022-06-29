//
//  LoginViewController.swift
//  HUP
//
//  Created by gomin on 2022/04/02.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var id: String?
    var pw: String?
    var validId: Bool = false
    var validPW: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isValidTf()
    }
    func isValidTf() {
        if self.validId && self.validPW {
            self.loginButton.backgroundColor = UIColor(named: "HupColor")
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.backgroundColor = UIColor(named: "disabledButtonColor")
            self.loginButton.isEnabled = false
        }
    }
    @IBAction func idTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.id = text
        self.validId = text.isValidId() ? true : false
        isValidTf()
    }
    @IBAction func pwTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.pw = text
        self.validPW = text.count > 2 ? true : false
        isValidTf()
    }
    
    //MARK: App Login
    @IBAction func appLoginButtonTap(_ sender: UIButton) {
        let id = idTextField.text!
        let pw = pwTextField.text!
        let appLoginInput = AppLoginInput(loginId: id, password: pw, targetToken: "")
        LoginDataManager().appLoginDataManager(appLoginInput, self)
    }
    
    @IBAction func backButtonTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면전환
        //1 스토리 보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2 뷰컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        //3 화면전환 메소드를 사용해서 화면을 전환
        registerViewController.modalPresentationStyle = .fullScreen
        self.present(registerViewController, animated: true, completion: nil)
    }
    
    public func goBack() {
//        self.dismiss(animated: true, completion: nil)
        // 첫 화면 전환
        guard let tabBarController = self.storyboard?
                .instantiateViewController(withIdentifier: "TabBarC")
                as? CustomTabBarController else {return}
        tabBarController.modalPresentationStyle = .fullScreen
        self.view.window?.windowScene?.keyWindow?.rootViewController = tabBarController
//        self.present(tabBarController, animated: true, completion: nil)
    }
}
