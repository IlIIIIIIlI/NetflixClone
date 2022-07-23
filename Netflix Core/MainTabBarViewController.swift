//
//  ViewController.swift
//  Netflix Core
//
//  Created by 杨程凯 on 2022/7/19.
//

import UIKit

// remeber change the controller class
class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemYellow
        
        // we create some nav controller, for further push tiao zhuan
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        //for those navs, we have an icon for each
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "square.and.arrow.down")
        
        // for each nav button, we create a label description
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
        // if use system color, then the reverse is needed, fan zhuan se
        tabBar.tintColor = .label
        
        // set animate
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }


}

