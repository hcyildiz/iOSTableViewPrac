//
//  Urunler.swift
//  DetayliTableViewKullanimi
//
//  Created by Ayşegül Yıldız on 3.11.2021.
//

import Foundation

class Urunler {
    
    var urunId : Int?
    var urunAd : String?
    var urunResimAd : String?
    var urunFiyat : Double?
    
    init(){
        
    }
    
    init(urunId:Int,urunAd:String,urunResimAd:String,urunFiyat:Double){
        
        self.urunId = urunId
        self.urunAd = urunAd
        self.urunResimAd = urunResimAd
        self.urunFiyat = urunFiyat
    }
    
}
