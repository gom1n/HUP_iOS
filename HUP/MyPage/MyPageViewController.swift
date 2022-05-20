//
//  MyPageViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit
import Kingfisher

class MyPageViewController: UIViewController {
    @IBOutlet weak var mypageTableView: UITableView!
    var isLogin: Bool = false
    @IBOutlet weak var mypageLabel: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mypageTableView.delegate = self
        mypageTableView.dataSource = self
        
        let listViewNib = UINib(nibName: "MyPageTableViewCell", bundle: nil)
        mypageTableView.register(listViewNib, forCellReuseIdentifier: "MyPageTableViewCell")
        
        mypageTableView.separatorStyle = .none
        UserDefaults.standard.set(isLogin, forKey: "isLogin")
    }
    override func viewWillAppear(_ animated: Bool) {
        // 화면이 보일때마다 호출
        isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        setMyInfo()
    }
    func setMyInfo() {
        if isLogin == false {
            mypageLabel.setTitle("로그인하기", for: .normal)
        } else {
            mypageLabel.setTitle("login success", for: .normal)
            let userId = UserDefaults.standard.integer(forKey: "userId")
            MyPageDataManager().myInfoDataManager(userId, self)
        }
    }
    
    @IBAction func goLoginButtonTap(_ sender: UIButton) {
        goLogin()
    }
    func goLogin() {
        let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginVC")
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell", for: indexPath) as? MyPageTableViewCell else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.iconImageView.image = UIImage(named:"heartx")
            cell.contentLabel.text = "스크랩 내역"
        case 1:
            cell.iconImageView.image = UIImage(named:"interest")
            cell.contentLabel.text = "관심 카테고리"
        case 2:
            cell.iconImageView.image = UIImage(named:"notify")
            cell.contentLabel.text = "공지사항"
        case 3:
            cell.iconImageView.image = UIImage(named:"safety")
            cell.contentLabel.text = "안전거래설정"
        default:
            cell.iconImageView.image = UIImage(named: "category_white")
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
extension MyPageViewController {
    func myPageSuccessAPI(_ result : MyInfoModel) {
        
        let profileName = result.username!
        let profileImgUrlStr = result.picture!
        
        mypageLabel.setTitle(profileName, for: .normal)
        if let url = URL(string: profileImgUrlStr) {
            profileImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "person.fill"))
        }
    }
}
