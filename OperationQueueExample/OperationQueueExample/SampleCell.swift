//
//  SampleCell.swift
//  OperationQueueExample
//
//  Created by Sunil on 26/10/18.
//  Copyright © 2018 Sunil. All rights reserved.
//

import UIKit

class SampleCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
