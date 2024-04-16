//
//  HotelQuery.swift
//
//
//  Created by Marco Alonso on 16/04/24.
//

import Foundation
import Vapor

struct HotelQuery: Content {
    let sort: String
    let search: String?
}
