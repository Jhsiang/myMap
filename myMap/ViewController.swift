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
    var startIndexPath = IndexPath()
    var diyStep = 0

    var showResultArr = false
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
        NSLog("self.original Array  = \n[\(myArray[0]),\n\(myArray[1]),\n\(myArray[2]),\n\(myArray[3]),\n\(myArray[4])]")

        myCollectionView.addGestureRecognizer(setLongPress())

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

    override func viewDidAppear(_ animated: Bool) {

    }
    
// MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_ball2", for: indexPath) as! Ball2CollectionViewCell

        let xAxis : Int = indexPath.item % 6
        let yAxis : Int = indexPath.item / 6
        var myImageViewName:String = ""
        let colorNumber = showResultArr ? resultArr[yAxis][xAxis] : myArray[yAxis][xAxis]

        switch colorNumber {
        case 0:
            myImageViewName = "heart.png"
        case 1:
            myImageViewName = "light.png"
        case 2:
            myImageViewName = "dark.png"
        case 3:
            myImageViewName = "water.png"
        case 4:
            myImageViewName = "fire.png"
        case 5:
            myImageViewName = "wood.png"
        default:
            myImageViewName = ""
        }
        cell.backgroundColor = .clear
        if let image = UIImage(named: myImageViewName){
            cell.IV.image = image
            cell.IV.contentMode = .scaleAspectFit
        }


        return cell
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var com = comboCal(comboArray: myArray)
        stepLabel.text = "\(com) c"
        print("\(com) c")
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
            var com = comboCal(comboArray: myArray)
            stepLabel.text = "\(com) c , step = \(diyStep)"
            print("\(com) c , step = \(diyStep)")


            /*
            if #available(iOS 10.0, *) {
                let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (myT) in
                    if com > 0{

                        self.myArray = clearUp(originalArray: self.myArray)
                        self.myCollectionView.reloadData()
                        com = comboCal(comboArray: self.myArray)
                    }else{

                        myT.invalidate()
                    }
                }
                timer.fire()
            } else {

            }
             */
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

