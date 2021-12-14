//
//  ViewController.swift
//  DetayliTableViewKullanimi
//
//  Created by Ayşegül Yıldız on 3.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var urunlerTableView: UITableView!
    
    var urunlerListe = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        let u1 = Urunler(urunId: 1, urunAd: "Macbook Pro 14", urunResimAd: "bilgisayar", urunFiyat: 23499.9)
        let u2 = Urunler(urunId: 2, urunAd: "Rayban Club Master", urunResimAd: "gozluk", urunFiyat: 349.99)
        let u3 = Urunler(urunId: 3, urunAd: "Sony ZX Series", urunResimAd: "kulaklik", urunFiyat: 489.9)
        let u4 = Urunler(urunId: 4, urunAd: "Gio Armani", urunResimAd: "parfum", urunFiyat: 769.99)
        let u5 = Urunler(urunId: 5, urunAd: "Casio X Series", urunResimAd: "saat", urunFiyat: 169.9)
        let u6 = Urunler(urunId: 6, urunAd: "Dyson V8", urunResimAd: "supurge", urunFiyat: 3799.9)
        let u7 = Urunler(urunId: 7, urunAd: "Iphone 13 Pro", urunResimAd: "telefon", urunFiyat: 13499.99)
        urunlerListe.append(u1)
        urunlerListe.append(u2)
        urunlerListe.append(u3)
        urunlerListe.append(u4)
        urunlerListe.append(u5)
        urunlerListe.append(u6)
        urunlerListe.append(u7)
        
    }


}
//6.adım protocolu view controller a ekle
extension ViewController : UITableViewDelegate,UITableViewDataSource,HucreProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunHucre",
                                                 for: indexPath) as! UrunTableViewCell
        cell.urunResimImageView.image = UIImage(named: urun.urunResimAd!)
        cell.urunAdLabel.text = urun.urunAd!
        cell.urunFiyatLabel.text = "\(urun.urunFiyat!) ₺"
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.hucreArkaplan.layer.cornerRadius = 10
        //8.adım yetki verme ve indexpath verisini iletme
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let urun = urunlerListe[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            print("\(urun.urunAd!) silindi")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){ (contextualAction,view,bool) in
            print("\(urun.urunAd!) düzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            let urun = sender as? Urunler
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.urun = urun
        }
    }
    //7.adım protocol metodunu ekle
    func buttonTiklandi(indexPath: IndexPath) {
        let urun = urunlerListe[indexPath.row]
        print("\(urun.urunAd!) sepete eklendi")
    }
    
    
    
}

