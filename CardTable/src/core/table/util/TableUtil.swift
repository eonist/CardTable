import UIKit

class TableUtil {
   /**
    * Calculates if there is empty space at the bottom
    * IMPORTANT: ⚠️️ in the heightForRowAt class, don't use cellForRow, as the cell isn't made yet, probably shouldn't put cellForRow in that method anyways
    */
   static func bottomSpace(table:Table) -> CGFloat{
       let totalContentHeight:CGFloat = {
           let heightOfAllRows:CGFloat = table.sections.enumerated().map { arg -> [(section:Int,row:Int)] in
              return arg.element.cellData.indices.map{ i in return (section:arg.offset,row:i)}
              }.flatMap{$0}.reduce(0){
                   return $0 + table.tableView(table, heightForRowAt: .init(row: $1.row, section: $1.section))
           }
           let heightOfAllHeaders:CGFloat = table.sections.indices.reduce(0){ $0 + table.tableView(table, heightForHeaderInSection: $1) }
           return heightOfAllRows + heightOfAllHeaders
       }()
       let bottomSpace:CGFloat = table.bounds.size.height - UIApplication.shared.statusBarFrame.height /*- TopBar.topBarHeight*/ - totalContentHeight
 //        Swift.print("bottomSpace:  \(bottomSpace)")
       return bottomSpace
   }
}
