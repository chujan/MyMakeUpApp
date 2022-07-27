//
//  Constant.swift
//  carProject
//
//  Created by Jennifer Chukwuemeka on 24/06/2022.
//

import Foundation
import SwiftUI

struct Constants {
    static let makeupURL = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json")
    static let searchURLString = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline")
    static let searchURL = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json?brand=covergirl&product_type=lipstick")
}
