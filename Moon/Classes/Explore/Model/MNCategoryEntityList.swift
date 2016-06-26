//
//  MNCategoryEntityList.swift
//  Moon
//
//  Created by YKing on 16/6/26.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNCategoryEntityList {
  
  var category_list: [MNCategory]?
  
  func loadCategory() {
    let path =   NSBundle.mainBundle().pathForResource("category.plist", ofType: nil)
    let dict =   NSDictionary(contentsOfFile: path!)
    let categoryListDictArray = dict!["category_list"] as! NSArray
    
    var categoryList = [MNCategory]()
    for categoryDict in categoryListDictArray {
      categoryList.append(MNCategory(dict: (categoryDict as! [String: AnyObject])))
    }
    category_list = categoryList
  }
  

}
