import UIKit

extension Table {
    /**
     * When an item is tapped
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Swift.print("Tapped idx: \(indexPath.row)")
        let cellData:CellDataKind = sections[indexPath.section].cellData[indexPath.row]
        if let middleCardCellData = cellData as? MiddleCardCellData {
            DispatchQueue.main.async {
                _ = middleCardCellData
                //transition NavController to new UIViewController etc
            }
        }else if let topCardCellData = cellData as? TopCardCellData{
            DispatchQueue.main.async {
                _ = topCardCellData
                //transition NavController to new UIViewController etc
            }
        }
    }
}

