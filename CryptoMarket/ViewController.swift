//
//  ViewController.swift
//  CryptoMarket
//
//  Created by Mohamed Derkaoui on 21/02/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit





class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cryptosData = [Cryptocurrency]()

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.estimatedRowHeight = 80
        
        API.getCryptoData().then{ response -> Void in
            self.cryptosData = response
            self.myTableView.reloadData()
            

            }.catch{ _ -> Void in
                print("error 444")
        }
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptosData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptocell", for: indexPath) as! CustomCellTableViewCell
        cell.name.text = cryptosData[indexPath.row].name
        cell.symbol.text = "| \(cryptosData[indexPath.row].symbol!)"
        cell.usdprice.text = "\(cryptosData[indexPath.row].princeusd!) $"
        cell.btcprice.text = "\(cryptosData[indexPath.row].pricebtc!) BTC"
        cell.rank.text = "rank : \(cryptosData[indexPath.row].rank ?? " - ")  "
    
        return cell
    }

    
    

}

