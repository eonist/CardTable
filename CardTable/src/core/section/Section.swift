import UIKit

/**
 * Section (Used for Header & Section)
 */
class Section:UIView,RoundCornerKind{
   var radius:CGFloat = 10
   var corners:UIRectCorner = []
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .clear
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
