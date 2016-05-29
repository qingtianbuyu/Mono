//
//  MNMeowTypeThreeView.swift
//  Moon
//
//  Created by YKing on 16/5/29.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMeowTypeThreeView: UIView {

  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(122, 122)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib  = UINib(nibName: String(MNPicCell), bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "pic")
  }

  var  meow: MNMeow?{
    didSet{
      if meow?.pics?.count > 1{
        collectionView.reloadData()
      } else {
        self.imageView.m_setImageWithUrl(meow?.pics![0].raw, placeHolderName: "place_holder")
      }
    }
  }
  
}

extension MNMeowTypeThreeView: UICollectionViewDelegate , UICollectionViewDataSource {
  
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return meow?.pics?.count ?? 0
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pic", forIndexPath: indexPath) as! MNPicCell
      cell.pic = meow?.pics![indexPath.row]
    return cell
  }
  
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    collectionView.deselectItemAtIndexPath(indexPath, animated: true)
  }


}
