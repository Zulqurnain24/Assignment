//
//  CurrencyRateCell.swift
//  SwensonAssignment
//
//  Created by Zulqurnain on 05/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class CurrencyRateCell: UITableViewCell {
    
     @IBOutlet weak var currencyView: CurrencyView!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
