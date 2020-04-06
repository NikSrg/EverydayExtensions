//
//  DispatchQueue+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public func performOnMainQueue(_ block: @escaping () -> Void) {
    DispatchQueue.main.async(execute: block)
}

public func performOnMain(afterDelay delay: Double, block: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: block)
}

public func performOnGlobalQueue(_ block: @escaping () -> Void) {
    DispatchQueue.global().async(execute: block)
}
