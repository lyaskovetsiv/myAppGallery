import UIKit

class FriendsViewController: UIViewController {
    
    let cellID = "FriendsTableViewCell"
    let modelFriends = ModelFriends()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelFriends.users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! FriendsTableViewCell
        cell.friendsName.text = modelFriends.users[indexPath.row].name
        cell.friendImage.image = modelFriends.users[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = modelFriends.users[indexPath.row]
        
        let alertController = UIAlertController(title: user.name, message: user.town, preferredStyle: .actionSheet)
        
        let actionProfile = UIAlertAction(title: "Профиль", style: .default) { _ in
            self.performSegue(withIdentifier: "goToFriendProfile", sender: indexPath) }
                                        
        let actionDelete = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            self.modelFriends.users.remove(at: indexPath.row)
            tableView.reloadData()}
        let actionCancel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        alertController.addAction(actionProfile)
        alertController.addAction(actionDelete)
        alertController.addAction(actionCancel)
        present(alertController, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFriendProfile"{
            
            let vc = segue.destination as! FriendViewController
            
            let indexPath = sender as! IndexPath
            let user = modelFriends.users[indexPath.row]
            
            vc.user = user
        }
    }
    
    
}
