//
//  SetArrayViewController.swift
//  myMap
//
//  Created by Jim Chuang on 2018/12/22.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class SetArrayViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {



    @IBOutlet var myCollectionView: UICollectionView!
    var myArray = [[5, 3, 5, 1, 1, 4],
                   [1, 3, 4, 1, 0, 3],
                   [3, 1, 0, 4, 3, 2],
                   [1, 5, 0, 5, 2, 5],
                   [3, 5, 4, 0, 4, 5]]
    var bottomArray = [Heart,Light,Dark,Water,Fire,Wood]
    var bottomColorArr = [HeartColor,LightColor,DarkColor,WaterColor,FireColor,WoodColor]
    var bottomImgStrArr = [ImageStrHeart,ImageStrLight,ImageStrDark,ImageStrWater,ImageStrFire,ImageStrWood]

    var selectColor:UIColor? = nil
    let headH:CGFloat = 40
    let footerH:CGFloat = 10
    
    @IBOutlet var colorIV: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self

    }

    override func viewDidAppear(_ animated: Bool) {

        myCollectionView.addGestureRecognizer(setLP())
    }

    func loadArray(arr:Array<Array<Int>>) -> Array<Array<Int>>?{
        guard arr.count == 5 else {
            return nil
        }

        for subArr in arr{
            guard subArr.count == 6 else{
                return nil
            }
        }
        let result = arr + [bottomArray]

        return result
    }

    //MARK: - Gesture
    func setLP() -> UILongPressGestureRecognizer{
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(sender:)))
        gesture.minimumPressDuration = 0.01
        return gesture
    }

    func setOTap() -> UITapGestureRecognizer{
        let gesture = UITapGestureRecognizer(target: self, action: #selector(whenTap(sender:)))
        return gesture
    }

    @objc func whenTap(sender:UITapGestureRecognizer){

    }

    @objc func longPressGesture(sender:UILongPressGestureRecognizer){
        switch sender.state {
        case .began:

            let senderLoc = sender.location(in: sender.view)
            if let startIndex = myCollectionView.indexPathForItem(at: senderLoc){
                if startIndex.section == 1{
                    if let image = UIImage(named: bottomImgStrArr[startIndex.row]) {
                        colorIV.backgroundColor = .clear
                        colorIV.image = image
                    }else{
                        colorIV.backgroundColor = bottomColorArr[startIndex.row]
                    }
                    selectColor = bottomColorArr[startIndex.row]
                }else if startIndex.section == 0,let setColor = selectColor{
                    let h = startIndex.row/6
                    let w = startIndex.row%6
                    if let ballNum = bottomColorArr.firstIndex(of: setColor){
                        myArray[h][w] = ballNum
                        myCollectionView.reloadItems(at: [startIndex])
                    }
                }
            }

        case .changed:

            let senderLoc = sender.location(in: sender.view)
            if let moveIndex = myCollectionView.indexPathForItem(at: senderLoc){
                if moveIndex.section == 0, let setColor = selectColor{
                    let h = moveIndex.row/6
                    let w = moveIndex.row%6
                    if let ballNum = bottomColorArr.firstIndex(of: setColor){
                        myArray[h][w] = ballNum
                        myCollectionView.reloadItems(at: [moveIndex])
                    }
                }
            }

        case .ended:
            break
        default:
            myCollectionView.cancelInteractiveMovement()
        }
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

    }

    //MARK: - Btn Click
    @IBAction func refreshClick(_ sender: UIBarButtonItem) {
        myArray = genStartArr(noComboArr: true)
        self.myCollectionView.reloadData()
    }

    @IBAction func loadBtnClick(_ sender: UIBarButtonItem) {
        Board.share.setOriArr(arr: myArray)
        self.performSegue(withIdentifier: "seque_setting_to_main", sender: nil)
    }

    //MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    // Header and Footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        // 建立 UICollectionReusableView
        var reusableView = UICollectionReusableView()

        // 顯示文字
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 40))
        label.textAlignment = .center
        label.tag = 888

        // header
        if kind == UICollectionElementKindSectionHeader
        {
            // 依據前面註冊設置的識別名稱 "Header" 取得目前使用的 header
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath)
            // 設置 header 的內容
            reusableView.backgroundColor = UIColor.darkGray
            if indexPath.section == 0{
                label.text = "Original"
            }else if indexPath.section == 1{
                label.text = "Selector"
            }
            label.textColor = UIColor.white

        }
        else if kind == UICollectionElementKindSectionFooter
        {
            // 依據前面註冊設置的識別名稱 "Footer" 取得目前使用的 footer
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer", for: indexPath)
            // 設置 footer 的內容
            reusableView.backgroundColor = UIColor.white
            //label.text = "Footer";
            label.textColor = UIColor.black

        }

        if reusableView.subviews.count == 0{
            reusableView.addSubview(label)
        }
        return reusableView
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sec1Count = myArray.reduce(0, {$0+$1.count})
        let sec2Count = bottomArray.count
        return section == 0 ? sec1Count : sec2Count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_set_array2", for: indexPath) as! Ball2CollectionViewCell

        if indexPath.section == 0{
            let h = indexPath.row / 6
            let w = indexPath.row % 6

            let colorNum = myArray[h][w]
            if let image = UIImage(named: bottomImgStrArr[colorNum]){
                cell.IV.image = image
                cell.IV.contentMode = .scaleAspectFit
            }

            cell.backgroundColor = .clear
            return cell

        }else{
            let colorNum = bottomArray[indexPath.row]

            if let image = UIImage(named: bottomImgStrArr[colorNum]){
                cell.IV.image = image
                cell.IV.contentMode = .scaleAspectFit
            }

            cell.backgroundColor = .clear
            return cell
        }
    }

    //MARK: - UICollectionViewDelegateFlowLayout
    // cell 尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totlH:CGFloat = collectionView.frame.height - 2*headH - 2*footerH
        let cellSize:CGSize = CGSize(width: myCollectionView.frame.width/6, height: totlH/6)
        return cellSize
    }

    // 左右間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }

    // 上下間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: self.myCollectionView.bounds.width, height: headH)
        return size
    }

    // Footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let size = CGSize(width: self.myCollectionView.bounds.width, height: footerH)
        return size
    }



}
