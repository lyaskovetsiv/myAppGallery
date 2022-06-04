//
//  FullScreenViewController.swift
//  MyProjectOne
//
//  Created by Ivan Lyaskovets on 03.06.2022.
//

import UIKit

class FullScreenViewController: UIViewController{
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photoGallery: PhotoGallery!
    let countOfCells = 1
    let cellID = "cellID"
    var index: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "FullScreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
    }

}



extension FullScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FullScreenCollectionViewCell
        cell.photoView.image = photoGallery.images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = collectionView.frame.width / CGFloat(countOfCells)
        let heightCell = collectionView.frame.height

        return CGSize(width: widthCell, height: heightCell)
    }
    
    
    

}
