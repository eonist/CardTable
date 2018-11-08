import UIKit

class BottomCardCell:CardCell<BottomCardCellData>{
   lazy var contentLable:UILabel = createContentLabel()
    /**
     * When you set the data different UI's are updated
     */
    override var data: BottomCardCellData?{
        didSet {
            guard let data:BottomCardCellData = data else {fatalError("data not avaiable")}
            contentLable.text = data.content
         self.contentView.backgroundColor = BottomCardCell.backgroundColor
        }
    }
}
/**
 * Create
 */
extension BottomCardCell{
   /**
    * Creates TitleLabel
    */
   func createContentLabel() -> UILabel{
      let label:UILabel = {
           let label:UILabel = .init()//.init(frame: rect)
           label.text = "Title"
           label.font = UIFont.boldSystemFont(ofSize: 20.0)
           label.textColor = .black
           label.textAlignment = .center
//           label.backgroundColor = BottomCardCell.backgroundColor
           self.contentView.addSubview(label)
           return label
      }()
      label.activateConstraint { label in
         let top = Constraint.anchor(label, to: self.contentView, align: .top, alignTo: .top, offset:/*ThumbCell.margin.y+*/ Margin.vertical)
         let bottom = Constraint.anchor(label, to: self.contentView, align: .bottom, alignTo: .bottom, offset:/*ThumbCell.margin.y+*/ -Margin.vertical)
         let left = Constraint.anchor(label, to: self.contentView, align: .left, alignTo: .left, offset:/*ThumbCell.margin.x+*/ Margin.horizontal)
         let right = Constraint.anchor(label, to: self.contentView, align: .right, alignTo: .right, offset: -Margin.horizontal)//possibly add some negative margin here
//         let h = Constraint.height(label, to: self.contentView, multiplier: 1)
         return [left,/*,right*/right,top,bottom]
      }
      return label
   }
}
/**
 * Constants
 */
extension BottomCardCell{
   static let cellHeight:CGFloat = 48
   static let cellReuseIdendifier:String = "\(BottomCardCell.self)"
   static let backgroundColor:UIColor = Constants.Colors.blue.uiColor
   enum Margin{
      static let horizontal:CGFloat = 12
      static let vertical:CGFloat = 12
      static let verticalSpaceBetween:CGFloat = 4
   }
}
