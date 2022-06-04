import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: ---Gallery Constants
    let photoGallery = PhotoGallery()
    let reuseCellID = "PhoroGalleryCollectionCell"
    let countImagesInLine = 3
    let offSet: CGFloat = 2.0

    //MARK: ---Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var photosLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: ---Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.borderWidth  =  3
        avatarImage.layer.borderColor  = UIColor.lightGray.cgColor
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseCellID)
        photosLabel.text = String(photoGallery.images.count)
        loadUserDefaults()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUserDefaults()
    }
    
    func loadUserDefaults(){
        userNameLabel.text = Settings.shared.currentSettings.userName
        townLabel.text = Settings.shared.currentSettings.town
    }
}


extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCellID, for: indexPath) as! PhotoCollectionViewCell
        cell.photoView.image = photoGallery.images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionFrame = collectionView.frame
        
        let cellWidth = collectionFrame.width / CGFloat(countImagesInLine)
        let cellHeight = cellWidth
        
        let spacing = CGFloat((countImagesInLine+1))*offSet / CGFloat(countImagesInLine)
        
        return CGSize(width: cellWidth-spacing, height: cellHeight-(offSet*2))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FullScreenViewController") as! FullScreenViewController
        vc.photoGallery = photoGallery
        vc.index = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

