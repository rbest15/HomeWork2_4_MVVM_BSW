import UIKit


class ViewController: UIViewController {
    
    let viewModel = ViewModel()

    @IBOutlet weak var categoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configureTableView(tableView: categoryTableView)
        viewModel.updateArray()
    }
}

