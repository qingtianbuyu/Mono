//
//  MNMeow.swift
//  Moon
//
//  Created by YKing on 16/5/23.
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
  var music_duration_str: String?
  var artist: String?
  var lyrics: String?
  var song_name: String?
  var album_cover: [MNThumb]?
  var music_url: String?
  
  //topF
  var topF:   CGRect = CGRect.zero
  var thumbF: CGRect = CGRect.zero
  var meowTypeThreeF: CGRect = CGRect.zero
  var meowTypeFourF:  CGRect = CGRect.zero
  var meowTypeSevenF: CGRect = CGRect.zero
  var meowTypeEightF: CGRect = CGRect.zero
  var meowTypeNineF:  CGRect = CGRect.zero
  
  //计算cell高度
  var cellHeight:CGFloat {
    get {
      return calcHeight()
    }
    
  }
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeys(dict)
  }
  
  override func setValue(_ value: Any?, forKey key: String) {
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
    
    
    if key == "music_duration" {
      music_duration  = value as! Int
      let min = music_duration / 60
      let sec = music_duration % 60
      music_duration_str =  "\(min):\(sec)"
      return
    }
    
    
    super.setValue(value, forKey: key)
  }
  
  // TODO 计算高度,暂时没有保存机制
  func calcHeight() -> CGFloat {
    let padding:CGFloat = 20
    let width = ScreenWidth
    
    var height:CGFloat = 0
    topF = CGRect(x:0, y:0, width:width, height:exploreTopBarH)
    let topFMaxY = topF.maxY
    height += topFMaxY
    
    //计算cell高度
    if meow_type == 2 {
      let thumbH:CGFloat = 375
      thumbF = CGRect(x:0, y:topFMaxY, width:width, height:thumbH)
      height += thumbH
    }
    else if meow_type == 3 {
      var tmpHeight: CGFloat = 0
      if (title?.characters.count ?? 0) > 0 {
        let titleSize = CGSize(width:ScreenWidth - CGFloat(2 * 20), height:CGFloat(MAXFLOAT))
        let  titleH = title?.height(titleSize, systemFontOfSize: 20) ?? 0
        tmpHeight += (titleH + 10)
      }
      
      if text?.characters.count > 0 {
        let descriptionSize = CGSize(width: ScreenWidth - CGFloat(2 * 20), height: CGFloat(30))
        let  textH = text?.height(descriptionSize, systemFontOfSize: 12) ?? 0
        tmpHeight += (textH + 15) + 20
        
      }
      
      let fromtop2collectionViewH =  tmpHeight
      
      let thumbH:CGFloat = 375
      meowTypeThreeF = CGRect(x: 0, y: topFMaxY, width: width, height: fromtop2collectionViewH + thumbH)
      height += (thumbH + exploreToolBarH + fromtop2collectionViewH)
    }
    else if meow_type == 4 {

      let titleSize = CGSize(width: ScreenWidth - CGFloat(2 * 20), height: CGFloat(MAXFLOAT))
      let  titleH = title?.height(titleSize, systemFontOfSize: 20) ?? 0
      let descriptionSize = CGSize(width: ScreenWidth - CGFloat(2 * 20), height: CGFloat(30))
      let  descriptionH = desc?.height(descriptionSize, systemFontOfSize: 12) ?? 0
      
      //计算行高
      let thumbH:CGFloat = 200 + 20 + 20 + 20 + exploreTopBarH + titleH + descriptionH - topFMaxY
      
      meowTypeFourF = CGRect(x: 0, y: 0, width: width, height: thumbH)
      height += thumbH
    } else if meow_type == 7 {
      let thumbH:CGFloat = 415 - topFMaxY
      meowTypeSevenF = CGRect(x: 0, y: 0, width: width, height: thumbH + topFMaxY)
      height += thumbH
    } else if meow_type == 8 {
      let thumbH:CGFloat = 445
      meowTypeEightF = CGRect(x: 0, y: 0, width: width, height: thumbH)
      height += thumbH
    }
    else if meow_type == 9 {
      let thumbH:CGFloat = 350
      meowTypeNineF = CGRect(x: 0, y: 0, width: width, height: thumbH)
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
