//
//  Protocols.swift
//  pruebaTecnica
//
//  Created by Loducode Retina on 18/02/23.
//

import Foundation

import NotificationBannerSwift
import Simple_Networking

protocol LoginProtocols {
    func login (token:TokenRequest, completion: @escaping (_ result: (TokenResponse?,String?)) -> Void)
}

class LoginModel:LoginProtocols{
    
    func login(token: TokenRequest, completion: @escaping ((TokenResponse?, String?)) -> Void) {
        SimpleNetworking.defaultHeaders = [
            "Content-Type": "application/json",
            "Accept-Language": "es"
            // Your headers
        ]
        SN.post(endpoint: Endpoints.login, model: token) { (response: SNResultWithEntity<TokenResponse, ErrorResponseDetail>) in
            
            switch response {
                
            case .error(let error):
                NotificationBanner(title: "Algo está mal", subtitle: error.localizedDescription,
                                   style: .danger).show()
                
                completion((nil,"algo"))
                
            case .errorResult(let entity):
                NotificationBanner(title: "Error", subtitle: entity.detail,
                                   style: .warning).show()
                
                completion((nil,"otro"))
            case .success(let user):
                // Add headers for all request
                SimpleNetworking.setAuthenticationHeader(prefix: "Bearer", token: user.access ?? "")
                
                UserDefaults.standard.set(user.access, forKey: "access")
                UserDefaults.standard.set(user.refresh, forKey: "refresh")
                completion((user,nil))
            }
        }
    }
}

protocol usersProtocols {
    func getAllUsers(completion: @escaping (_ result: (userResponse?,String?)) -> Void)
}

class userModel:usersProtocols{
    
    func getAllUsers(completion: @escaping ((userResponse?, String?)) -> Void) {
        
        SN.get(endpoint: Endpoints.getUsers) { (response: SNResultWithEntity<userResponse?, ErrorResponse>) in
            
            switch response {
            case .success(let user):
                completion((user,nil))
                
            case .error(let error):
                NotificationBanner(title: "Get user error", subtitle: error.localizedDescription,
                                   style: .warning).show()
                
                completion((nil,"error get"))
                
            case .errorResult(let entity):
                NotificationBanner(title: "No conection", subtitle: entity.error,
                                   style: .warning).show()
                
                completion((nil,"error conection"))
            }
        }
    }
}
