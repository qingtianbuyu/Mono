//
//  MNMeow.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

//enum MeowType: Int {
//  case type_0 = 0
//  case type_2 = 2
//  case type_3 = 3
//  case type_4 = 4
//  case type_7 = 7
//  case type_8 = 8
//  case type_9 = 9
//  
//}



class MNMeow: NSObject {
  
  var bang_count: Int = 0
  var is_folded: Bool = false
  var kind: Int = 0
  var group: MNGroup?
  var desc: String?
  var title: String?
  var meow_status: String?
  var object_type: Int = 0
  var has_video: Bool = false
  var id: Int  = 0
  var comment_count: Int  = 0
  var create_time: Int  = 0
  var user: MNMasterInfo?
  var is_filtered: Int  = 0
  var meow_type: Int  = 0
  var category: MNCategory?
  var intro: String?
  var is_post_by_master: Int = 0
  var thumb: MNThumb?
  var video_duration: Int = 0
  var pics: [MNThumb]?
  var text_align: String?
  var text_replacement:[String]?
  var author: String?
  var font_ename: String?
  var images: [MNThumb]?
  var text: String?
  var image_count: Int = 0
  var music_duration: Int = 0
  var artist: Int  = 0
  var lyrics: String?
  var song_name: String?
  var album_cover: [MNThumb]?
  var music_url: String?
  
  //topF
  var topF:   CGRect = CGRectZero
  var thumbF: CGRect = CGRectZero;
  var meowTypeThreeF: CGRect = CGRectZero
  var meowTypeFourF:  CGRect = CGRectZero
  var meowTypeSevenF: CGRect = CGRectZero
  var meowTypeEightF: CGRect = CGRectZero
  var meowTypeNineF:  CGRect = CGRectZero
  
  //计算cell高度
  var cellHeight:CGFloat {
    get {
      return calcHeight()
    }
    
  }
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "group" {
      group = MNGroup(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "user" {
      user = MNMasterInfo(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "category" {
      category = MNCategory(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "thumb" {
      thumb = MNThumb(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "description" {
      desc =  value as? String
      return
    }
    if key == "pics" {
      guard let array = (value as? [[String : AnyObject]])  else {
        return
      }
      var picArray = [MNThumb]()
      for dict in array {
        picArray.append(MNThumb(dict:dict))
      }
      pics = picArray
      
      return
    }
    if key == "text_replacement" {
      return
    }
    if key == "images" {
      guard let array = (value  as?[[String : AnyObject]])  else {
        return
      }
      var imageArray = [MNThumb]()
      for dict in array {
        imageArray.append(MNThumb(dict:dict))
      }
      images = imageArray
      return
    }
    if key == "album_cover" {
      guard let array = (value  as?[[String : AnyObject]])  else {
        return
      }
      for dict in array {
        album_cover?.append(MNThumb(dict:dict))
      }
      return
    }
    
  
    super.setValue(value, forKey: key)
  }
  
  // TODO 计算高度,暂时没有保存机制
  func calcHeight() -> CGFloat {
    let padding:CGFloat = 20
    let width = ScreenWidth
    
    var height:CGFloat = 0
    topF = CGRectMake(0, 0, width, exploreTopBarH)
    let topFMaxY = CGRectGetMaxY(topF)
    height += topFMaxY
    
    //计算cell高度
    if meow_type == 2 {
      let thumbH:CGFloat = 375
      thumbF = CGRectMake(0, topFMaxY, width, thumbH)
      height += thumbH
    }
    else if meow_type == 3 {
      let thumbH:CGFloat = 375
      meowTypeThreeF = CGRectMake(0, topFMaxY, width, thumbH)
      height += (thumbH + exploreToolBarH)
    }
    else if meow_type == 4 {
      let thumbH:CGFloat = 200 + 114
      meowTypeFourF = CGRectMake(0, 0, width, thumbH)
      height += thumbH
    } else if meow_type == 7 {
      let thumbH:CGFloat = 415 - topFMaxY
      meowTypeSevenF = CGRectMake(0, 0, width, thumbH)
      height += thumbH
    } else if meow_type == 8 {
      let thumbH:CGFloat = 445
      meowTypeEightF = CGRectMake(0, 0, width, thumbH)
      height += thumbH
    }
    else if meow_type == 9 {
      let thumbH:CGFloat = 350
      meowTypeNineF = CGRectMake(0, 0, width, thumbH)
      height += (thumbH - topFMaxY)
    }
    else {
      height += exploreToolBarH
    }
    
    //额外的padding
    height += padding
    return height
  }
  
  
  
}
