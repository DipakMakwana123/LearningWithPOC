//
//  ListTableCell.swift
//  InterviewPreparation
//
//  Created by Apple on 30/03/22.
//

import UIKit

class ListTableCell: UITableViewCell {
    
    static let identifier = "ListTableCell"
    
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblDescription: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
