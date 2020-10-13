//
//  UIDevice+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

extension UIDevice {
    
    private struct InterfaceNames {
        static let wifi = ["en0"]
        static let wired = ["en2", "en3", "en4"]
        static let cellular = ["pdp_ip0", "pdp_ip1", "pdp_ip2", "pdp_ip3"]
        static let supported = wifi + wired + cellular
    }

    var vendorID: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    var deviceType: String {
        
        let type = UIDevice.current.userInterfaceIdiom
        
        switch type {
        case .pad:
            return "iPad"
        case .phone:
            return "iPhone"
        case .carPlay:
            return "CarPlay"
        case .tv:
            return "Apple TV"
        default:
            return "Unknown"
        }
        
    }

    var modelName: String {
        var systemInfo      = utsname()
        uname(&systemInfo)
        let machineMirror   = Mirror(reflecting: systemInfo.machine)
        let identifier      = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
            
        // iPod
        case "iPod1,1":         return "iPod Touch (1 Gen)"
        case "iPod2,1":         return "iPod Touch (2 Gen)"
        case "iPod3,1":         return "iPod Touch (3 Gen)"
        case "iPod4,1":         return "iPod Touch (4 Gen)"
        case "iPod5,1":         return "iPod Touch (5 Gen)"
        case "iPod7,1":         return "iPod Touch (6 Gen)"
        case "iPod9,1":         return "iPod Touch (7 Gen)"
            
        // iPhone
        case "iPhone1,1":       return "iPhone"
        case "iPhone1,2":       return "iPhone 3G"
        case "iPhone2,1":       return "iPhone 3GS"
            
        case "iPhone3,1":       return "iPhone 4"
        case "iPhone3,2":       return "iPhone 4 (GSM Rev A)"
        case "iPhone3,3":       return "iPhone 4 (CDMA)"
        case "iPhone4,1":       return "iPhone 4S"
            
        case "iPhone5,1":       return "iPhone 5 (GSM)"
        case "iPhone5,2":       return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":       return "iPhone 5C (GSM)"
        case "iPhone5,4":       return "iPhone 5C (Global)"
        case "iPhone6,1":       return "iPhone 5S (GSM)"
        case "iPhone6,2":       return "iPhone 5S (Global)"
            
        case "iPhone7,1":       return "iPhone 6 Plus"
        case "iPhone7,2":       return "iPhone 6"
        case "iPhone8,1":       return "iPhone 6S"
        case "iPhone8,2":       return "iPhone 6S Plus"
            
        case "iPhone8,3":       return "iPhone SE(GSM+CDMA)"
        case "iPhone8,4":       return "iPhone SE (GSM)"
            
        case "iPhone9,1":       return "iPhone 7"
        case "iPhone9,2":       return "iPhone 7 Plus"
        case "iPhone9,3":       return "iPhone 7"
        case "iPhone9,4":       return "iPhone 7 Plus"

        case "iPhone10,1":      return "iPhone 8"
        case "iPhone10,2":      return "iPhone 8 Plus"
        case "iPhone10,3":      return "iPhone X (Global)"
        case "iPhone10,4":      return "iPhone 8"
        case "iPhone10,5":      return "iPhone 8 Plus"
        case "iPhone10,6":      return "iPhone X (GSM)"
            
        case "iPhone11,2":      return "iPhone XS"
        case "iPhone11,4":      return "iPhone XS Max (China)"
        case "iPhone11,6":      return "iPhone XS Max (Global)"
            
        case "iPhone11,8":      return "iPhone XR"
            
        case "iPhone12,1":      return "iPhone 11"
        case "iPhone12,3":      return "iPhone 11 Pro"
        case "iPhone12,5":      return "iPhone 11 Pro Max"
            
        case "iPhone12,8":      return "iPhone SE 2nd Gen"
            
        // iPad
        case "iPad1,1":         return "iPad"
        case "iPad1,2":         return "iPad 3G"
            
        case "iPad2,1":         return "iPad 2 Gen"
        case "iPad2,2":         return "iPad 2 Gen (GSM)"
        case "iPad2,3":         return "iPad 2 Gen (CDMA)"
        case "iPad2,4":         return "iPad 2 Gen (New Revision)"
            
        case "iPad3,1":         return "iPad 3 Gen (WiFi)"
        case "iPad3,2":         return "iPad 3 Gen(CDMA)"
        case "iPad3,3":         return "iPad 3 Gen (GSM)"
            
        case "iPad3,4":         return "iPad 4 (WiFi)"
        case "iPad3,5":         return "iPad 4 (GSM+LTE)"
        case "iPad3,6":         return "iPad 4 (CDMA+LTE)"
            
        case "iPad4,1":         return "iPad Air (WiFi)"
        case "iPad4,2":         return "iPad Air (GSM+CDMA)"
        case "iPad4,3":         return "1st Gen iPad Air (China)"
            
        case "iPad4,4":         return "iPad Mini Retina (WiFi)"
        case "iPad4,5":         return "iPad Mini Retina (GSM+CDMA)"
        case "iPad4,6":         return "iPad Mini Retina (China)"
            
        case "iPad4,7":         return "iPad Mini 3 (WiFi)"
        case "iPad4,8":         return "iPad Mini 3 (GSM+CDMA)"
        case "iPad4,9":         return "iPad Mini 3 (China)"
            
        case "iPad5,1":         return "iPad Mini 4 (WiFi)"
        case "iPad5,2":         return "4th Gen iPad mini (WiFi+Cellular)"
            
        case "iPad5,3":         return "iPad Air 2 (WiFi)"
        case "iPad5,4":         return "iPad Air 2 (Cellular)"
            
        case "iPad6,3":         return "iPad Pro (9.7 inch, WiFi)"
        case "iPad6,4":         return "iPad Pro (9.7 inch, WiFi+LTE)"
        case "iPad6,7":         return "iPad Pro (12.9 inch, WiFi)"
        case "iPad6,8":         return "iPad Pro (12.9 inch, WiFi+LTE)"
            
        case "iPad6,11":        return "iPad 5 (WiFi)"
        case "iPad6,12":        return "iPad 5 (GSM+DMA)"
            
        case "iPad7,1":         return "iPad Pro 2 Gen (12.9 Inch) (WiFi)"
        case "iPad7,2":         return "iPad Pro 2 Gen (12.9 Inch) (WiFi+Cellular)"
            
        case "iPad7,3":         return "iPad Pro (10.5 inch, WiFi)"
        case "iPad7,4":         return "iPad Pro (10.5 inch, GSM+CDMA)"
            
        case "iPad2,5":         return "iPad Mini (WiFi)"
        case "iPad2,6":         return "iPad Mini (GSM+LTE)"
        case "iPad2,7":         return "iPad Mini (CDMA+LTE)"
            
        case "iPad7,5":         return "iPad 6th Gen (WiFi)"
        case "iPad7,6":         return "iPad 6th Gen (WiFi+Cellular)"
        case "iPad7,11":        return "iPad 7th Gen 10.2-inch (WiFi)"
        case "iPad7,12":        return "iPad 7th Gen 10.2-inch (WiFi+Cellular)"
            
        case "iPad8,1":         return "iPad Pro 11 inch (WiFi)"
        case "iPad8,2":         return "iPad Pro 11 inch (1TB, WiFi)"
        case "iPad8,3":         return "iPad Pro 11 inch (WiFi+Cellular)"
        case "iPad8,4":         return "iPad Pro 11 inch (1TB, WiFi+Cellular)"
            
        case "iPad8,5":         return "iPad Pro 12.9 inch 3rd Gen (WiFi)"
        case "iPad8,6":         return "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi)"
        case "iPad8,7":         return "iPad Pro 12.9 inch 3rd Gen (WiFi+Cellular)"
        case "iPad8,8":         return "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi+Cellular)"
        case "iPad8,9":         return "iPad Pro 11 inch 2nd Gen (WiFi)"
        case "iPad8,10":        return "iPad Pro 11 inch 2nd Gen (WiFi+Cellular)"
        case "iPad8,11":        return "iPad Pro 12.9 inch 4th Gen (WiFi)"
        case "iPad8,12":        return "iPad Pro 12.9 inch 4th Gen (WiFi+Cellular)"
        
        case "iPad11,1":        return "iPad mini 5th Gen (WiFi)"
        case "iPad11,2":        return "iPad mini 5th Gen"
        case "iPad11,3":        return "iPad Air 3rd Gen (WiFi)"
        case "iPad11,4":        return "iPad Air 3rd Gen"
        case "iPad11,6":        return "iPad 8th Gen"
        case "iPad11,7":        return "iPad 8th Gen"

        // Apple TV
        case "AppleTV1,1":      return "Apple TV (1st Gen)"
        case "AppleTV2,1":      return "Apple TV (2nd Gen)"
        case "AppleTV3,1":      return "Apple TV (3rd Gen)"
        case "AppleTV3,2":      return "Apple TV (3rd Gen)"
        case "AppleTV5,3":      return "Apple TV HD (4th Gen)"
        case "AppleTV6,2":      return "Apple TV 4K"
        
        // Other
        case "AudioAccessory1,1":   return "HomePod"
        case "i386", "x86_64":      return "Simulator"
            
        default:                    return identifier
            
        }
    }

    /// Device Physical Screen Size
    /// Eg. 414.0 x 896.0 for iPhone Pro Max
    var screenSize: String {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        return "\(screenWidth) x \(screenHeight)"
    }

    /// Screen Resolution
    /// Eg. 1242.0 x 2688.0 for iPhone Pro Max

    var screenResolution: String {
        let screenWidth = UIScreen.main.nativeBounds.width
        let screenHeight = UIScreen.main.nativeBounds.height

        return "\(screenWidth) x \(screenHeight)"
    }
    /// Device Diagonally Screen Size in inches
    /// Eg. 6.06 inches for iPhone Pro Max

    var screenSizeDiagonally: String {

        let scale = UIScreen.main.scale
        let ppi = scale * ((UIDevice.current.userInterfaceIdiom == .pad) ? 132 : 163)

        let width = UIScreen.main.bounds.size.width * scale
        let height = UIScreen.main.bounds.size.height * scale

        let horizontal = width / ppi, vertical = height / ppi

        let diagonal = sqrt(pow(horizontal, 2) + pow(vertical, 2))
        return String(format: "%0.2f", diagonal)

    }

    /// Get the IP Address of the wifi/
    func ipAddress() -> String? {
        var ipAddress: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>?

        if getifaddrs(&ifaddr) == 0 {
            var pointer = ifaddr

            while pointer != nil {
                defer { pointer = pointer?.pointee.ifa_next }

                guard
                    let interface = pointer?.pointee,
                    interface.ifa_addr.pointee.sa_family == UInt8(AF_INET) || interface.ifa_addr.pointee.sa_family == UInt8(AF_INET6),
                    let interfaceName = interface.ifa_name,
                    let interfaceNameFormatted = String(cString: interfaceName, encoding: .utf8),
                    InterfaceNames.supported.contains(interfaceNameFormatted)
                    else { continue }

                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))

                getnameinfo(interface.ifa_addr,
                            socklen_t(interface.ifa_addr.pointee.sa_len),
                            &hostname,
                            socklen_t(hostname.count),
                            nil,
                            socklen_t(0),
                            NI_NUMERICHOST)

                guard
                    let formattedIpAddress = String(cString: hostname, encoding: .utf8),
                    !formattedIpAddress.isEmpty
                    else { continue }

                ipAddress = formattedIpAddress
                break
            }

            freeifaddrs(ifaddr)
        }

        return ipAddress
    }
}
