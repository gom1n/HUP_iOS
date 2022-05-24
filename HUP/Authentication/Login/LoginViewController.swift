//
//  LoginViewController.swift
//  HUP
//
//  Created by gomin on 2022/04/02.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: App Login
    @IBAction func appLoginButtonTap(_ sender: UIButton) {
        let id = idTextField.text!
        let pw = pwTextField.text!
        let appLoginInput = AppLoginInput(loginId: id, password: pw, targetToken: "")
        LoginDataManager().appLoginDataManager(appLoginInput, self)
    }
    
    
    //MARK: Google Login
    @IBAction func googleLoginTap(_ sender: Any) {
        let config = GIDConfiguration(clientID: "221537301769-312uam9bnlhk82hb0gr7n5sore92vblv.apps.googleusercontent.com")
                
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            guard let user = user else { return }
         
            user.authentication.do { [self] authentication, error in
                            guard error == nil else { print(error); return }
                            guard let authentication = authentication else { return }
                            
                            let idToken = authentication.idToken
                            
                            // Send ID token to backend
                            //서버에 보낼 함수
//                            tokenSign(idToken: idToken!)
                print(idToken!)
//                            let input = GoogleLoginInput(idToken: idToken, targetToken: nil)
//                            LoginDataManager().googleLoginDataManager(input)
                            
            }
        }
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
        self.present(registerViewController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    public func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
