//
//  MNHoroscopeEntityList.swift
//  Moon
//
//  Created by YKing on 16/6/24.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNHoroscopeEntityList: NSObject {
  
  var horoscopes: [MNHoroscope]?
  
  func loadScopeData() {

    var horoscopes = [MNHoroscope]()
    horoscopes.append( MNHoroscope(name: "保密", time: "") )
    horoscopes.append( MNHoroscope(name: "白羊座", time: " 3月21日 － 4月20日") )
    horoscopes.append( MNHoroscope(name: "金牛座", time: " 4月21日 － 5月21日") )
    horoscopes.append( MNHoroscope(name: "双子座", time: " 5月21日 － 6月22日") )
    horoscopes.append( MNHoroscope(name: "巨蟹座", time: " 6月23日 － 7月22日") )
    horoscopes.append( MNHoroscope(name: "狮子座", time: " 7月23日 － 8月22日") )
    horoscopes.append( MNHoroscope(name: "处女座", time: " 8月23日 － 9月22日") )
    horoscopes.append( MNHoroscope(name: "天秤座", time: " 9月23日 － 10月23日") )
    horoscopes.append( MNHoroscope(name: "天蝎座", time: "10月23日 － 11月23日") )
    horoscopes.append( MNHoroscope(name: "射手座", time: "11月23日 － 12月23日") )
    horoscopes.append( MNHoroscope(name: "摩羯座", time: "12月23日 － 1月20日") )
    horoscopes.append( MNHoroscope(name: "水瓶座", time: " 1月21日 － 2月19日") )
    horoscopes.append( MNHoroscope(name: "双鱼座", time: " 2月20日 － 3月20日") )
    self.horoscopes = horoscopes
  }
}
