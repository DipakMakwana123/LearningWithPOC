//
//  EmployeeTableCell.swift
//  LearningWithPOC
//
//  Created by Apple on 23/03/22.
//

import UIKit

class EmployeeTableCell: UITableViewCell {
    
    @IBOutlet weak var lable1: UILabel?
    @IBOutlet weak var lable2: UILabel?
    @IBOutlet weak var lable3: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
