//
//  GetCategory.swift
//  HUP
//
//  Created by gomin on 2022/05/21.
//

import Foundation
import UIKit

class UIManager {
//    let category: String? = ""
//    public GetCategory(String category) {
//        this.category = getCategory(category);
//    }

    func categoryToEnum(categoryStr: String) -> String {
        var str: String = ""
        switch categoryStr {
            case "디지털 기기":
                str = "eDigital"
            case "생활가전":
                str = "eHouseHoldAppliance"
            case "가구/인테리어":
                str = "eFurnitureAndInterior"
            case "유아동":
                str = "eChildren"
            case "생활/가공식품":
                str = "eDailyLifeAndProcessedFood"
            case "유아도서":
                str = "eChildrenBooks"
            case "스포츠/레저":
                str = "eSportsAndLeisure"
            case "여성잡화":
                str = "eMerchandiseForWoman"
            case "여성의류":
                str = "eWomenClothing"
            case "남성패션/잡화":
                str = "eManFashionAndMerchandise"
            case "게임/취미":
                str = "eGameAndHabit"
            case "뷰티/미용":
                str = "eBeauty"
            case "반려동물용품":
                str = "ePetProducts"
            case "도서/티켓/음반":
                str = "eBookTicketAlbum"
            case "식물":
                str = "ePlant"
        default: str = ""
        }
        return str;
    }
    func isLogin() -> Bool {
        let userId = UserDefaults.standard.integer(forKey: "userId")
        if userId == -1 {
            return false
        } else {
            return true
        }
    }
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0), viewController : UIViewController) {
        let toastLabel = UILabel(frame: CGRect(x: viewController.view.frame.size.width/2 - CGFloat(Double(message.count) * 6.5), y: viewController.view.frame.size.height-150, width: CGFloat(message.count * 13), height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        viewController.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in toastLabel.removeFromSuperview() }) }
}
//    eDigital("디지털 기기"),
//    eHouseHoldAppliance("생활가전"),
//    eFurnitureAndInterior("가구/인테리어"),
//    eChildren("유아동"),
//    eDailyLifeAndProcessedFood("생활/가공식품"),
//    eChildrenBooks("유아도서"),
//    eSportsAndLeisure("스포츠/레저"),
//    eMerchandiseForWoman("여성잡화"),
//    eWomenClothing("여성의류"),
//    eManFashionAndMerchandise("남성패션/잡화"),
//    eGameAndHabit("게임/취미"),
//    eBeauty("뷰티/미용"),
//    ePetProducts("반려동물용품"),
//    eBookTicketAlbum("도서/티켓/음반"),
//    ePlant("식물");
