import UIKit

class SettingsTableViewController: UITableViewController {
   
    //MARK: ---Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var townTextField: UITextField!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!

    //MARK: ---Actions
    @IBAction func changeName(_ sender: UITextField) {
        if let text = sender.text{
            Settings.shared.currentSettings.userName = text
        }
    }
    
    @IBAction func changeTown(_ sender: UITextField) {
        if let text = sender.text{
            Settings.shared.currentSettings.town = text
        }
    }
    
    @IBAction func switchSoundChanged(_ sender: UISwitch) {
        Settings.shared.currentSettings.soundOn = sender.isOn
    }
    
    @IBAction func volumeSliderChanged(_ sender: UISlider) {
        Settings.shared.currentSettings.volumeLevel = sender.value
    }
    
    //MARK: ---Functions
    func loadSettings(){
        userNameTextField.text = Settings.shared.currentSettings.userName
        townTextField.text = Settings.shared.currentSettings.town
        soundSwitch.isOn = Settings.shared.currentSettings.soundOn
        volumeSlider.value = Settings.shared.currentSettings.volumeLevel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings() 
    }
}
