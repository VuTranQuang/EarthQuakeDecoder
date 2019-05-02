//
//  TableViewCellA.swift
//  RequestApiDecoder
//
//  Created by Vu on 5/2/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit

class TableViewCellA: UITableViewCell {

    @IBOutlet weak var magLabel: CustomLabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
@IBDesignable
class CustomLabel: UILabel {
    @IBInspectable
    private var cornerRadius: CGFloat = 0.0 {
        didSet {
            setLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    func setLayout() {
        if cornerRadius == -1 {
            layer.cornerRadius = frame.height*0.5
        } else {
            layer.cornerRadius = cornerRadius
        }
    }
    
}

