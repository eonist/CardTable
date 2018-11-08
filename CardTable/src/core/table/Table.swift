import UIKit

class Table:UITableView {
    let sections:[Card]/*Card is the same as section*/
    init(sections:[Card],frame: CGRect, style: UITableViewStyle){
        self.sections = sections
        super.init(frame: frame, style: style)
        registerCells()/*Registers Cell types*/
        self.dataSource = self
        self.delegate = self
        self.separatorStyle = .none
        /*Removes space between sections*/
        self.sectionHeaderHeight = 0
        self.sectionFooterHeight = 0
        self.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
        self.tableFooterView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
        /*Style*/
        self.backgroundColor = .black
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}

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
   enum CardColors{
      static let top:UIColor = Colors.purple.uiColor
      static let middle:UIColor = Colors.limeGreen.uiColor
      static let bottom:UIColor = Colors.blue.uiColor
   }
}
