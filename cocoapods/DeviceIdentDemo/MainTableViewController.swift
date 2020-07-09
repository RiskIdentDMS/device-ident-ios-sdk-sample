import UIKit
import ClientSecurityKit

class MainTableViewController: UITableViewController {
    // Please use the provided SNIPPETID.
    let snippetId = Bundle.main.object(forInfoDictionaryKey: "DeviceIdent_Snippet_Id") as? String

    override func viewDidLoad() {
        super.viewDidLoad()
        print("========")
        print(snippetId)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let token = randomToken()
        switch indexPath {
           
            case IndexPath(row: 0, section: 0):
                // Please use a unique token for every call and a location. Please refer to the documentation for further information.
                testDeviceIdentSDK(token: token, snippetId: snippetId, location:"<LOCATION>")
            default: break
        }
    }
    
    func randomToken() -> String {
        return NSUUID().uuidString
    }
    
   
    func testDeviceIdentSDK(token: String!, snippetId: String!, location: String?) {
        if let resultPage = storyboard?.instantiateViewController(withIdentifier: "ResultsTableViewController") as? ResultsTableViewController{
            resultPage.token = token
            navigationController?.pushViewController(resultPage, animated: true)
            _ = ClientSecurityModule(snippetId: snippetId, token: token, location: location, view: self.view)
            
        }
        

        
    }
}

