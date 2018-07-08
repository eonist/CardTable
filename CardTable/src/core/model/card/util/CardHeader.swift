import UIKit

class CardHeader:RoundedView{
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
