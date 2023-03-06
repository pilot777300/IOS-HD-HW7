//
//  ProfileViewController.swift
//  NavigTest
//
//  Created by Mac on 08.07.2022.
//

import UIKit
import StorageService
import iOSIntPackage
import CoreData


class ProfileViewController: UIViewController {
   
    lazy var topView: ProfileHeaderView = {
        let tv = ProfileHeaderView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var navbar = UINavigationBar(frame: .zero)
    var tableView = UITableView()
    public var postData = [Post]()
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        user.fullName = "Fake account"
        user.status = "Fake status"
        user.avatar = UIImage(named: "arrow.png") ?? UIImage(systemName: "person")!
        
        #else
        user.fullName = "Герой неба"
        user.status = "Отдыхаю"
        user.avatar = UIImage(named: "A330-300.jpg") ?? UIImage(systemName: "person")!
        #endif
        
        
        
          postData.append(Post(author: "Elon Musk", description: "Ну классный самолет. Ветерок на посадке только слишком сильно дунул", image: "A330-300.jpg", lokes: 12, views: 33))
        postData.append(Post(author: "Юрий Шевчук", description: "Всюду черти! надави брат, на педаль.", image: "Brothers.tiff", lokes: 50, views: 55))
        postData.append(Post(author: "Cергей Крокодилов", description: "Как тебе такое, Илон Маск?", image: "Boston.jpg", lokes: 132, views: 4567))
        postData.append(Post(author: "Donald Trump", description: "Wow!!! Wonderfull Kukuruznik", image: "Aeroplan.jpeg", lokes: 243, views: 427))
        
        setTableView()
        //addNavBar()
        setConstraints()
        
    }

        func setTableView() {
            tableView.frame = self.view.frame
            tableView.delegate = self
            tableView.dataSource = self
            view.addSubview(tableView)
            tableView.separatorColor = UIColor.black
            tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
            tableView.backgroundColor = .systemGray5
            tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Cell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.allowsSelection = true
        }
        func setConstraints() {
            let safeArea = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                
//                navbar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
//                navbar.topAnchor.constraint(equalTo: safeArea.topAnchor),
//                navbar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
//                navbar.heightAnchor.constraint(equalToConstant: 44),

               tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
               tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
               tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
            
            ])
        }
    func addNavBar () {

        navbar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navbar)
        let navItem = UINavigationItem(title: "Профиль")
        let addPictireButton = UIBarButtonItem(title: "Добавить фото", style: .done, target: nil, action: #selector(addPictireButtonPressed))
        navItem.rightBarButtonItem = addPictireButton
        navbar.setItems([navItem], animated: false)
        
      
        
    }
    @objc func addPictireButtonPressed() {
        
    }
    
    }
    
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PostTableViewCell
        else {fatalError()}
        
        let thePost = postData[indexPath.row]
        cell.views.text = "Views:\(thePost.views ?? 0)"
        cell.likes.text = "Likes:\(thePost.lokes ?? 0)"
        cell.postAuthor.text = thePost.author
        cell.postTxt.text = thePost.description
        cell.postImage.image = UIImage(named: "\(thePost.image ?? "No Data")")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray5
        view.status.text = user.fullName
        view.profileView.image = user.avatar
        view.newStatus.text = user.status
        let q = PhotosTableViewCell()
        let editButton = UIButton(frame: CGRect(x:0, y:190, width:400, height:150))
        editButton.addTarget(self, action: #selector(showGallery), for: UIControl.Event.touchUpInside)
        view.addSubview(q)
        view.addSubview(editButton)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return 320
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thePost = postData[indexPath.row]
        let vc = FavouritePostsViewController()
        let cdm = CoreDataManager()
    
        cdm.addNewPost(author: "\(thePost.author!)", text: "\(thePost.description!)")
        navigationController?.pushViewController(vc, animated: true)
        vc.tableView.reloadData()
    }
    
    @objc func showGallery(sender: UIButton) {
//       let vc = FavouritePostsViewController()
//       //   navigationController?.pushViewController(vc, animated: true)
//        let x = CoreDataManager()
//       let y = Post()
//        x.addNewPost(author: "y.author!", text: "y.description!")
//        vc.tableView.reloadData()
//        navigationController?.pushViewController(vc, animated: true)
    }
}

    

