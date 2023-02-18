//
//  usersTableViewCell.swift
//  pruebaTecnica
//
//  Created by Loducode Retina on 18/02/23.
//

import UIKit

class usersTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var dateCreate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(user: userResponse){
        self.nameUser.text = user.name
        self.userName.text = user.username
        self.dateCreate.text = user.dateCreate
    }
    
}
