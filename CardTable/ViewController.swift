import UIKit



//add margins to things 👈
//Disable sticky ✅
//different BG-color
//Check readme
   //add todo
//add cool colors, that instagram post??
//check notepad
//add carthage
//add bottom card
//make the cardlib open
//fix topcard


class ViewController: UIViewController {
   lazy var tableView:Table = createTable()
    override func viewDidLoad() {
        super.viewDidLoad()
        Swift.print("ViewController.init()")
        /*UI*/
        self.view.backgroundColor = .cyan
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
         let suggested = TopCardCellData.init(content:["The Verge - IPhoneX review","Wired - AI predicts the future"])
         let card = TopCard(title:"Suggested",cellData:[suggested])
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
         let card = MiddleCard(title:"Following",cellData:[nyTimes,treehugger,gizmodo,youAreAllCaughtUp,financialTimes])
         return card
      }()
      /*Footer*/
      let bottomCard:BottomCard = {
         let loadMore = BottomCardCellData.init(content:"Load more...")
         let card = BottomCard(title:nil,cellData:[loadMore])
         return card
      }()
      return [topCard,middleCard/*bottomCard*/]
   }
}


