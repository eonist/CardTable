

import Foundation

/**
 * TIPS: Access all colors via: Constants.Colors.allCases
 * EXAMPLE: Constants.Colors.allCases[1]//UIColor.yellow
 * EXAMPLE: Constants.Colors.red//UIColor.red
 */
class Constants{
   enum Colors:String,CaseIterable{
      case blue = "4A90E2", purple = "BD10E0", turqois = "50E3C2", limeGreen = "B8E986"
      var uiColor:UIColor {
         return UIColor.init(hex: self.rawValue)
      }
   }
}


import UIKit.UIColor

extension UIColor {
   /**
    * EXAMPLE: let color = UIColor(hex: "ff0000")
    */
   convenience init(hex: String) {
      let scanner = Scanner(string: hex)
      scanner.scanLocation = 0
      var rgbValue: UInt64 = 0
      scanner.scanHexInt64(&rgbValue)
      let r = (rgbValue & 0xff0000) >> 16
      let g = (rgbValue & 0xff00) >> 8
      let b = rgbValue & 0xff
      self.init(
         red: CGFloat(r) / 0xff,
         green: CGFloat(g) / 0xff,
         blue: CGFloat(b) / 0xff, alpha: 1
      )
   }
}
