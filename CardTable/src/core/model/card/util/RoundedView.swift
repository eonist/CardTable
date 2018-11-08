import UIKit
/**
 * Used for Header and footer
 */
class RoundedView:UIView,RoundCornerKind{
    static var headerHeight:CGFloat = 40
    var radius:CGFloat = 10
    var corners:UIRectCorner = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    /**
     * NOTE: If you're using Auto Layout,  you'll need to subclass your UIView and call roundCorners in the view's layoutSubviews for optimal effect.
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        //            self.textLabel?.frame = CGRect(x:0,y:0,width:100,height:40)
        self.roundCorners(corners, radius: radius)
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
