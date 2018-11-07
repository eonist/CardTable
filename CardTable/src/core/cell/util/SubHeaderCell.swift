import UIKit

//class SubHeaderCell:UITableViewCell {
class SubHeaderCell:CardCell<SubHeaderCellData>{
   /**
    * When you set the data different UI's are updated
    */
   override var data: SubHeaderCellData?{
      didSet {
         guard let data:SubHeaderCellData = data else {fatalError("data not avaiable")}
         //         let content:String = data.content.reduce(""){$0 + "\($1)/n"}//adds line breaks for each paragraph
         //         contentLable.text = content
         
      }
   }
   /**
    * Init
    */
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      self.selectionStyle = .none/*disables the selection highlighting*/
      self.backgroundColor = .white
      textLabel?.text = "SubHeader"
      textLabel?.textColor = .gray
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Constants
 */
extension SubHeaderCell{
   static let cellHeight:CGFloat = 24
   static let cellReuseIdendifier:String = "\(SubHeaderCell.self)"
}

