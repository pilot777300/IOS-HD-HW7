//
//  SceneDelegate.swift
//  NavigTest
//
//  Created by Mac on 07.07.2022.
//

import UIKit

import Firebase



class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
  
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        FirebaseApp.configure()
        
        let factory = MyLoginFactory()
              let loginInspector = factory.makeLoginInspector()
               let loginVC = LogInViewController()
               loginVC.loginDelegate = loginInspector
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController =  createTabBarController()
        self.window?.makeKeyAndVisible()
        Firebase.Auth.auth().addStateDidChangeListener { auth, user in
     
            if user == nil {
             //  print("USER NOT FOUND")
              //  self.showAuthController()
            }
        }
    }
    
    func showAuthController(){
        print("NO USER")
        let alert = UIAlertController(title: "Пользователь не найден!", message: "Зарегистрируйтесь", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .cancel, handler: nil))
        self.window?.rootViewController?.present(alert, animated: true)
        let lvc =  LogInViewController()
//       lvc.signUp = false
 
        
       // let newVC = LogInViewController()
        //self.window?.rootViewController?.navigationController?.pushViewController(newVC, animated: false)
    }
    
    func createFeedViewController() -> UINavigationController {
        let feedViewController =  ProfileViewController()//LogInViewController()
        
        feedViewController.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)
        return UINavigationController(rootViewController: feedViewController)
    }
    
    func createProfileViewController() -> UINavigationController {
   let profileViewController = FeedViewController()
 
   profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
   return UINavigationController(rootViewController: profileViewController)
   }
    
    func createFafouriteController() -> UINavigationController {
        let favController = FavouritePostsViewController()
        favController.tabBarItem = UITabBarItem(title: "Избранные", image: UIImage(systemName: "heart"), tag: 2)
        return UINavigationController(rootViewController: favController)
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemGray4
        tabBarController.viewControllers = [createFeedViewController(), createProfileViewController(), createFafouriteController()]
        return tabBarController
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        do {
            try  Auth.auth().signOut()
        }catch {
            print(error.localizedDescription)
        }
        
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

