//
//  PersonNameComponents.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 21/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import Foundation

public extension PersonNameComponents {
  var fullName: String {
    return [givenName, middleName, familyName].compactMap{ $0 }.joined(separator: " ")
  }

  var fullNameWithSuffix: String {
    return [givenName, middleName, familyName, nameSuffix].compactMap{ $0 }.joined(separator: " ")
  }

  var initials: String {
    let firstName = givenName?.first ?? Character(" ")
    let lastName = familyName?.first ?? Character(" ")
    return "\(firstName)\(lastName)".trimmingCharacters(in: .whitespaces)
  }

  // Note: If You need first, middle, last
  /*
  var initials: String {
    let firstName = givenName?.first ?? Character(" ")
    let middleName = middleName?.first ?? Character(" ")
    let lastName = familyName?.first ?? Character(" ")
    return "\(firstName)\(middleName)\(lastName)".trimmingCharacters(in: .whitespaces)
  }
  */
}
