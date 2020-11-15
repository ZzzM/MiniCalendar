//
//  MiniCalHelper.swift
//  MiniCal
//
//  Created by zm on 2020/10/14.
//

import Foundation

struct MiniCalHelper {
    
    static var version: String {
        
        let bundle = Bundle.main
        
        guard let releaseVersionNumber = bundle.releaseVersionNumber else {
            return ""
        }
        
        guard let buildVersionNumber = bundle.buildVersionNumber else {
            return ""
        }
        
        return "Version \(releaseVersionNumber) (\(buildVersionNumber))"
    }

    
    static var beginningOfTomorrow: Date {
        var date = Date().beginning(of: .day) ?? Date()
        date.add(.day, value: 1)
        return date
    }
    
    static var beginningOfMonth: Date {
        
        let date = Date()
        //        var date = Date()
        //        date.add(.month, value: -2)
        return date.beginning(of: .month) ?? Date()
        
    }
    
    static var indexOfToday: Int {
        Date().day + MiniCalHelper.prefix - 1
    }
    
    static var countOfItems: Int {
        items.count
    }
    
    static var prefix: Int {
        beginningOfMonth.weekday - 1
    }
    
    static var monthName: String {
        beginningOfMonth.monthName
    }
    
    
    
    static var items: [String] {
        
        var daysInMonth = [String]()
        for day in 1 ... beginningOfMonth.daysInMonth {
            daysInMonth.append("\(day)")
        }
        
        return [String](repeating: "", count: prefix) + daysInMonth
    }
    
}

