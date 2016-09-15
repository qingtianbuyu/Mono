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
    layout.itemSize = CGSize(width: (ScreenWidth - 1) * 0.5, height: 227)
    layout.minimumLineSpacing = 1
    layout.minimumInteritemSpacing = 1
    self.squareView.collectionViewLayout = layout
    self.squareView.backgroundColor = commonBgColor
    self.squareView.delegate = self
    self.squareView.dataSource = self
    self.squareView.bounces = false
    let nib = UINib(nibName: String(describing: MNDiscoverSquareCell.self), bundle: nil)
    self.squareView.register(nib, forCellWithReuseIdentifier: MNDiscoverSquareCell.viewIdentify)
  }
}

extension MNDiscoverSquareView: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return mod?.entity_list?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = squareView.dequeueReusableCell(withReuseIdentifier: MNDiscoverSquareCell.viewIdentify, for: indexPath) as! MNDiscoverSquareCell
    let mode =   mod?.entity_list![(indexPath as NSIndexPath).row]
    cell.mode = mode
    return cell
  }


}
