//
//  ServiceConstants.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//


import Foundation

enum ServiceConstants {
    static let feedbackUrl = APIURL.urlFeedback.rawValue
    static let imageUrl = APIURL.urlImage.rawValue
}

enum APIURL: String {
    case urlFeedback = "https://webhook.site/cc1a4a99-9dad-4c5f-92c4-5897a1ee65b4"
    case urlImage = "https://app.wegotrip.com/media/users/1/path32.png"
}
