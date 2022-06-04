import Foundation


enum KeysUserDefaults{
    static let settingsKey = "settingsKey"
}

struct UserSettings: Codable{
    
    var userName: String
    var town: String
    var soundOn: Bool
    var volumeLevel: Float
}

class Settings{
    
    static var shared = Settings()
    
    //defaultSettings
    private let defaultSettings = UserSettings(userName: "User", town: "This world", soundOn: false, volumeLevel: 0.0)
    
    //currentSettings
    var currentSettings: UserSettings{
        
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserDefaults.settingsKey) as? Data{
                return try! PropertyListDecoder().decode(UserSettings.self, from: data)
            }
            else{
                if let data = try? PropertyListEncoder().encode(defaultSettings){
                    UserDefaults.standard.set(data, forKey: KeysUserDefaults.settingsKey)
                }
                return defaultSettings
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsKey)
            }
        }
    }
}


