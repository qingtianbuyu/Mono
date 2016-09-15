//
//  MNMeowTypeThreeView.swift
//  Moon
//
//  Created by YKing on 16/5/29.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class MNMeowTypeThreeView: UIView {

  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var textLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let layout                          = UICollectionViewFlowLayout()
    layout.itemSize                     = CGSize(width: 122, height: 122)
    layout.minimumInteritemSpacing      = 2
    layout.minimumLineSpacing           = 2
    collectionView.collectionViewLayout = layout
    collectionView.delegate             = self
    collectionView.dataSource           = self
    let nib                             = UINib(nibName: String(describing: MNPicCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "pic")
  }

  var  meow: MNMeow?{
    didSet{
      titleLabel.text = meow?.title
      textLabel.text = meow?.text
      
      if meow?.pics?.count > 1{
        collectionView.reloadData()
      } else {
        self.imageView.m_setImageWithUrl(meow?.pics![0].raw, placeHolderName: "place_holder.png")
      }
    }
  }
  
}

extension MNMeowTypeThreeView: UICollectionViewDelegate , UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return meow?.pics?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pic", for: indexPath) as! MNPicCell
      cell.pic = meow?.pics![(indexPath as NSIndexPath).row]
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
  }


}
