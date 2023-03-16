//
//  FavPostTableViewCell.swift
//  NavigTest
//
//  Created by Mac on 08.03.2023.
//

import UIKit

class FavPostTableViewCell: UITableViewCell {

   
    lazy var backView: UILabel = {
        let authorlbl = UILabel()
        authorlbl.translatesAutoresizingMaskIntoConstraints = false
        authorlbl.layer.masksToBounds = false
        authorlbl.backgroundColor = .systemGray5
        authorlbl.layer.cornerRadius = 15
      return authorlbl
    }()
    
    
    lazy var postAuthor: UILabel = {
       let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont.boldSystemFont(ofSize: 18)//systemFont(ofSize: 18)
        author.numberOfLines = 2
        author.textColor = .black
        author.backgroundColor = .systemGray5
        return author
    }()
    
    lazy var postText: UILabel = {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.textAlignment = .left
        txt.numberOfLines = 0
        txt.textColor = .black
        txt.backgroundColor = .systemGray5
        return txt
    }()
    
    lazy var postImage: UIImageView = {
      let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 13
        img.backgroundColor = .black
        return img
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.clipsToBounds = true
     

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        addSubview(backView)
        backView.addSubview(postAuthor)
        backView.addSubview(postText)
        backView.addSubview(postImage)
        setCellConstraints()
    }
    
 
    func setCellConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        
            backView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
            backView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5),
            backView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5),
            //backView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            backView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, constant: -5),
            
            postAuthor.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            postAuthor.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 170),
            postAuthor.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            postAuthor.heightAnchor.constraint(equalToConstant: 20),
            
            postText.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 5),
            postText.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 170),
            postText.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            //postText.heightAnchor.constraint(equalTo: backView.heightAnchor, constant: -15),
            postText.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            
            postImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            postImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 5),
            postImage.trailingAnchor.constraint(equalTo: postAuthor.leadingAnchor, constant: -5),
            postImage.heightAnchor.constraint(equalTo: backView.heightAnchor, constant: -15)
        
        ])
    }
    
}
