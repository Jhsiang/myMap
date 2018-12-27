//
//  SetArrViewController.swift
//  myMap
//
//  Created by Jim Chuang on 2018/12/26.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class SetArrViewController: UIViewController {

    var myCollectionView = UICollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        myCollectionView = UICollectionView(frame: self.view.bounds)
//        myCollectionView.delegate = self
//        myCollectionView.dataSource = self
        myCollectionView.register(Ball2CollectionViewCell.self, forCellWithReuseIdentifier: "cell_ball2")


    }
    


}
