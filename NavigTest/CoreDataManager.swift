//
//  CoreDataManager.swift
//  NavigTest
//
//  Created by Mac on 01.03.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    
    static let shared = CoreDataManager()
    init() {
        reloadPosts()
    }
    
    lazy var persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "favPost")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo) ")
                
            }
            
        })
        return container
    }()
    
    func saveContext() {
        let context = persistantContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
               let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo) ")
            }
        }
    }
    
    // posts
    var post1Data: [Post1] = []
    
    
    func reloadPosts() {
        let request = Post1.fetchRequest()
        let posts = (try? persistantContainer.viewContext.fetch(request)) ?? []
        self.post1Data = posts
    }
    
    func addNewPost(author: String, text: String) {
        let post = Post1(context: persistantContainer.viewContext)
        post.author = author
        post.descript = text
        saveContext()
        reloadPosts()
    }
    
    func deletePost(post: Post1) {
        persistantContainer.viewContext.delete(post)
        saveContext()
        reloadPosts()
    }
}
