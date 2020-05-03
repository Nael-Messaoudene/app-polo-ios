//
//  Travel.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 03/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct Travel: Decodable {
  let startDate: Date
  let endDate: Date
  let price: Int
  let daysDatas: [TravelDay]
}
