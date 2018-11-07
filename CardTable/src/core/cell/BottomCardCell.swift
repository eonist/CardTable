import UIKit

class BottomCardCell:CardCell<BottomCardCellData>{
   lazy var contentLable:UILabel = createContentLabel()
   /**
    * Notes: This will NOT get called unless you call "registerClass, forCellReuseIdentifier" on your tableview
    */
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /*initiate UI's*/
        _ = contentLable
    }
    /**
     * When you set the data different UI's are updated
     */
    override var data: BottomCardCellData?{
        didSet {
            guard let data:BottomCardCellData = data else {fatalError("data not avaiable")}
            contentLable.text = data.content
        }
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
extension BottomCardCell{
   static let cellHeight:CGFloat = 24
   static let cellReuseIdendifier:String = "\(BottomCardCell.self)"
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
           label.textColor = .darkGray
           label.textAlignment = .center
           label.backgroundColor = .purple
           self.contentView.addSubview(label)
           return label
      }()
      label.activateConstraint { label in
         let top = Constraint.anchor(label, to: self.contentView, align: .top, alignTo: .top, offset:/*ThumbCell.margin.y+*/ 4)
         let left = Constraint.anchor(label, to: self.contentView, align: .left, alignTo: .right, offset:/*ThumbCell.margin.x+*/ 4)
         let right = Constraint.anchor(label, to: self.contentView, align: .right, alignTo: .left, offset:0)//possibly add some negative margin here
         let h = Constraint.height(label, to: self.contentView, multiplier: 0.5)
         return [left,/*,right*/right,top,h]
      }
      return label
   }
}
