//
//  DetayVC.swift
//  DetayliTableViewKullanimi
//
//  Created by Ayşegül Yıldız on 6.11.2021.
//

import UIKit

class DetayVC: UIViewController {

    @IBOutlet weak var fiyatLabel: UILabel!
    @IBOutlet weak var urunResim: UIImageView!
    
    var urun : Urunler?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let u = urun{
            self.navigationItem.title = u.urunAd
            urunResim.image = UIImage(named: u.urunResimAd!)
            fiyatLabel.text = "\(u.urunFiyat!) ₺"
        }
        
    }
    

    @IBAction func buttonSepet(_ sender: Any) {
        if let u = urun{
            print("Detay sayfa : \(u.urunAd!) sepet eklendi.")
        }
    }
    

}
