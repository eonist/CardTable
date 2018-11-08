import UIKit

class Card{
   let title:String?
   let cellData:[CellDataKind]
   init(title:String?,cellData:[CellDataKind]){
      self.title = title
      self.cellData = cellData
   }
}

