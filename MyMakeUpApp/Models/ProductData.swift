//
//  ProductData.swift
//  MyMakeUpApp
//
//  Created by Jennifer Chukwuemeka on 28/06/2022.
//

import Foundation


struct ProductData: Codable {
    let makeoverElement: MakeoverElement
}


struct MakeoverElement: Codable {
    let id: Int
    let brand: String?
    let name: String
    let price: String?
    let priceSign: PriceSign?
    let currency: Currency?
    let imageLink: String
    let productLink: String
    let websiteLink: String
    let makeoverDescription: String?
    let rating: Double?
    let category: Category?
    let productType: ProductType
    let tagList: [String]
    let createdAt, updatedAt: String
    let productAPIURL: String
    let apiFeaturedImage: String
    let productColors: [ProductColor]

    enum CodingKeys: String, CodingKey {
        case id, brand, name, price
        case priceSign = "price_sign"
        case currency
        case imageLink = "image_link"
        case productLink = "product_link"
        case websiteLink = "website_link"
        case makeoverDescription = "description"
        case rating, category
        case productType = "product_type"
        case tagList = "tag_list"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case productAPIURL = "product_api_url"
        case apiFeaturedImage = "api_featured_image"
        case productColors = "product_colors"
    }
   
}

enum Category: String, Codable, CaseIterable {
    case bbCc = "bb_cc"
    case concealer = "concealer"
    case contour = "contour"
    case cream = "cream"
    case empty = ""
    case gel = "gel"
    case highlighter = "highlighter"
    case lipGloss = "lip_gloss"
    case lipStain = "lip_stain"
    case lipstick = "lipstick"
    case liquid = "liquid"
    case mineral = "mineral"
    case palette = "palette"
    case pencil = "pencil"
    case powder = "powder"
}

enum Currency: String, Codable,CaseIterable {
    case cad = "CAD"
    case gbp = "GBP"
    case usd = "USD"
}

enum PriceSign: String, Codable {
    case empty = "$"
    case priceSign = "£"
}

// MARK: - ProductColor
struct ProductColor: Codable {

    let hexValue: String
    let colourName: String?

    enum CodingKeys: String, CodingKey {
        case hexValue = "hex_value"
        case colourName = "colour_name"
    }
    
}

enum ProductType: String, Codable {
    case blush = "blush"
    case bronzer = "bronzer"
    case eyebrow = "eyebrow"
    case eyeliner = "eyeliner"
    case eyeshadow = "eyeshadow"
    case foundation = "foundation"
    case lipLiner = "lip_liner"
    case lipstick = "lipstick"
    case mascara = "mascara"
    case nailPolish = "nail_polish"
}

typealias Makeover = [MakeoverElement]
extension Double {
    var string: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 5
        formatter.roundingMode = .floor
        return formatter.string(for: self) ?? description
    }
}

//extension ProductColor: Decodable {
//    enum CodingKeys: String, CodingKey {case hexValue,colourName }
//    enum ProductColorKey: CodingKey {case productColor}
//    static func decode(_ json: Any) throws -> ProductColor {
//
//
//    }
//    init (from decoder: Decoder) throws {
//        let rootKeys = try decoder.container(keyedBy: ProductColorKey.self)
//        let productColorContainer = try rootKeys.nestedContainer(keyedBy: CodingKeys.self, forKey: .productColor)
//        try hexValue = productColorContainer.decode(String.self, forKey: .hexValue)
////        try colourName = productColorContainer.decode(String?.self, forKey: ProductColor.CodingKeys(rawValue: colourName!) ?? c)
//    }
//
//
//}
//
//extension MakeoverElement: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case id, brand, name, price
//        case priceSign = "price_sign"
//        case currency
//        case imageLink = "image_link"
//        case productLink = "product_link"
//        case websiteLink = "website_link"
//        case makeoverDescription = "description"
//        case rating, category
//        case productType = "product_type"
//        case tagList = "tag_list"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case productAPIURL = "product_api_url"
//        case apiFeaturedImage = "api_featured_image"
//        case productColors = "product_colors"
//    }
//    enum NodeKeys: CodingKey {case nodes}
//
//    static func decode(_ json: Any) throws -> MakeoverElement {
//
//
//    }
//    init(from decoder: Decoder) throws {
//        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
//        try id =  rootContainer.decode(Int.self, forKey: .id)
//        try name = rootContainer.decode(String.self, forKey: .name)
//        let  productColorsNode = try rootContainer.nestedContainer(keyedBy: NodeKeys.self, forKey: .productColors)
//        var nodes = try productColorsNode.nestedUnkeyedContainer(forKey: .nodes)
//        var allProductColors: [ProductColor] = []
//        while !nodes.isAtEnd {
//            let productColor = try nodes.decode(ProductColor.self)
//            allProductColors += [productColor]
//
//        }
//        productColors = allProductColors
//        return  allProductColors
//
//    }
//
//
//
//
//}
//
