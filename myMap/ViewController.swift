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
    @IBOutlet var slider: UISlider!


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

    var autoMoveStepArr = Array<Int>()
    var autoMoveStartLoc:Int? = nil

    var moveArr = Array<Array<Int>>()
    var startIndexPath = IndexPath()
    var diyStep = 0

    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stepLabel.numberOfLines = 0
        stepLabel.font = stepLabel.font.withSize(20)

        // Generate start array
        if let arr = Board.share.getOriArr(){
            myArray = arr
        }else{
            myArray = genStartArr(noComboArr: true)
        }

        DLog(message: "self.original Array  =>")
        for row in myArray{
            DLog(message: row)
        }

        myCollectionView.addGestureRecognizer(setLongPress())

    }
    
// MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_ball2", for: indexPath) as! Ball2CollectionViewCell

        let xAxis : Int = indexPath.item % 6
        let yAxis : Int = indexPath.item / 6
        let imageNameArr = ["heart.png","light.png","dark.png","water.png","fire.png","wood.png"]
        let colorNumber = myArray[yAxis][xAxis]
        if let imageName = imageNameArr[safe:colorNumber], let image = UIImage(named: imageName){
            cell.IV.image = image
            cell.IV.contentMode = .scaleAspectFit
        }
        cell.backgroundColor = .clear

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let com = comboCal(comboArray: myArray)
        stepLabel.text = "\(com) c"
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

//MARK: - Slider
    @IBAction func sliderChange(_ sender: UISlider) {
        let step:Float = 0.1
        sender.value = round(sender.value / step) * step
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
        sender.titleLabel?.alpha = 0.5
        sender.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
            var displayStepArray = Array<Int>()
            var displayStratLocation:Int
            var displayTotalCombo:Int
            var resultArr = [[Int]]()

            // 舊方法
            //(displayStepArray,displayStratLocation,displayTotalCombo,self.resultArr) = rotationFunc(inputArray: self.myArray)

            // 新方法
            (displayStepArray,displayStratLocation,displayTotalCombo,resultArr) = rotAlgo(inputArray: self.myArray)

            // 儲存自動步驟
            self.autoMoveStepArr = displayStepArray
            self.autoMoveStartLoc = displayStratLocation

            // 按鈕恢復
            sender.isEnabled = true
            sender.titleLabel?.alpha = 1

            // 文字顯示結果
            self.stepLabel.text = "\(displayTotalCombo)c \(displayStepArray.count)steps"
            //self.stepLabel.text = "Total Combo = \(displayTotalCombo), Start Location = \(displayStratLocation) \n\n step(\(displayStepArray.count)) = \(displayStepArray)"
        }
    }

    @IBAction func oriShowClick(_ sender: UIButton) {
        if let arr = Board.share.getOriArr(){
            myArray = arr
        }
        self.myCollectionView.reloadData()
    }

    @IBAction func resultShowClick(_ sender: UIButton) {
        if !self.autoMoveStepArr.isEmpty && autoMoveStartLoc != nil{
            self.doAutoMove()
        }else{
            let alert = UIAlertController(title: "錯誤", message: "資料為空", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "確認", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func refreshClick(_ sender: UIBarButtonItem) {
        myArray = genStartArr(noComboArr: true)
        myCollectionView.reloadData()
    }

//MARK: - My Func
    func doAutoMove(){

        // 取消使用者互動手勢
        myCollectionView.isUserInteractionEnabled = false

        // 獲得起啟位置
        var oriLoc = self.autoMoveStartLoc!

        // 獲得stepArr
        var stepArr = autoMoveStepArr.makeIterator()

        // 自動執行至stepArr 沒有資料
        let _ = Timer.scheduledTimer(withTimeInterval: Double(slider!.value), repeats: true) { (Timer) in
            if let i = stepArr.next(){
                self.myCollectionView.performBatchUpdates({

                    // 下一步位置
                    let nextLoc = oriLoc + i

                    // 資料交換
                    (self.myArray[oriLoc/6][oriLoc%6],self.myArray[nextLoc/6][nextLoc%6]) = (self.myArray[nextLoc/6][nextLoc%6],self.myArray[oriLoc/6][oriLoc%6])

                    // 開始位置
                    self.myCollectionView.beginInteractiveMovementForItem(at: IndexPath(item: oriLoc, section: 0))

                    // 獲得目標cell 位置
                    let cell = self.myCollectionView.cellForItem(at: IndexPath(item: nextLoc, section: 0))!
                    let movePoint = CGPoint(x: cell.frame.midX, y: cell.frame.midY)

                    // 移動至目標cell 動畫
                    self.myCollectionView.updateInteractiveMovementTargetPosition(movePoint)
                    self.myCollectionView.cancelInteractiveMovement()

                    // 更新下次位置
                    oriLoc = nextLoc

                }) { (done) in
                    if done{
                        // 每步動畫完成後 更新數據並顯示
                        self.myCollectionView.reloadData()
                    }
                }
            }else{
                // 使用者手勢互動恢復
                self.myCollectionView.isUserInteractionEnabled = true

                // 結束動畫
                Timer.invalidate()
            }
        }
    }

//MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {

        let image:UIImage! = info[UIImagePickerControllerOriginalImage] as? UIImage
        //let image2 = info[UIImagePickerControllerOriginalImage] as! UIImage
        let inputImageArray = imageToArray(imputImage: image)
        self.myArray = inputImageArray
        self.myCollectionView.reloadData()

        
        //退出
        picker.dismiss(animated: true, completion:nil)
    }

//MARK: - Gesture Recognizer
    // 設定長按手勢
    func setLongPress() -> UILongPressGestureRecognizer{
        let myLongPress = UILongPressGestureRecognizer(target: self, action: #selector(whenLongPress(sender:)))
        myLongPress.minimumPressDuration = 0.03
        return myLongPress
    }

    // 長按事件
    @objc func whenLongPress(sender:UILongPressGestureRecognizer){
        switch sender.state {
        case .began:
            if let selectIndexPath = myCollectionView.indexPathForItem(at: sender.location(in: sender.view!)){
                diyStep = 0
                startIndexPath = selectIndexPath
                myCollectionView.beginInteractiveMovementForItem(at: startIndexPath)
            }
            break
        case .changed:
            if let moveIndexPath = myCollectionView.indexPathForItem(at: sender.location(in: sender.view!)){
                if moveIndexPath == startIndexPath{
                    myCollectionView.updateInteractiveMovementTargetPosition(sender.location(in: sender.view!))
                }else{
                    diyStep += 1
                    // Array Swap
                    let moveW = moveIndexPath.row % 6
                    let moveH = moveIndexPath.row / 6
                    let starW = startIndexPath.row % 6
                    let starH = startIndexPath.row / 6
                    let swapValue = myArray[moveH][moveW]
                    myArray[moveH][moveW] = myArray[starH][starW]
                    myArray[starH][starW] = swapValue

                    // Update start location
                    //myCollectionView.reloadItems(at: [startIndexPath,moveIndexPath])
                    startIndexPath = moveIndexPath
                    myCollectionView.reloadData()

                    DispatchQueue.main.asyncAfter(deadline: .now()+0.001) {
                        self.myCollectionView.endInteractiveMovement()
                        self.myCollectionView.beginInteractiveMovementForItem(at: self.startIndexPath)
                        self.myCollectionView.updateInteractiveMovementTargetPosition(sender.location(in: sender.view!))
                    }
                }
            }
            break
        case .ended:
            myCollectionView.endInteractiveMovement()
            let com = comboCal(comboArray: myArray)
            stepLabel.text = "\(com) c , step = \(diyStep)"
            DLog(message: "\(com) c , step = \(diyStep)")
            break
        default:
            myCollectionView.cancelInteractiveMovement()
            break
        }
    }

    func updateClearUpArr(){

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

