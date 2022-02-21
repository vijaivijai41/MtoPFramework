//
//  UserDataModel.swift
//  MtoPInterview
//
//  Created by vijay kumar on 09/02/22.
//

import Foundation

public struct UserInfo {
    public let userName: String
    public let password: String
    
    public init (userName: String, password: String) {
        self.password = password
        self.userName = userName
    }
}

public struct UserInfoEncription {
    public let userName: Data
    public let password: Data
    
    public init(userName: Data, password: Data) {
        self.userName = userName
        self.password = password
    }
}
