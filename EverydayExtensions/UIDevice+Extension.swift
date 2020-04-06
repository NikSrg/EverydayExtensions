//
//  UIDevice+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 28.02.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import UIKit
import LocalAuthentication

public extension UIDevice {
    // MARK: - Public Properties

    static var hasNotch: Bool {
        return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0 > 20
    }

    static var isDeviceOwnerBiometricAuthenticationEnabled: Bool {
        LAContext().canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }

    static var biometryTypeForDeviceOwnerAuthentication: LABiometryType {
        let context = LAContext()
        _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        return context.biometryType
    }

    // MARK: - Public Methods

    static func evaluatePolicy(_ policy: LAPolicy = .deviceOwnerAuthenticationWithBiometrics, localizedReason: String, completion: @escaping (Bool, Error?) -> Void) {
        LAContext().evaluatePolicy(policy, localizedReason: localizedReason) { activated, error in
            DispatchQueue.main.async {
                completion(activated, error)
            }
        }
    }
}
