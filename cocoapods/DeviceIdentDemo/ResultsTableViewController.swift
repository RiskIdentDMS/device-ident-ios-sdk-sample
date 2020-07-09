import UIKit

class ResultsTableViewController: UITableViewController{
    @IBOutlet var mainTable: UITableView!
    var token:String = "Not Defined"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTable.register(UITableViewCell.self, forCellReuseIdentifier: "tokenCell")
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tokenCell", for: IndexPath(row: 0, section: 0))
        cell.textLabel?.text = token
        return cell
    }
}
