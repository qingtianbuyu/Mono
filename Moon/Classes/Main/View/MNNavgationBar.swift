//
//  MNNavgationBar.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

protocol titleViewDelegate{
  func didSelectTitleViewAtIndex( _ index:Int)
}

class MNNavgationBar: UIView {

  var collection:UICollectionView?
  var delegate:titleViewDelegate?
  
  
  var titles:[MNTitle]?{
    didSet{
      collection?.reloadData()
    }
  }
  
  var curPosition:Int = 0
  
  
  override init(frame: CGRect) {
    let nFrame = CGRect(x: 0, y: 0, width: ScreenBounds.width, height: 64)
    super.init(frame: nFrame)
    self.backgroundColor = UIColor.black
    setupCollectionView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupCollectionView() -> Void {
    let flowLayout                             = UICollectionViewFlowLayout()
    flowLayout.scrollDirection                 = UICollectionViewScrollDirection.horizontal
    flowLayout.itemSize                        = CGSize(width:100, height:44)
    flowLayout.minimumInteritemSpacing         = 1
    flowLayout.minimumLineSpacing              = 1
    collection                                 = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    collection!.showsHorizontalScrollIndicator = false
    collection!.showsVerticalScrollIndicator   = false
    collection!.register(MNTitleCell.self, forCellWithReuseIdentifier: "MNTitleCell")
    collection?.delegate                       = self
    collection?.dataSource                     = self
    addSubview(collection!)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    collection?.frame = CGRect(x: 0, y: 20, width: self.width, height: 44)
  }
  
  
}

  extension MNNavgationBar:UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return titles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MNTitleCell", for: indexPath) as! MNTitleCell
      let title = titles?[indexPath.row]
      title!.enable = (indexPath.row == curPosition)
      collectionCell.title = title
      return collectionCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      collectionView.deselectItem(at: indexPath, animated: true)
      collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
      delegate?.didSelectTitleViewAtIndex(indexPath.row)
      curPosition = indexPath.row
      
      collectionView.reloadData()
    }
  
  
  }
