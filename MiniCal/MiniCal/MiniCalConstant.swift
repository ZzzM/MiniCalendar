//
//  MiniCalConstant.swift
//  MiniCal
//
//  Created by zm on 2020/10/14.
//
import SwiftUI


let WeekNames = ["日", "一", "二", "三", "四", "五", "六"]


extension Color {
    static let miniBackground = Color("WidgetBackground")
}

extension URL {
    static let calendar = URL(string: "calshow://")!
}

extension String {
    static let miniCalWidget = "MiniCalWidget"
    static let miniCalWidgetDisplayName = "Mini Calendar"
    static let miniCalWidgetDescription = "A Mini Calendar Widget"
}
