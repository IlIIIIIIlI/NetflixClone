//
//  CollectionViewTableViewCell.swift
//  Netflix Core
//
//  Created by 杨程凯 on 2022/7/20.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    // after home controllers, we now define the sections inside the home page
    static let identifier = "CollectionViewTableViewCell"
    
    // zan men every section has horizontally nav.
    private let collectionView: UICollectionView = {
        // jiang qi define wei flow lei xing
        let layout = UICollectionViewFlowLayout()
        
        // if we have this code, we can make sure those items are horizontally movable, as each one takes up for one row
        layout.itemSize = CGSize(width: 140, height: 200)
        
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    //initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        // this step is quite same to the home one
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // implement a utilization, idk what this for ...
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // this is important, we need subview frame to make it visible
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
}

// if this is missed, 32 and 33 will bao cuo, because you don't have the types
extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    // decide how many object/item in each sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
