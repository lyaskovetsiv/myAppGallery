import UIKit

class PhotoGallery{
    
    var images = [UIImage]()
    
    init(){
        loadGallery()
    }
    
    func loadGallery(){
        
        for i in 0...6{
            if let image = UIImage(named: "image\(i)"){
                images.append(image)
            }
        }
    }
    
}
