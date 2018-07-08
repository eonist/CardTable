import UIKit

class Roundifier{
   /**
    * //TODO: ⚠️️ make enum if else with this: isBottom(idxPath,sections), isTop(), and then just else
    */
    static func roundify( cell:inout RoundedCell,indexPath:IndexPath,sections:[Card]) {
      switch true {
      case isTop(indexPath:indexPath,sections:sections) :
         cell.roundCorners([.topLeft, .topRight], radius: 10)
      case isBottom(indexPath:indexPath,sections:sections) :
         cell.roundCorners([.bottomLeft, .bottomRight], radius: 10)
      default :/*all other cases*/
         cell.roundCorners([], radius: 0)
      }
   }
   private static func isTop(indexPath:IndexPath,sections:[Card]) -> Bool{
      let isFirstRowInSection:Bool = /*indexPath.section == 0 &&*/ indexPath.row == 0//(sections[indexPath.section].data.count == 0 || sections[indexPath.section].key == .none
      return isFirstRowInSection
   }
   private static func isBottom(indexPath:IndexPath,sections:[Card]) -> Bool{
      let isLastRowInSection:Bool = indexPath.row == sections[indexPath.section].cellData.count-1
      return isLastRowInSection
   }
}
