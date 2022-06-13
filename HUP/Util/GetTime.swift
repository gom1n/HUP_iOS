//
//  GetTime.swift
//  HUP
//
//  Created by gomin on 2022/05/24.
//

import Foundation
class GetTime {
    var isFinish: Bool = false
    func getTimeDif(_ nowTime: Date, _ closingTime: String) -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let startTime = format.date(from: nowTime.toString())
        let endTime = format.date(from: closingTime.replacingOccurrences(of: "T", with: " "))
        let useTime = Int(endTime!.timeIntervalSince(startTime!))   // 초 단위
        
        return getTimeToString(useTime)
    }
    func getTimeToString(_ seconds: Int) -> String {
        if seconds < 0 {
            isFinish = true
            return "🔔 경매 종료"
        }
        var day = 0
        var hour = seconds / 3600
        var min = (seconds % 3600) / 60
        if hour > 24 {
            isFinish = false
            day = hour / 24
            hour = hour % 24
            return "⏰ " + String(day) + "일 " + String(hour) + "시간 " + String(min) + "분 전"
        }
        else { isFinish = false; return "⏰ " + String(hour) + "시간 " + String(min) + "분 전" }
    }
}
extension String {
    func toDate() -> Date? { //"yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: self)
    }
}
