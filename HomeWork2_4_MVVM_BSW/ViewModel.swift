import Foundation
import ReactiveKit
import Bond

class ViewModel {
    
    let model = Model()
    
    let bag = DisposeBag()
    
    var categoryArray = MutableObservableArray<String>()
    let url = "https://blackstarshop.ru/index.php?route=api/v1/categories"
    
    func configureTableView(tableView: UITableView){
        categoryArray.bind(to: tableView, animated: true, rowAnimation: .fade) { (dataSource, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "bswCell") as! BSWTableViewCell
            cell.categoryLabel.text = dataSource[indexPath.row]
            return cell
        }
        tableView.reactive.selectedRowIndexPath.observeNext { (index) in
            tableView.deselectRow(at: index, animated: true)
        }.dispose(in: bag)
    }
    
    func updateArray(){
        model.fetchDataFromUrl(mutableArrayOfString: categoryArray, urlString: url)
    }
}
