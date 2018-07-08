import UIKit

class RoundedCell:UITableViewCell,RoundCornerKind {
    var radius:CGFloat = 10 // TODO; ⚠️️ This could probably be a let or even a static
    var corners:UIRectCorner = []/*Stores the roundCorner types*/
    /**
     * Init
     */
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none/*disables the selection highlighting*/
//        self.backgroundColor = .white
    }
    /**
     * NOTE: If you're using Auto Layout, you'll need to subclass your UIView and call roundCorners in the view's layoutSubviews for optimal effect.
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(corners, radius: radius)
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}