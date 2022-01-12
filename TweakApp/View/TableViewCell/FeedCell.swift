//
//  FeedCell.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 08/01/22.
//

import UIKit

class FeedCell: UITableViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCellInfo(post: Post) {
        self.nameLabel.text = post.userName
        self.personImage.image = UIImage(named: post.profilePicture)
        self.hourLabel.text = post.hour
        self.captionLabel.text = post.postText
        self.postImageView.image = UIImage(named: post.postImage)
    }
    
}
