//
//  Extensions.swift
//  CommitReader
//
//  Created by James Lapinski on 3/1/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import Foundation

extension Double {
    var stringWithoutZeroFraction: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
