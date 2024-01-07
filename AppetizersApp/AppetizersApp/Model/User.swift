//
//  User.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 05/01/24.
//

import Foundation
struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate  = Date()
    var extraNapkins = false
    var frequentRefills = false
}
