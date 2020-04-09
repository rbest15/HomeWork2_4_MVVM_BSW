import Foundation
import ReactiveKit
import Bond
import Alamofire

class Model {
    
    func fetchDataFromUrl(mutableArrayOfString: MutableObservableArray<String>,urlString: String){
        
        AF.request(urlString).validate().responseJSON { (response) in
            let categories = try? JSONDecoder().decode( [String: CategoryDecode].self, from: response.data!)
            for cats in categories! {
                mutableArrayOfString.append(cats.value.name)
            }
        }
    }
}

struct CategoryDecode: Decodable {
    var name = ""
}
