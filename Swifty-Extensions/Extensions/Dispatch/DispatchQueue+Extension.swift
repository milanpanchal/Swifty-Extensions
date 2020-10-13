//
//  DispatchQueue+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import Foundation

typealias Dispatch = DispatchQueue

extension Dispatch {

    static func background(_ task: @escaping () -> Void) {
        Dispatch.global(qos: .background).async {
            task()
        }
    }

    static func main(_ task: @escaping () -> Void) {
        Dispatch.main.async {
            task()
        }
    }
}
