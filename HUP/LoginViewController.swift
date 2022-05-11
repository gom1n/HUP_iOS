//
//  LoginViewController.swift
//  HUP
//
//  Created by gomin on 2022/04/02.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
}
