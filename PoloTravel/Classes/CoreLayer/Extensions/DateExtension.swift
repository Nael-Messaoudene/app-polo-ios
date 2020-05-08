//
//  DateExtension.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 06/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
