//
//  CartViewController.swift
//  demo
//
//  Created by Anton Ignatov on 31/05/2019.
//  Copyright © 2019 Anton Ignatov. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelTotal: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell")!
        
        let product = CartManager.shared.products[indexPath.item]
        
        cell.textLabel?.text = product.name*/
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath as IndexPath) as! CartViewCell
        
        let product = CartManager.shared.products[indexPath.item]
        
        let url = URL(string: product.image)
        let data = try? Data(contentsOf: url!)
        
        cell.picture.image = UIImage(data: data!)
        cell.name.text = product.name
        cell.price.text = "\(product.price)  Руб."
            
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        var total = 0;
        
        for product in CartManager.shared.products {
            
            if let price = Int(product.price) {
                total += price
            }
        }
        
        labelTotal.text = "Итого: \(total) Руб."
    }
}
