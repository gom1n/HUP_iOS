//
//  UploadContentTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/13.
//

import UIKit
import Cosmos

class UploadContentTableViewCell: UITableViewCell {
    @IBOutlet weak var itemNameText: UITextField!
    @IBOutlet weak var itemCategoryText: UITextField!
    @IBOutlet weak var itemPriceText: UITextField!
    @IBOutlet weak var itemDescriptionText: UITextView!
    @IBOutlet weak var itemStatusView: CosmosView!
    @IBOutlet weak var buyDatePicker: UIDatePicker!
    @IBOutlet weak var endDateTimePicker: UIDatePicker!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemDescriptionText.layer.borderColor = UIColor.systemGray5.cgColor
        itemDescriptionText.layer.borderWidth = 1.0
        
        // 별점 set
        itemStatusView.rating = 1
        itemStatusView.settings.updateOnTouch = true
        itemStatusView.settings.fillMode = .full
        itemStatusView.settings.starSize = 30
        itemStatusView.settings.starMargin = 5
        itemStatusView.settings.filledColor = UIColor(named: "HupColor") ?? UIColor.gray
        itemStatusView.settings.emptyBorderColor = UIColor(named: "HupColor") ?? UIColor.gray
        itemStatusView.settings.filledBorderColor = UIColor(named: "HupColor") ?? UIColor.gray
        
        // date pickers
        buyDatePicker.preferredDatePickerStyle = .automatic
        endDateTimePicker.preferredDatePickerStyle = .automatic
        buyDatePicker.locale = Locale(identifier: "ko-KR")
        buyDatePicker.timeZone = .autoupdatingCurrent
        endDateTimePicker.locale = Locale(identifier: "ko-KR")
        endDateTimePicker.timeZone = .autoupdatingCurrent
        var components = DateComponents()
        components.day = 10
        let maxDate = Calendar.autoupdatingCurrent.date(byAdding: components, to: Date())
        components.day = -10
        let minDate = Calendar.autoupdatingCurrent.date(byAdding: components, to: Date())

        buyDatePicker.maximumDate = maxDate
        endDateTimePicker.minimumDate = minDate
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
