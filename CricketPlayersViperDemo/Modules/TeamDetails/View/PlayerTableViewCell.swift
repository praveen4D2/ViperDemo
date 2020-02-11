//
//  PlayerTableViewCell.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 11/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class PlayerTableViewCell: TableViewCell {

    
    /// XIB outlets
    @IBOutlet weak var lblPlayerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func configure(_ item: Any?) {
        guard let player = item as? Player else { return  }
        self.lblPlayerName.text = player.name
        if player.captain ?? false {
            self.lblPlayerName.textColor = UIColor.systemPink
        }else{
            self.lblPlayerName.textColor = UIColor.black
        }
    }
    
}
