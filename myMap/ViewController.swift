//
//  ViewController.swift
//  myMap
//
//  Created by Jim Chuang on 2017/8/29.
//  Copyright © 2017年 test. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet var myCollectionView: UICollectionView!

    @IBOutlet var stepLabel: UILabel!


    let fullScreenSize = UIScreen.main.bounds.size
    var myArray3: Array =  [[2, 3, 1, 5, 3, 4], //difficult arr
                           [5, 2, 4, 3, 2, 2],
                           [4, 5, 4, 3, 5, 1],
                           [0, 3, 0, 4, 4, 3],
                           [5, 4, 3, 1, 0, 3]]
    var myArray: Array =  [[5, 3, 5, 1, 1, 4],
                            [1, 3, 4, 1, 0, 3],
                            [3, 1, 0, 4, 3, 2],
                            [1, 5, 0, 5, 2, 5],
                            [3, 5, 4, 0, 4, 5]]
    var resultArr = Array<Array<Int>>()

    var moveArr = Array<Array<Int>>()
    var startMovePoint:CGPoint? = nil

    var showResultArr = false
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stepLabel.numberOfLines = 0
        stepLabel.font = stepLabel.font.withSize(20)

        // Generate start array
        myArray = genStartArr(noComboArr: true)
        NSLog("self.original Array  = \n[\(myArray[0]),\n\(myArray[1]),\n\(myArray[2]),\n\(myArray[3]),\n\(myArray[4])]")

        let autoClick = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                NSLog("trigger start")
                let myBtn = UIButton()
                self.rotationClick(myBtn)
                NSLog("trigger end")
            }
        }
        //autoClick()

    }
    
// MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BallCollectionViewCell

        cell.addGestureRecognizer(setPan())

        let xAxis : Int = indexPath.item % 6
        let yAxis : Int = indexPath.item / 6
        var myColor : UIColor = UIColor.clear
        let colorNumber = showResultArr ? resultArr[yAxis][xAxis] : myArray[yAxis][xAxis]

        switch colorNumber {
        case 0:
            myColor = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
        case 1:
            myColor = UIColor.yellow
        case 2:
            myColor = UIColor(red: 0.4, green: 0.0, blue: 0.3, alpha: 1)//UIColor.purple
        case 3:
            myColor = UIColor.blue
        case 4:
            myColor = UIColor.red
        case 5:
            myColor = UIColor.green
        default:
            myColor = UIColor.clear
        }
        
        cell.backgroundColor = myColor
        cell.numLabel.text = "\(colorNumber)"

        if let sp = startMovePoint{
            let myIndex = Int(sp.x * 6 + sp.y)
            if indexPath.row == myIndex{
                let cellIV = UIImageView(frame: cell.bounds)
                cellIV.backgroundColor = UIColor.black
                cellIV.alpha = 0.3
                cellIV.tag = 99
                cell.addSubview(cellIV)
            }else{
                for sub in cell.subviews{
                    if sub.tag == 99{
                        sub.removeFromSuperview()
                    }
                }
            }
        }else{
            for sub in cell.subviews{
                if sub.tag == 99{
                    sub.removeFromSuperview()
                }
            }
        }

        return cell
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

//MARK: - UICollectionViewDelegateFlowLayout
    // cell 尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGSize = CGSize(width: myCollectionView.frame.width/6, height: collectionView.frame.height/5)
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
    
//MARK: - Button click
    @IBAction func loadPicBtn(_ sender: UIBarButtonItem)
    {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func rotationClick(_ sender: UIButton) {
        print("rotation btn click")
        sender.titleLabel?.alpha = 0.5
        sender.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
            var displayStepArray = Array<Int>()
            var displayStratLocation:Int
            var displayTotalCombo:Int
            //(displayStepArray,displayStratLocation,displayTotalCombo,self.resultArr) = rotationFunc(inputArray: self.myArray)
            (displayStepArray,displayStratLocation,displayTotalCombo,self.resultArr) = rotAlgo(inputArray: self.myArray)
            sender.isEnabled = true
            sender.titleLabel?.alpha = 1
            self.stepLabel.text = "Total Combo = \(displayTotalCombo), Start Location = \(displayStratLocation) \n\n step(\(displayStepArray.count)) = \(displayStepArray)"
        }
    }

    @IBAction func oriShowClick(_ sender: UIButton) {
        showResultArr = false
        self.myCollectionView.reloadData()
    }

    @IBAction func resultShowClick(_ sender: UIButton) {
        if resultArr.count == 5{
            showResultArr = true
            self.myCollectionView.reloadData()
        }else{
            let alerView = UIAlertView(title: "錯誤", message: "資料為空", delegate: self, cancelButtonTitle: "確認")
            alerView.show()
        }
    }

    @IBAction func refreshClick(_ sender: UIBarButtonItem) {
        myArray = genStartArr(noComboArr: true)
        myCollectionView.reloadData()
    }

//MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {

        let image:UIImage! = info[UIImagePickerControllerOriginalImage] as! UIImage
        let inputImageArray = imageToArray(imputImage: image)
        self.myArray = inputImageArray
        self.myCollectionView.reloadData()

        
        //退出
        picker.dismiss(animated: true, completion:nil)
    }

    // 設定拖曳手勢
    func setPan() ->UIPanGestureRecognizer{
        let myPan = UIPanGestureRecognizer(target: self, action: #selector(whenPan))
        myPan.maximumNumberOfTouches = 1
        myPan.minimumNumberOfTouches = 1
        return myPan
    }

    // 設定點擊一次手勢
    func setOTap() -> UITapGestureRecognizer{
        let myTap = UITapGestureRecognizer(target: self, action: #selector(whenOTap(sender:)))
        myTap.numberOfTapsRequired = 1
        return myTap
    }

    // 設定點擊四次手勢
    func setDTap() -> UITapGestureRecognizer{
        let myTap = UITapGestureRecognizer(target: self, action: #selector(whenDTap(sender:)))
        myTap.numberOfTapsRequired = 4
        return myTap
    }

    // 設定長按手勢
    func setLongPress() -> UILongPressGestureRecognizer{
        let myLongPress = UILongPressGestureRecognizer(target: self, action: #selector(whenLongPress(sender:)))
        myLongPress.minimumPressDuration = 0.8
        return myLongPress
    }

    // 長按事件
    @objc func whenLongPress(sender:UILongPressGestureRecognizer){

        // 長按顯示尺寸圖
        if sender.state == UIGestureRecognizer.State.began{
            if let size = sender.view?.bounds.size{

                // 尺寸視窗
                let sizeView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
                sizeView.backgroundColor = .black

                // 高度標籤
                let hLabel = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height/2))
                hLabel.textColor = .white
                hLabel.text = "↕︎\(size.height)↕︎"
                hLabel.minimumScaleFactor = 0.2
                hLabel.font = hLabel.font.withSize(40)
                hLabel.adjustsFontSizeToFitWidth = true

                // 長度標籤
                let wLabel = UILabel(frame: CGRect(x: 0, y: size.height/2, width: size.width, height: size.height/2))
                wLabel.textColor = .white
                wLabel.text = "↔︎\(size.width)↔︎"
                wLabel.minimumScaleFactor = 0.2
                wLabel.font = wLabel.font.withSize(40)
                wLabel.adjustsFontSizeToFitWidth = true

                sizeView.addSubview(hLabel)
                sizeView.addSubview(wLabel)

                sender.view?.addSubview(sizeView)
            }
        }

        // 放開刪除尺寸圖
        if sender.state == UIGestureRecognizer.State.ended{
            for sizeLabelView in sender.view!.subviews{
                sizeLabelView.removeFromSuperview()
            }
        }
    }

    // 拖曳事件
    @objc func whenPan(sender:UIPanGestureRecognizer){
        // 根據旋轉角度 計算拖曳位置
        /*
        let nowCenter = sender.view!.center
        let tr = sender.translation(in: sender.view)
        let rot = sender.view!.transform
        sender.view!.center = CGPoint(x: nowCenter.x + tr.x * rot.a + tr.y * rot.c,
                                      y: nowCenter.y + tr.y * rot.d + tr.x * rot.b)
        sender.setTranslation(CGPoint.zero, in: self.view)
*/

        if sender.state == .began{
            let startCellLoc = sender.location(in: myCollectionView)

            let w = myCollectionView.bounds.width / 6
            let h = myCollectionView.bounds.height / 5
            let sW = Int(startCellLoc.x / w)
            let sH = Int(startCellLoc.y / h)

            let myPoint = CGPoint(x: sH, y: sW)
            startMovePoint = myPoint
            self.myCollectionView.reloadData()
        }

        if sender.state == UIGestureRecognizer.State.ended{
            startMovePoint = nil
            self.myCollectionView.reloadData()
        }

        if let sp = startMovePoint{
            let cellPos = sender.location(in: myCollectionView)
            let w = myCollectionView.bounds.width / 6
            let h = myCollectionView.bounds.height / 5
            let cellH = Int(cellPos.y / h)
            let cellW = Int(cellPos.x / w)
            let sH = Int(sp.x)
            let sW = Int(sp.y)


            if (sW != cellW || sH != cellH) && 0...4 ~= cellH && 0...5 ~= cellW{
                startMovePoint = CGPoint(x: cellH, y: cellW)
                let swapValue = myArray[sH][sW]
                myArray[sH][sW] = myArray[cellH][cellW]
                myArray[cellH][cellW] = swapValue

                DispatchQueue.main.async {
                    self.myCollectionView.reloadData()
                }
            }

        }

    }

    // 點擊P事件
    @objc func whenOTap(sender:UITapGestureRecognizer){
        // 長寬互換
        //let size = sender.view!.frame.size
        //sender.view!.frame.size = CGSize(width: size.height, height: size.width)
        //sender.view!.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi/2)

        // 旋轉90度
        //sender.view!.transform = sender.view!.transform.rotated(by: CGFloat.pi/2)

        let aa = sender.location(in: myCollectionView)

        print("nowCenter = ",aa)

    }

    // 連按四下事件
    @objc func whenDTap(sender:UITapGestureRecognizer){
        sender.view!.removeFromSuperview()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

