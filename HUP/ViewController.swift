//
//  ViewController.swift
//  HUP
//
//  Created by gomin on 2022/04/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let tabBarVc = CustomTabBarController()

        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC")
        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ChattingVC")
        let vc3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "UploadVC")
        let vc4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ItemListVC")
        let vc5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MyPageVC")
        vc1.title = "Home"
        vc2.title = "Chatting"
        vc3.title = "Upload"
        vc4.title = "Itemlist"
        vc5.title = "MyPage"
        
        tabBarVc.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: false)
        tabBarVc.tabBar.backgroundColor = .white
        tabBarVc.tabBar.layer.cornerRadius = 10
        tabBarVc.tabBar.tintColor = UIColor(named: "HupColor")

        guard let items = tabBarVc.tabBar.items else {
            return
        }

        let images = ["homekit","message","","square.split.1x2","person"]
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }

        tabBarVc.modalPresentationStyle = .fullScreen
        self.present(tabBarVc, animated: false, completion: nil)
    }

}

