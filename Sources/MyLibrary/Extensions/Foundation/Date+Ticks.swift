//
//  Date+Ticks.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation

public extension Date {
    
    func currentTimeInTicks() -> Int64 {
        let CTicksAt1970: Int64 = 621_355_968_000_000_000
        let CTicksPerSecond: Double = 10_000_000
        let CTicksMinValue: Int64 = 0
        let CTicksMaxValue: Int64 = 3_155_378_975_999_999_999
        
        if self == Date.distantPast {
            return CTicksMinValue
        }
        if self == Date.distantFuture {
            return CTicksMaxValue
        }
        let dateSeconds = Double(self.timeIntervalSince1970)
        let ticksSince1970 = Int64(round(dateSeconds * CTicksPerSecond))
        return CTicksAt1970 + ticksSince1970
    }
}
