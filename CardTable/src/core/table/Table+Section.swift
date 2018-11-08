import UIKit
/**
 * Table + Section
 */
extension Table {
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
        return Card.cardHeaderHeight
    }
   /**
    * Returns a Header UIView for section index
    * NOTE: this is a quick hack, do this with dequeueReusableHeaderFooterView etc,
    */
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    //Continue here: 🏀 
        //find header etc
    
      let headerView = Header.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.size.width, height: 40))
      headerView.headerLabel?.text = self.tableView(self, titleForHeaderInSection: section)
      //sets the correct roundcorners
      if section == 0 && (sections[0].cellData.count > 0 && sections[0].title != ""){
           headerView.corners = [.topLeft,.topRight]
      }else {
           headerView.corners = []
      }
      return headerView
  }
  /**
   * Returns a Footer UIView for section index
   */
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
      let footerView = RoundedView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.size.width, height: 40))
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
