import UIKit

class Table:UITableView {
    let sections:[Card]/*Card is the same as section*/
    init(sections:[Card],frame: CGRect, style: UITableViewStyle){
        self.sections = sections
        super.init(frame: frame, style: style)
        registerCells()/*Registers Cell types*/
        self.dataSource = self
        self.delegate = self
        self.separatorStyle = .none
        /*Removes space between sections*/
        self.sectionHeaderHeight = 0
        self.sectionFooterHeight = 0
        self.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
        self.tableFooterView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}

