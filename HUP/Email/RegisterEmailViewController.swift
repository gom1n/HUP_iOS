//
//  RegisterEmailViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/26.
//

import UIKit

class RegisterEmailViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var authcodeTextField: UITextField!
    @IBOutlet weak var emailCheckButton: UIButton!
    
    var email: String?
    var authcode: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        emailLabel.text = self.email
        isValidTf(authcodeTextField.text!)
    }
    func isValidTf(_ text: String) {
        emailCheckButton.isEnabled = text.count > 0 ? true : false
        emailCheckButton.backgroundColor = text.count > 0 ? UIColor(named: "disabledButtonColor") : UIColor(named: "HupColor")
    }

    // MARK: - Actions
    @IBAction func aucthCodeTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.authcode = text
        isValidTf(text)
    }
    
    @IBAction func resendButtonTap(_ sender: UIButton) {
        let registerEmailInput = RegisterEmailInput(email: self.email)
        EmailDataManager().registerEmailResendDataManager(registerEmailInput, self)
    }
    
    @IBAction func emailCheckButtonTap(_ sender: UIButton) {
        let checkEmailInput = CheckEmailInput(authCode: self.authcode)
        EmailDataManager().checkEmailDataManager(checkEmailInput, self)
    }
}
// MARK: - extensions
extension RegisterEmailViewController {
    func registerEmailResendSuccessAPI(_ result: RegisterEmailModel) {
        UIManager().showToast(message: "다시 전송되었습니다. 확인해주십시오.", viewController: self)
    }
    func checkEmailSuccessAPI(_ result: CheckEmailModel) {
        UIManager().showToast(message: "인증되었습니다.", viewController: self)
        
        // 첫 화면 전환
        guard let tabBarController = self.storyboard?
                .instantiateViewController(withIdentifier: "TabBarC")
                as? CustomTabBarController else {return}
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
}
