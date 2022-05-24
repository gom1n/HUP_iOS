//
//  RegisterViewController.swift
//  HUP
//
//  Created by gomin on 2022/04/02.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet private weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwCheckTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var isIdChecked: Bool? = false
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: - Actions
    @IBAction func idCheckButtonTap(_ sender: Any) {
    }
    // MARK: 회원가입 버튼 클릭
    @IBAction func registerButtonTap(_ sender: UIButton) {
        var id = idTextField.text!
        var pw = pwTextField.text!
        var pwCheck = pwCheckTextField.text!
        var nickname = nickNameTextField.text!
        var email = emailTextField.text!
        // MARK: id text field
        if !(id.count >= 5 && id.count <= 10) {
            UIManager().showToast(message: "아이디는 최소 5글자 이상 10글자 이하여야 합니다.", viewController: self)
            return
        }
        // MARK: id check
        if !(isIdChecked!) {
            UIManager().showToast(message: "아이디 중복확인을 해주세요.", viewController: self)
            return
        }
        // MARK: password text field
        if !((pw.isValidPassword())) {
            UIManager().showToast(message: "비밀번호는 영어, 숫자, 특수문자를 조합해 8~12자리로 입력해주세요.", viewController: self)
            return
        }
        // MARK: password check
        if (pw != pwCheck) {
            UIManager().showToast(message: "비밀번호가 서로 일치하지 않습니다.", viewController: self)
            return
        }
        // MARK: username text field
        if !(nickname.count >= 2 && nickname.count <= 10) {
            UIManager().showToast(message: "이름은 최소 2글자 이상 10글자 이하여야 합니다.", viewController: self)
            return
        }
        // MARK: email text field
        if !(email.isValidEmail()) {
            UIManager().showToast(message: "이메일을 알맞은 형태로 입력해주세요.", viewController: self)
            return
        }
        // MARK: register
        let registerInput = RegisterInput(email: email, loginId: id, password: pw, phoneNumber: nil, username: nickname)
        RegisterDataManager().registerDataManager(registerInput, self)
    }
    
    @IBAction func backButtonTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension RegisterViewController {
    func registerSuccessAPI(_ result: RegisterModel) {
        UIManager().showToast(message: result.message!, viewController: self)
        let userId = result.userId!
        UserDefaults.standard.set(userId, forKey: "userId")
    }
}
extension String {
    // 대문자, 소문자, 특수문자, 숫자 포함 8글자 이상일 때
    func isValidPassword() -> Bool {
        let passwordRegEx = "^.*(?=^.{8,16}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
