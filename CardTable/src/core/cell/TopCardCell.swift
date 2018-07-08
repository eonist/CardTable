import UIKit

class TopCardCell:CardCell<TopCardCellData>{
   lazy var contentLable:UILabel = createContentLabel()
   /**
     * When you set the data different UI's are updated
     */
    override var data: TopCardCellData?{
        didSet {
            guard let data:TopCardCellData = data else {fatalError("data not avaiable")}
            let content:String = data.content.reduce(""){$0 + "\($1)/n"}//adds line breaks for each paragraph
            contentLable.text = content
        }
    }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension TopCardCell{
   static let cellHeight:CGFloat = 24
    static let cellReuseIdendifier:String = "\(TopCardCell.self)"
}


extension TopCardCell{
   /**
    * Creates TitleLabel
    */
   func createContentLabel() -> UILabel{
      let label:UILabel = {
           let label:UILabel = .init()//.init(frame: rect)
           label.text = "Title"
           label.font = .boldSystemFont(ofSize: 20.0)
           label.textColor = .darkGray
           //        label.backgroundColor = .green
           self.contentView.addSubview(label)
           return label
      }()
      label.activateConstraint { label in
           let top = Constraint.anchor(label, to: self.contentView, align: .top, alignTo: .top, offset:0+4)
           let left = Constraint.anchor(label, to: self.contentView, align: .left, alignTo: .right, offset:0+4)
           let right = Constraint.anchor(label, to: self.contentView, align: .right, alignTo: .right, offset:0)//possibly add some negative margin here
           let h = Constraint.height(label, to:self.contentView , multiplier:  0.5)
           return [left,right,top,h]
      }
      return label
   }
}
