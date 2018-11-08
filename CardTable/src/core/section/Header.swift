import UIKit

/**
 * Header
 */
class Header:Section {
   lazy var headerLabel:UILabel = createHeaderLabel()
   override init(frame: CGRect) {
      super.init(frame: frame)
      _ = headerLabel
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Create
 */
extension Header {
   /**
    * Header label
    */
   func createHeaderLabel() -> UILabel{
      let headerLabel:UILabel = .init(frame: .zero)
      headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
      headerLabel.textColor = .darkGray
      headerLabel.textAlignment = .center
      headerLabel.backgroundColor = .white
      self.addSubview(headerLabel)
      headerLabel.activateConstraint { view in
         let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
         let size = Constraint.size(view, to: self)
         return [anchor.x,anchor.y,size.w,size.h]
      }
      return headerLabel
   }
}

/**
 * Constants
 */
extension Header {
   static let headerHeight:CGFloat = 32
}
