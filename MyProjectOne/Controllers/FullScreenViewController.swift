import UIKit

class FullScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var photoGallery: PhotoGallery!
    let cellId = "cellId"
    var index: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "FullScreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        collectionView.performBatchUpdates(nil) { result in
            self.collectionView.scrollToItem(at: self.index, at: .centeredHorizontally, animated: false)
            //
        }
    }
}

extension FullScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FullScreenCollectionViewCell
        cell.photoView.image = photoGallery.images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionFrame = collectionView.frame
        
        let cellWidth = collectionFrame.width
        
        let cellHeight = cellWidth
        print(cellHeight)
        print(cellWidth)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
}


