//
//  TodoCell.swift
//  Note
//
//  Created by Nasser Aseeri on 30/05/1443 AH.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var todoCreationDateLabel: UILabel!
    @IBOutlet weak var todoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
