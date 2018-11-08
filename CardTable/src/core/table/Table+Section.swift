import UIKit
/**
 * Table + Section
 */
extension Table {
   /**
    *
    */
   func numberOfSections(in tableView: UITableView) -> Int {
      return sections.count
   }
   /**
    * Returns title for the section
    */
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return sections[section].title /*.uppercased()*/
   }
   /**
    * Returns the correct section header height
    */
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      //TODO: ⚠️️ make enum if else with this: isBottom(idxPath,sections), isTop(), and then just else
      let card:Card = sections[section]
      if card.title == nil{//if title is nil then we use no header
         return 0
      }else{
         return Header.headerHeight
      }
   }
   func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
      let card:Card = sections[section]
      if card.cellData.count == 1{//if title is nil then we use no header
         return 0
      } else {
         return Footer.footerHeight
      }
   }
   /**
    * Returns a Header UIView for section index
    * NOTE: this is a quick hack, do this with dequeueReusableHeaderFooterView etc,
    */
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let headerView = Header.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.size.width, height: 40))
      headerView.headerLabel.text = self.tableView(self, titleForHeaderInSection: section)
      let card:Card = sections[section]
      //Swift.print("card.title:  \(card.title)")
      //sets the correct roundcorners
      if card.title == nil{//if title is nil then we use no header
         return nil
      } else if (card.cellData.count > 0 && card.title != ""){
         headerView.corners = [.topLeft,.topRight]
      } else {
         headerView.corners = []
      }
      /*Set colors*/
      if card is TopCard{
         headerView.backgroundColor = Constants.CardColors.top
      }else if card is MiddleCard{
         headerView.backgroundColor = Constants.CardColors.middle
      }else if card is BottomCard {
         headerView.backgroundColor = Constants.CardColors.bottom
      }
      return headerView
   }
   /**
    * Returns a Footer UIView for section index
    */
   func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
      let footerView = Footer.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.size.width, height: 40))
      //footerView.backgroundColor = .green
      //set the correct roundcorners
      let card:Card = sections[section]
      if card is MiddleCard && TableUtil.bottomSpace(table:self) > 0{
         footerView.corners = [.bottomLeft,.bottomRight]
      }else {
         footerView.corners = []
      }
      return footerView
   }
}

