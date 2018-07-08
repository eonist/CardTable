import UIKit

protocol RoundCornerKind :class{
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat)// TODO: ⚠️️ rename to makeRoundCorners
    var radius:CGFloat {get set }
    var corners:UIRectCorner {get set}
}
extension RoundCornerKind where Self:UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.radius = radius
        self.corners = corners
    }
}
