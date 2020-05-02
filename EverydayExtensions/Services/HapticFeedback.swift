//
//  HapticFeedback.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 02.05.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import Foundation

public enum HapticFeedbackStyle {
    case selection
    case light
    case meduim
    case heavy
    case success
    case error

    @available(iOS 13.0, *)
    case soft
    case rigid
}

public class HapticFeedback {
    // MARK: - Public Methods

    public static func occure(_ style: HapticFeedbackStyle = .light) {
        switch style {
        case .selection:
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()

        case .light:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.prepare()
            generator.impactOccurred()

        case .soft:
            if #available(iOS 13.0, *) {
                let generator = UIImpactFeedbackGenerator(style: .soft)
                generator.prepare()
                generator.impactOccurred()
            }

        case .meduim:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.prepare()
            generator.impactOccurred()

        case .heavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.prepare()
            generator.impactOccurred()

        case .rigid:
            if #available(iOS 13.0, *) {
                let generator = UIImpactFeedbackGenerator(style: .rigid)
                generator.prepare()
                generator.impactOccurred()
            }

        case .success:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.success)

        case .error:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.error)
        }
    }
}
