
//
//  Date+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension Date {
    // MARK: - Private Properties
    
    private static let dateformatter = DateFormatter()
    
    // MARK: - Public Properties
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    // MARK: - Public Methods
    
    mutating func add(_ amount: Int, to component: Calendar.Component) {
        self = Calendar.current.date(byAdding: component, value: amount, to: self)!
    }
    
    mutating func add(_ amounts: [Calendar.Component: Int]) {
        amounts.forEach({
            self.add($0.value, to: $0.key)
        })
    }
    
    mutating func set(_ components: [Calendar.Component: Int]) {
        var allComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.forEach({
            allComponents.setValue($0.value, for: $0.key)
        })
        self = Calendar.current.date(from: allComponents)!
    }
    
    func adding(_ amount: Int, to component: Calendar.Component) -> Date? {
        return Calendar.current.date(byAdding: component, value: amount, to: self)
    }
    
    func components(_ components: Set<Calendar.Component> = [.day, .month, .year, .hour, .minute, .second]) -> DateComponents {
        return Calendar.current.dateComponents(components, from: self)
    }
    
    func components(_ components: Set<Calendar.Component> = [.day, .month, .year, .hour, .minute, .second], toDate date: Date) -> DateComponents {
        return Calendar.current.dateComponents(components, from: self, to: date)
    }
    
    func localizedString(withDateStyle dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        return DateFormatter.localizedString(from: self, dateStyle: dateStyle, timeStyle: timeStyle)
    }
    
    func string(withFormat format: String) -> String? {
        Date.dateformatter.dateFormat = format
        return Date.dateformatter.string(from: self)
    }
}
