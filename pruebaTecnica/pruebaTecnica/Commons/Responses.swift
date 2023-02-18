//
//  Responses.swift
//  pruebaTecnica
//
//  Created by Loducode Retina on 18/02/23.
//

import Foundation

struct TokenResponse: Codable {
    var refresh: String?
    var access: String?
}

struct userResponse: Codable{
    var name: String
    var username: String
    var dateCreate: String
}

struct ErrorResponse: Codable {
    let error: String
}

struct ErrorResponseDetail: Codable {
    let detail: String
}
