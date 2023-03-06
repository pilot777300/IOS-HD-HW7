//
//  Post.swift
//  StorageService
//
//  Created by Mac on 29.09.2022.
//

import Foundation
import UIKit
//import NavigTest

public struct Post {
    public init(author: String? = nil, description: String? = nil, image: String? = nil, lokes: Int? = nil, views: Int? = nil) {
        self.author = author
        self.description = description
        self.image = image
        self.lokes = lokes
        self.views = views
    }
    
    public var author: String?
    public var description: String?
    public var image: String?
    public var lokes: Int?
    public var views: Int?
    
}
   
//class User {
//    var login: String?
//    var fullName: String?
//    var avatar = UIImage()
//    var status: String?
//}
//
//protocol UserService {
//    func authorise(login: String?) -> User?
//}
//
//class CurrentUserService: UserService {
//    
//    var object = User()
//   
//    init () {
//        object = User()
//    }
//    
//    func authorise(login: String?) -> User? {
//    
//        let user = User()
//    //    let newProfileData = ProfileHeaderView()
//        if (login != nil) == loginDataBase.contains(login ?? "No data") {
//        
//            
//            return user
//            
//        }
//
//        return nil
//     }
//
//     let loginDataBase: [String] = {
//        var db = [String]()
//         db.append("user1")
//        db.append("user2")
//        return db
//    }()
//
//}
