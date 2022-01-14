//
//  Post.swift
//  firebaseDemo
//
//  Created by user on 20/12/2021.
//

import Foundation
import Firebase
struct Post {
    var id = ""
    var title = ""
    var description = ""
 //   var imageUrl = ""
    var user:User
    var createdAt:Timestamp?
    
}
