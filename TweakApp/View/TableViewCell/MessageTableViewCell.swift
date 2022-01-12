//
//  MessageTableViewCell.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 08/01/22.
//

import UIKit

class MessageTableViewCell: UITableViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.personImage.makeRounded()
    }
    
    func setupInfoCell(message: Message?) {
        guard let message = message else { return }
        self.titleLabel.text = message.title
        self.subtitleLabel.text = message.body
        self.personImage.image = UIImage(named: message.imageName)
    }

}
