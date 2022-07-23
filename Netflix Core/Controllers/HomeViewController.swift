//
//  HomeViewController.swift
//  Netflix Core
//
//  Created by 杨程凯 on 2022/7/19.
//

import UIKit

// for home page, we have a swap horizontal hua chuang
class HomeViewController: UIViewController {
    
    // set a constant, for what will be the title of sections
    let sectionTitles: [String] = ["Trending Movies", "popular", "Trending Tv", "Upcoming Movies", "Top rated"]
    
    // we use a feed table to do this
    private let homeFeedTable: UITableView = {
        
        // register the table
//        let table = UITableView()
        
        // you yu wo men already has subviews, those small sections, so we don;t need another frame; groups needed be set
        let table = UITableView(frame: .zero, style: .grouped)
        
        // reuse settings, reuse identifier make it reusable
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // above is the default, now we register our customized cell
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier:CollectionViewTableViewCell.identifier)
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ke yi define every nav's background color
//        view.backgroundColor = .red
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        //self definition
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        // --> we add here
        configureNavbar()
        
        // if we want a very big blank in the title of the home page
//        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x:0, y: 0, width: view.bounds.width, height: 450))
        
        // we then go visulise the header photo, instead of black
        let headerView = HeroHeaderUIView(frame: CGRect(x:0, y: 0, width: view.bounds.width, height: 500))
        homeFeedTable.tableHeaderView = headerView
        
        getTrendingMovies()
    }
    
    // Logo and the header bar at the home page, remember add this func to the above code -->
    private func configureNavbar() {
    
        var image = UIImage(named: "logoImage")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        
        // you also have profile and account info at the up-right corner
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    
    
    // layout as well reset
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    // 与APICaller相呼应，用于提取数据到主页
    private func getTrendingMovies() {
        APICaller.shared.getTrendingMovies { results in
            
            // home 会做一个条件判断
            switch results {
            
            case .success(let MovieInterface):
                print(MovieInterface)
                
            case .failure(let error):
                print(error)
            
            }
        
        }
    }
    
    
}

    // extra settings for the table
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // how many sections we have in total, if we have this line of code, we could then change the below rowsinsection function to adjust the rows within sections
    // this part we define mannually, we can actually use the count of constant
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 20
//    }
    
    // because we define the subsection titles as constant, we also needs to define the numbers, or we face a fatal error
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    // how many rows in the the table with sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // for reuse the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        // for not return a null
//        cell.textLabel?.text = "Hello world"
//        return cell
        // above is what we demo the section inside a home page
        // now is the customized
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    // for section header height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // for section height set
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    
    }

    
    // actions for each section's header
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // display title for their own sections
        guard let header = view as? UITableViewHeaderFooterView else {return}
        // if it does, it return, or deprecated
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        // 建议收藏，用于小header的框框设计
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height:header.bounds.height)
        // lower case for titles
        header.textLabel?.text = header.textLabel?.text?.lowercased()
    }
    
    
    //title for subsections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    //scroll view
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX:0, y:min(0, -offset))
    }
    
    
}
