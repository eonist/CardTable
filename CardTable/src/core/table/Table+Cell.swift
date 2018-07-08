import UIKit
/**
 *
 */
extension Table:UITableViewDelegate,UITableViewDataSource{
   /**
    * Returns row count in a section
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cellData.count
    }
    /**
     * Creates/Recycles cells
     * TODO: ⚠️️ upgrade the rounded corners with if case pattern recognition
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section:Card = sections[indexPath.section]
        let data:CellDataKind = section.cellData[indexPath.row]
//        let storyTitle:String = data.title//sections[indexPath.section].data[indexPath.row].title
        
        var cell:RoundedCell = {
            if data is MiddleCardCellData  {
                guard let cell:MiddleCardCell = tableView.dequeueReusableCell(withIdentifier: MiddleCardCell.cellReuseIdendifier, for: indexPath as IndexPath) as? MiddleCardCell else {fatalError("err")}//guard let cell:StoryTableCell = tableView.dequeueReusableCell(withIdentifier: StoryTableCell.cellIdentifier, for: indexPath as IndexPath) as? StoryTableCell else {fatalError("err")}
                cell.data = data as? MiddleCardCellData
                return cell as CardCell
            }else if data is TopCardCellData{
                guard let cell:TopCardCell = tableView.dequeueReusableCell(withIdentifier: TopCardCell.cellReuseIdendifier, for: indexPath as IndexPath) as? TopCardCell else {fatalError("err")}
                cell.data = data as? TopCardCellData
                return cell as CardCell
            }else{/*BottomCardCellData*/
                guard let cell:BottomCardCell = tableView.dequeueReusableCell(withIdentifier: BottomCardCell.cellReuseIdendifier, for: indexPath as IndexPath) as? BottomCardCell else {fatalError("err")}
                cell.data = data as? BottomCardCellData
                return cell as CardCell
            }
        }()
        Roundifier.roundify(cell:&cell,indexPath:indexPath,sections:self.sections)/*Rounds the correct corners*/
        return cell
    }
    /**
     * Returns the height of each cell
     * TODO: ⚠️️ put cellHeight into something overridable and remov the if else clauses
     */
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         let cardCellData:CellDataKind = sections[indexPath.section].cellData[indexPath.row]
         if cardCellData is MiddleCardCellData  {
              return MiddleCardCell.cellHeight
         }else if cardCellData is TopCardCellData{
              return TopCardCell.cellHeight
         }else if cardCellData is BottomCardCellData {
              return BottomCardCell.cellHeight
         }else {
            fatalError("should not be possible")
        }
//         else if cardCellData is SubHeaderCell {
//              return SubHeaderCell.cellHeight
//         }
      }
    /**
     * Registers the different Cell types to be used in the table
     */
    func registerCells(){
        self.register(MiddleCardCell.self, forCellReuseIdentifier: MiddleCardCell.cellReuseIdendifier)
        self.register(TopCardCell.self, forCellReuseIdentifier: TopCardCell.cellReuseIdendifier)
        self.register(BottomCardCell.self, forCellReuseIdentifier: BottomCardCell.cellReuseIdendifier)
//        self.register(SubHeaderCell.self, forCellReuseIdentifier: SubHeaderCell.cellReuseIdendifier)
    }
}
