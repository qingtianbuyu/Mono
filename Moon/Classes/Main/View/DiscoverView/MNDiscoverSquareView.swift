//
//  MNDiscoverSquareView.swift
//  Moon
//
//  Created by YKing on 16/6/11.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNDiscoverSquareView: UIView {

  @IBOutlet weak var squareView: UICollectionView!
  
  var mod: MNModEntity? {
    didSet {
        self.squareView.reloadData()
    }
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSizeMake((ScreenWidth - 1) * 0.5, 275)
    layout.minimumLineSpacing = 1
    layout.minimumInteritemSpacing = 1
    self.squareView.collectionViewLayout = layout
    self.squareView.backgroundColor = commonBgColor
    self.squareView.delegate = self
    self.squareView.dataSource = self
    let nib = UINib(nibName: String(MNDiscoverSquareCell), bundle: nil)
    self.squareView.registerNib(nib, forCellWithReuseIdentifier: MNDiscoverSquareCell.viewIdentify)
  }
}

extension MNDiscoverSquareView: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return mod?.entity_list?.count ?? 0
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = squareView.dequeueReusableCellWithReuseIdentifier(MNDiscoverSquareCell.viewIdentify, forIndexPath: indexPath) as! MNDiscoverSquareCell
    let mode =   mod?.entity_list![indexPath.row]
    cell.mode = mode
    return cell
  }


}
