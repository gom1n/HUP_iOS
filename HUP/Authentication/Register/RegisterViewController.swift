//
//  RegisterViewController.swift
//  HUP
//
//  Created by gomin on 2022/04/02.
//

import UIKit

class RegisterViewController: UIViewController {
    // textfields
    @IBOutlet private weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwCheckTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    // buttons
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var idCheckButton: UIButton!
    // attributes
    var id: String?
    var pw: String?
    var nickname: String?
    var email: String?
    
    var isValidEmail = false
    var isValidId = false
    var isValidNickname = false
    var isValidPassword = false
    var isValidPasswordCheck = false
    var isIdChecked = false
    
    var textFields: [UITextField] {
        [idTextField, pwTextField, nickNameTextField, emailTextField]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        isValidTf()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    // check is valid text fields and change button state
    func isValidTf() {
        if isValidEmail && isValidId && isValidNickname && isValidPassword && isValidPasswordCheck && isIdChecked {
            self.registerButton.backgroundColor = UIColor(named: "HupColor")
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.backgroundColor = UIColor(named: "disabledButtonColor")
            self.registerButton.isEnabled = false
        }
        if isValidId {
            self.idCheckButton.backgroundColor = UIColor(named: "HupColor")
            self.idCheckButton.isEnabled = true
        } else {
            self.idCheckButton.backgroundColor = UIColor(named: "disabledButtonColor")
            self.idCheckButton.isEnabled = false
        }
    }
    // MARK: - Actions - textFields editing changed
    @IBAction func idTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.isValidId = text.isValidId()
        self.id = text
        isValidTf()
        print("isValidId ", self.isValidId)
    }
    @IBAction func pwTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.isValidPassword = text.isValidPassword()
        self.pw = text
        isValidTf()
        print("isValidPassword ", self.isValidPassword)
    }
    @IBAction func pwCheckTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        isValidPasswordCheck = (text == self.pw) ? true : false
        print("isValidPWCHeck ", self.isValidPasswordCheck)
        isValidTf()
    }
    @IBAction func nickNameTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.isValidNickname = text.isValidNickName()
        self.nickname = text
        isValidTf()
        print("isValidNickname ", self.isValidNickname)
    }
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.isValidEmail = text.isValidEmail()
        self.email = text
        isValidTf()
        print("isValidEmail ", self.isValidEmail)
    }
    // MARK: - Actions - button tap
    // id check button click
    @IBAction func idCheckButtonTap(_ sender: Any) {
        let loginId = (self.id)!
        print("edited loginId: ", loginId)
        RegisterDataManager().idCheckDataManager(loginId, self)
    }
    // 회원가입 버튼 클릭
    @IBAction func registerButtonTap(_ sender: UIButton) {
        // MARK: register
        let registerInput = RegisterInput(email: self.email, loginId: self.id, password: self.pw, phoneNumber: nil, username: self.nickname)
        RegisterDataManager().registerDataManager(registerInput, self)
    }
    
    @IBAction func backButtonTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension RegisterViewController {
    func idCheckSuccessAPI(_ result: IdCheckModel) {
        UIManager().showToast(message: result.message!, viewController: self)
        self.isIdChecked = true
    }
    func registerSuccessAPI(_ result: RegisterModel) {
        UIManager().showToast(message: result.message!, viewController: self)
        let userId = result.userId!
        UserDefaults.standard.set(userId, forKey: "userId")
    }
}
extension String {
    // 아이디는 최소 5글자 이상 10글자 이하여야 합니다.
    func isValidId() -> Bool {
        let idRegEx = "^[a-zA-Z0-9]{5,10}$"
        let idTest = NSPredicate(format: "SELF MATCHES %@", idRegEx)
        return idTest.evaluate(with: self)
    }
    // 비밀번호는 영어, 숫자, 특수문자를 조합해 8~12자리로 입력해주세요.
    func isValidPassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,12}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    // 이름은 최소 2글자 이상 10글자 이하여야 합니다.
    func isValidNickName() -> Bool {
        let passwordRegEx = "^[a-zA-Z0-9]{2,10}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    // 이메일 형식
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
