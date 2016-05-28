//
//  MNMeow.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

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
  var topF: CGRect = CGRectZero;
  var thumbF: CGRect = CGRectZero;
  var meowTypeThreeF: CGRect = CGRectZero;
  var meowTypeFourF: CGRect = CGRectZero;
  
  
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
      for dict in array {
        images?.append(MNThumb(dict:dict))
      }
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
    var height:CGFloat = 0
    topF = CGRectMake(0, 0, ScreenWidth, exploreTopBarH)
    let topFMaxY = CGRectGetMaxY(topF)
    height += topFMaxY
    
    //计算cell高度
    if meow_type == 2 {
      let thumbH:CGFloat = 375
      thumbF = CGRectMake(0, topFMaxY, ScreenWidth, thumbH)
      height += thumbH
    }
    else if meow_type == 3 {
      let thumbH:CGFloat = 375
      meowTypeThreeF = CGRectMake(0, topFMaxY, ScreenWidth, thumbH)
      height += (thumbH + exploreToolBarH)
    }
    else if meow_type == 4 {
      let thumbH:CGFloat = 200 + 114
      meowTypeFourF = CGRectMake(0, 0, ScreenWidth, thumbH)
      height += thumbH
    }
    else {
      height += exploreToolBarH
    }
    
    return height
  }
  
  
  
}
