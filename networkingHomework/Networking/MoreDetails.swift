//
//  MoreDetails.swift
//  Networking
//
//  Created by salo khizanishvili on 11.08.22.
//

import UIKit

class MoreDetails: UIViewController {
    
    @IBOutlet weak var popul: UILabel!
    @IBOutlet weak var capital: UILabel!
    
    var country: Country!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        popul.text = "\(country.population)"
       // capital.text = country.capital ამას ლინკზე არ მაჩვენებს და არ ვიცი რატომ
        
    }

}
