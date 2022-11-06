//
//  DecimalUtils.swift
//  Bankey
//
//  Created by K Praveen Kumar on 06/11/22.
//

import Foundation

extension Decimal{
    var doubleValue: Double{
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
