//
//  UIApplication+Extensions.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

public extension UIApplication {

    func documentsDirectoryURL() -> NSURL {
        
        return  try! NSFileManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
    }
    
    func cachesDirectoryURL() -> NSURL {

        return try! NSFileManager().URLForDirectory(.CachesDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
    }

    func downloadsDirectoryURL() -> NSURL {
        
        return try! NSFileManager().URLForDirectory(.DownloadsDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
    }
    
    func libraryDirectoryURL() -> NSURL {
        
        return try! NSFileManager().URLForDirectory(.LibraryDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
    }

    func applicationSupportDirectoryURL() -> NSURL {
        
        return try! NSFileManager().URLForDirectory(.ApplicationSupportDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
    }

}