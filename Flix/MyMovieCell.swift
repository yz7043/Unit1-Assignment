//
//  MyMovieCell.swift
//  Flix
//
//  Created by Yuxiang Zhu on 18/2/2022.
//

import UIKit

class MyMovieCell: UITableViewCell {

    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SynopsisLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
