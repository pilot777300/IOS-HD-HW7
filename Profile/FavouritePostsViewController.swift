//
//  FavouritePostsViewController.swift
//  NavigTest
//
//  Created by Mac on 01.03.2023.
//

import UIKit
import CoreData

class FavouritePostsViewController: UIViewController {

    var tableView =  UITableView()
    let coreManager = CoreDataManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setupConstraints()
       // tableView.reloadData()
    }
    fileprivate func setUpTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.allowsSelection = false
        tableView.separatorStyle = .singleLine
        
    }
    
    fileprivate func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
         
        
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }

}
extension FavouritePostsViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreManager.post1Data.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       let post = coreManager.post1Data[indexPath.row]
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")

        
        cell.textLabel?.text = post.author
        cell.detailTextLabel?.text = post.descript
        //tableView.reloadData()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            let post = coreManager.post1Data[indexPath.row]
            coreManager.deletePost(post: post)
            tableView.reloadData()
        }
    }
}
