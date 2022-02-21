//
//  UserCredentials.swift
//  MtoPInterview
//
//  Created by vijay kumar on 09/02/22.
//

import Foundation


let keyString = "FiugQTgPNwCWUY,VhfmM4cKXTLVFvHFe"

public struct UserCredentials {
    let keyEncription: String

    public init() {
        self.keyEncription = keyString
    }
    
    public func saveUserInfo(user: UserInfo, onCompletion: (Result<UserInfoEncription, Error>) -> Void) {
        do {
            let aesKey = try AES(keyString: keyString)
            let userName = try aesKey.encrypt(user.userName)
            let password = try aesKey.encrypt(user.password)
            onCompletion(.success(UserInfoEncription(userName: userName, password: password)))
        }
        catch {
            onCompletion(.failure(error))
        }
    }
    
    
    public func retriveUserInfo(userInfo: UserInfoEncription, onCompletion: (Result<UserInfo, Error>) -> Void) {
        do {
            let aesKey = try AES(keyString: keyString)
            let userName = try aesKey.decrypt(userInfo.userName)
            let password = try aesKey.decrypt(userInfo.password)
            onCompletion(.success(UserInfo(userName: userName, password: password)))
        }
        catch {
            onCompletion(.failure(error))
        }
    }
    
    
}
