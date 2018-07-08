import UIKit

class CardCell<T:CardCellDataKind>:RoundedCell{
   /**
     * When you set the data diferent UI's are updated
     */
    var data:T? 
}
