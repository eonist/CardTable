import UIKit



//add margins to things ✅
//add margins to card
//Disable sticky ✅
//different BG-color
   //find cool colors,that instagram post??
//check notepad
//add carthage
//add bottom card 
//make the cardlib open
//fix topcard
//Fix problem if there is only one top card, it should get top and bottom rounded
//fix problem if topcard has section header, then drop rounded top for next item

class ViewController: UIViewController {
   lazy var tableView:Table = createTable()
    override func viewDidLoad() {
        super.viewDidLoad()
        Swift.print("ViewController.init()")
        /*UI*/
        self.view.backgroundColor = .brown
        _ = tableView
    }
}
/**
 * Create
 */
extension ViewController{
   /**
    * Creates tableview
    */
   func createTable() -> Table {
      let cards:[Card] = createCards()
      let table:Table = Table.init(sections:cards, frame: self.view.bounds, style: .grouped)
      //TODO:⚠️️ use constraints
      view.addSubview(table)
      return table
   }
   /**
    * Creates card model
    */
   private func createCards() -> [Card]{
      /*Header*/
      let topCard:TopCard = {
         let theVerge = TopCardCellData.init(content:["The Verge - IPhoneX review"])
         let suggested = TopCardCellData.init(content:["Wired - AI predicts the future"])
         let card = TopCard(title:"Suggested",cellData:[theVerge,suggested])
         return card
      }()
      /*Content*/
      let middleCard:MiddleCard = {
         let nyTimes = MiddleCardCellData.init(title:"The future is Zero emmition",content: "Long awaiated gov ruling in the whitehouse...", date: "2H ago")
         let treehugger = MiddleCardCellData.init(title:"Artic solar panels", content: "Norway invents the first solar panels to...", date: "4H ago")
         let gizmodo = MiddleCardCellData.init(title:"Explosion of AI-apps in the app store",content:"Investment in AI-apps are soaring as tech embrace our...", date: "6H ago")
         /*Inserts subHeader*/
         let youAreAllCaughtUp = SubHeaderCellData.init(title:"Your all caught up")
         let financialTimes = MiddleCardCellData.init(title:"Mynamar sees new investments",content:"The asian country sees new opertiunities as investors flok to the...", date: "8H ago")
         let card = MiddleCard(title:"Subscribed",cellData:[nyTimes,treehugger,gizmodo,youAreAllCaughtUp,financialTimes])
         return card
      }()
      /*Footer*/
      let bottomCard:BottomCard = {
         let loadMore = BottomCardCellData.init(content:"Load more...")
         let card = BottomCard(title:nil,cellData:[loadMore])//if title is nil then we use no header
         return card
      }()
      return [topCard, middleCard, bottomCard]
   }
}


