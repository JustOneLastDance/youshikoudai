//
//  AIIMainTableViewCell.swift
//  YOUSHIKOUDAI
//
//  Created by JustinChou on 2018/6/12.
//  Copyright © 2018 JustinChou. All rights reserved.
//

import UIKit
import Kingfisher

class AIIMainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var titleTextLabel: UILabel!
    
    var model: AdvertisementModel? {
        didSet {
            guard let adver = model else {
                return
            }
            
            titleTextLabel.text = adver.text
            let url = URL(string: adver.image!)
            titleImageView.kf.setImage(with: url, placeholder: UIImage(named: "30219-50020ecf0a0d3978"), options: nil, progressBlock: nil, completionHandler: nil)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleImageView.isUserInteractionEnabled = false;
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
