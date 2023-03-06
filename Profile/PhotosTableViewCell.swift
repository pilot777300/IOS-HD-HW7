//
//  PhotosTableViewCell.swift
//  NavigTest
//
//  Created by Mac on 14.09.2022.
//

import UIKit
import iOSIntPackage

public struct Pictures {
    var picture: String?
}
    public var picturesAPI = [Pictures]()

    public var newPic = [UIImage]()
    public var em = [UIImage]()

class PhotosTableViewCell: UITableViewCell {
    
   private lazy var collectionView: UICollectionView = {
     let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = UIScreen.main.bounds.width / 4.5
        let height = UIScreen.main.bounds.height / 11
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumLineSpacing = 7
        layout.sectionInset = UIEdgeInsets(top: 35, left: 12, bottom: 12, right: 12)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.clipsToBounds = true
        cv.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "HeaderCell")
        cv.backgroundColor = .systemGray5
         return cv
    }()
    
   private lazy var textPhoto: UILabel = {
       let txt = UILabel()
        txt.text = "Photo"
        txt.font = UIFont.boldSystemFont(ofSize: 16)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

   private lazy var arrow: UIImageView = {
        let arr = UIImageView()
        arr.image = UIImage(named: "arrow.png")
        arr.translatesAutoresizingMaskIntoConstraints = false
       return arr
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        
        newPic.append(UIImage(named: "cat.jpg")!)
        newPic.append(UIImage(named: "helicopter.jpeg")!)
        newPic.append(UIImage(named: "A330-300.jpg")!)
        newPic.append(UIImage(named: "fox.jpeg")!)
        newPic.append(UIImage(named: "cat.jpg")!)
        newPic.append(UIImage(named: "arrow.png")!)
        newPic.append(UIImage(named: "Aeroplan.jpeg")!)
        newPic.append(UIImage(named: "volf.jpeg")!)
        
        
        picturesAPI.append(Pictures(picture: "A330-300.jpg"))
        picturesAPI.append(Pictures(picture: "Boston.jpg"))
        picturesAPI.append(Pictures(picture: "logo.png"))
        picturesAPI.append(Pictures(picture: "Aeroplan.jpeg"))
        picturesAPI.append(Pictures(picture: "Brothers.tiff"))
        picturesAPI.append(Pictures(picture: "Avatarka1.jpg"))
        picturesAPI.append(Pictures(picture: "arrow.png"))
        picturesAPI.append(Pictures(picture: "fox.jpeg"))
        picturesAPI.append(Pictures(picture: "cat.jpg"))
        picturesAPI.append(Pictures(picture: "volf.jpeg"))
        picturesAPI.append(Pictures(picture: "helicopter.jpeg"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
}

extension PhotosTableViewCell {
    private func setupUI() {
      
        self.contentView.addSubview(collectionView)
        addSubview(textPhoto)
        addSubview(arrow)

        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 190),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: 387),
            collectionView.heightAnchor.constraint(equalToConstant: 128),
            
            textPhoto.leftAnchor.constraint(equalTo: collectionView.leftAnchor, constant: 12),
            textPhoto.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 12),
            textPhoto.widthAnchor.constraint(equalToConstant: 55),
            
            arrow.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: -12),
            arrow.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 12),
            arrow.widthAnchor.constraint(equalToConstant: 20),
            arrow.heightAnchor.constraint(equalToConstant: 12)
            
        ])
    }
    
}
extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picturesAPI.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! PhotosCollectionViewCell
        
      cell.backgroundColor = .red
        let data = picturesAPI[indexPath.row]
        cell.image.image = UIImage(named: "\(data.picture ?? "No data")")
        cell.layer.cornerRadius = 5
        return cell
    }
}

  
