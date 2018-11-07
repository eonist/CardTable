import UIKit

extension Table {
   /**
    * Header
    */
   class Header:Section {
      var headerLabel:UILabel?
      override init(frame: CGRect) {
         super.init(frame: frame)
         headerLabel = .init(frame: CGRect(x: 0, y: 0, width:frame.size.width, height: frame.height))
         headerLabel?.font = .systemFont(ofSize: 12)
         headerLabel?.textColor = .black
         headerLabel?.textAlignment = .center
         self.addSubview(headerLabel!)
      }
      required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
      }
   }
}
/**
 * Section
 */
extension Table {
   /**
    * Used for Header & Section
    */
   class Section:UIView,RoundCornerKind{
      static var headerHeight:CGFloat = 40
      var radius:CGFloat = 10
      var corners:UIRectCorner = []
      override init(frame: CGRect) {
         super.init(frame: frame)
         self.backgroundColor = .white
      }
      required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
      }
      /**
       * If you're using Auto Layout, you'll need to subclass your UIView and call roundCorners in the view's layoutSubviews for optimal effect.
       */
      override func layoutSubviews() {
         super.layoutSubviews()
         //self.textLabel?.frame = CGRect(x:0,y:0,width:100,height:40)
         self.roundCorners(corners, radius: radius)
      }
   }
}
