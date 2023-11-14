//
//  ResponseModel.swift
//  pots-n-pans
//
//  Created by Gabriel Hübner on 11/14/23.
//

import Foundation

struct ResponseModel: Codable {
    let delayTime: Double
    let executionTime: Double
    let id: String
    let output: Output
    let status: String
}

struct Output: Codable {
    let classes: [String]
    let recipes: [String]
}
