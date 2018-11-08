import UIKit

class MiddleCardCell:CardCell<MiddleCardCellData>{
   lazy var dateLabel:UILabel = createDateLabel()
   lazy var contentLable:UITextView = createContentLabel()
   lazy var titleLabel:UILabel = createTitleLabel()
   /**
    * When you set the data different UI's are updated
    */
   override var data: MiddleCardCellData?{
      didSet {
         Swift.print("MiddleCardCellData.data (set)")
         guard let data:MiddleCardCellData = data else {fatalError("data not avaiable")}
         dateLabel.text = data.date
         titleLabel.text = data.title
         contentLable.text = data.content
         
//         textLabel?.text = "middlecardcell"
         self.contentView.backgroundColor = MiddleCardCell.backgroundColor
      }
   }
   /**
    * Boilerplate
    */
//   required init?(coder aDecoder: NSCoder) {
//      fatalError("init(coder:) has not been implemented")
//   }
}

/**
 * Create
 */
extension MiddleCardCell{
   /**
    * Date
    */
   func createDateLabel() -> UILabel {
      let label:UILabel = {
         let label:UILabel = .init()//.init(frame: rect)
         label.text = "date"
         label.font = UIFont.boldSystemFont(ofSize: 16.0)
         label.textColor = .black
//         label.backgroundColor = .orange
         label.textAlignment = .right
         self.contentView.addSubview(label)
         label.backgroundColor = .clear
//         label.layer.borderWidth = 0.5
//         label.layer.borderColor = UIColor.black.cgColor
         return label
      }()
      label.activateConstraint { label in
         let top = Constraint.anchor(label, to: self.contentView, align: .top, alignTo: .top, offset:Margin.vertical)
         //         let left = Constraint.anchor(label, to: self.contentView, align: .left, alignTo: .left, offset:4)
         let right = Constraint.anchor(label, to: self.contentView, align: .right, alignTo: .right, offset:-Margin.horizontal)//possibly add some negative margin here
//         let h = Constraint.height(label, to: self.contentView, offset: 0, multiplier: 0.5)
         let h = Constraint.height(label, height: 32)
         let w = Constraint.width(label, width: 96)
         return [right,top,w,h]
      }
      return label
   }
   /**
    * Creates TitleLabel
    */
   func createContentLabel() -> UITextView{
      let label:UITextView = {
         let textField = UITextView.init()
         textField.text = "Testing"
         self.contentView.addSubview(textField)
         textField.textColor = .black
         textField.textAlignment = .left
         textField.backgroundColor = .clear
//         textField.layer.borderWidth = 0.5
//         textField.layer.borderColor = UIColor.black.cgColor
         textField.font = .boldSystemFont(ofSize: 14)
         return textField
      }()
      
      //      let label:UILabel = {
      //         let label:UILabel = .init()//.init(frame: rect)
      //         label.text = "Title"
      //         label.font = UIFont.boldSystemFont(ofSize: 14.0)
      //         label.textColor = .black
      //         label.backgroundColor = .orange
      //         self.contentView.addSubview(label)
      //         label.backgroundColor = .red
      //         return label
      //      }()
      label.activateConstraint { label in
         let top = Constraint.anchor(label, to: self.titleLabel, align: .top, alignTo: .bottom, offset:Margin.verticalSpaceBetween)
         let bottom = Constraint.anchor(label, to: self.contentView, align: .bottom, alignTo: .bottom, offset:-Margin.vertical)
         let left = Constraint.anchor(label, to: self.contentView, align: .left, alignTo: .left, offset:Margin.horizontal)
         let right = Constraint.anchor(label, to: self.contentView, align: .right, alignTo: .right, offset:-Margin.horizontal)//possibly add some negative margin here
         //let h = Constraint.height(label, height: 24)//(label, to: self.contentView, offset: 0, multiplier: 0.5)
         return [left,right,top,bottom]
      }
      return label
   }
   /**
    * Title
    */
   func createTitleLabel() -> UILabel {
      let label:UILabel = {
         let label:UILabel = .init()//.init(frame: rect)
         label.text = "title"
         label.font = .boldSystemFont(ofSize: 20.0)
         label.textColor = .black
         label.backgroundColor = .orange
         label.textAlignment = .left
         self.contentView.addSubview(label)
         label.backgroundColor = .clear
//         label.layer.borderWidth = 0.5
//         label.layer.borderColor = UIColor.black.cgColor
         return label
      }()
      label.activateConstraint { label in
         let top = Constraint.anchor(label, to: self.contentView, align: .top, alignTo: .top, offset:Margin.vertical)
         let left = Constraint.anchor(label, to: self.contentView, align: .left, alignTo: .left, offset:Margin.horizontal)
         let right = Constraint.anchor(label, to: dateLabel, align: .right, alignTo: .left, offset:Margin.verticalSpaceBetween)//possibly add some negative margin here
//         let h = Constraint.height(label, to: self.contentView, multiplier: 0.5)
         let h = Constraint.height(label, height: 32)
         return [left,right,top,h]
      }
      return label
   }
   
}
/**
 * Constants
 */
extension MiddleCardCell{
   static let backgroundColor:UIColor = Constants.CardColors.middle
   static let cellHeight:CGFloat = 124
   static let cellReuseIdendifier:String = "\(MiddleCardCell.self)"
   enum Margin{
      static let horizontal:CGFloat = 12
      static let vertical:CGFloat = 12
      static let verticalSpaceBetween:CGFloat = 4
   }
}
