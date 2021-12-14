//
//  UrunTableViewCell.swift
//  DetayliTableViewKullanimi
//
//  Created by Ayşegül Yıldız on 3.11.2021.
//

import UIKit
//1.Adım protocol oluştur.
protocol HucreProtocol{
    func buttonTiklandi(indexPath:IndexPath)
}

class UrunTableViewCell: UITableViewCell {

    @IBOutlet weak var urunFiyatLabel: UILabel!
    @IBOutlet weak var urunAdLabel: UILabel!
    @IBOutlet weak var urunResimImageView: UIImageView!
    @IBOutlet weak var hucreArkaplan: UIView!
    
    //2.adım tetikleme ve yetki alma için değişken oluştur
    var hucreProtocol : HucreProtocol?
    
    //3.adım indexPath verisini viewControllerdan alma için değişken oluştur.
    var indexPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

    @IBAction func buttonSepeteEkle(_ sender: Any) {
        //4.adım metodu tetikle
        hucreProtocol?.buttonTiklandi(indexPath: indexPath!)
        
    }
}


