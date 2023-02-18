//
//  Endpoints.swift
//  pruebaTecnica
//
//  Created by Loducode Retina on 18/02/23.
//

import Foundation
struct Endpoints {
    
    static let domain = "https://192.168.0.72:31196/accounts/sessions/complete"
    //Se usó otro domain para reaizar las pruebas
    
    static let login = Endpoints.domain + "/api/token/"
    static let getUsers = Endpoints.domain + "/api/users/"

}
