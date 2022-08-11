
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let currentCountry = countries[indexPath.row]
        cell.subTitleLbl.text = currentCountry.name
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let moreDetails = storyboard.instantiateViewController(withIdentifier: "moreDetails")
        if let detail =  moreDetails as? MoreDetails {
            detail.country = getCountry(at: indexPath.row)
        }
        return cell
    }
    
    func getCountry(at index: Int) -> Country{
        countries[index]
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 70
    }

    
    @IBOutlet weak var listTableView: UITableView!
    
    var countries = [Country]() {
        didSet {
            self.listTableView.reloadData()
            
        }
    }
    
    var networService = NetworkService.shared
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listTableView.delegate = self
        listTableView.dataSource = self
        searchBar.delegate = self
        
        networService.getCountries { allCountries in
            self.countries = allCountries
        }
        
    }
    
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var filteredData = [Country]()
        
        for country in countries{
            if(country.name.uppercased().contains(searchText.uppercased())){
                filteredData.append(country)
                countries = filteredData
            }
            
            else if(!country.name.uppercased().contains(searchText.uppercased())){
                countries = filteredData
            }
            
        }
        
            self.listTableView.reloadData()
                
    }
}
