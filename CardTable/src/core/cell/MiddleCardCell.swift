import UIKit

class MiddleCardCell:CardCell<MiddleCardCellData>{
   lazy var dateLabel:UILabel = createDateLabel()
   lazy var contentLable:UILabel = createContentLabel()
   lazy var titleLabel:UILabel = createTitleLabel()
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        _ = dateLabel
        _ = contentLable
        _ = titleLabel
    }
   /**
     * When you set the data different UI's are updated
     */
    override var data: MiddleCardCellData?{
        didSet {
            guard let data:MiddleCardCellData = data else {fatalError("data not avaiable")}
            dateLabel.text = data.date
            contentLable.text = data.content
            titleLabel.text = data.title
        }
    }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension MiddleCardCell{
   static let cellHeight:CGFloat = 40
    static let cellReuseIdendifier:String = "\(TopCardCell.self)"
}


extension MiddleCardCell{
   /**
    * Creates TitleLabel
    */
   func createContentLabel() -> UILabel{
      let label:UILabel = {
           let label:UILabel = .init()//.init(frame: rect)
           label.text = "Title"
           label.font = UIFont.boldSystemFont(ofSize: 20.0)
           label.textColor = .darkGray
           //label.backgroundColor = .green
           self.contentView.addSubview(label)
           return label
      }()
      label.activateConstraint { label in
           let top = Constraint.anchor(label, to: self.contentView, align: .top, alignTo: .top, offset:4)
           let left = Constraint.anchor(label, to: self.dateLabel, align: .left, alignTo: .right, offset:4)
           let right = Constraint.anchor(label, to: self.contentView, align: .right, alignTo: .right, offset:0)//possibly add some negative margin here
           let h = Constraint.height(label, to: self.dateLabel, offset: 0, multiplier: 0.5)
           return [left,right,top,h]
      }
      return label
   }
    /**
     * Title
     */
   func createTitleLabel() -> UILabel {
      return UILabel()
   }
    /**
     * Date
     */
   func createDateLabel() -> UILabel {
      return UILabel()
   }
}
