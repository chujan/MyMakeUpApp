//
//  String+Extension.swift
//  MyMakeUpApp
//
//  Created by Jennifer Chukwuemeka on 28/06/2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
