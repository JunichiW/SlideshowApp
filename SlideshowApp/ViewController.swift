//
//  ViewController.swift
//  SlideshowApp
//
//  Created by TDS-01-724 on 2021/05/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    //スライドショーに使用するタイマーを宣言
    var timer: Timer!
    //タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func back(_ sender: Any) {
        //表示している画像の番号を1減らす
        dispImageNo -= 1
        //表示している画像の番号をもとに画像を表示する
        displayImage()
        
    }
    @IBAction func next(_ sender: Any) {
        //表示している画像の番号を1増やす
        dispImageNo += 1
        //表示している画像の番号をもとに画像を表示する
        displayImage()
    }
    
    //表示している画像の番号
    var dispImageNo = 0
    //スライドショーさせる画像の配列を宣言
    let imageNameArray = [
        "boss",
        "junk",
        "spulse",
    ]
    
    //表示している画像の番号をもとに画像を表示する
    func displayImage(){
       
        //画像の番号が正常な範囲を指しているかチェック
        
        //範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0{
            dispImageNo = 2
        }
        
        //範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2{
            dispImageNo = 0
        }
        
        //表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        //画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    //selector: #selector(updatetimer(_:))で指定された関数
    //timeInterval: 2.0,repeats: trueで指定された通り2秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        //表示している画像の番号を1増やす
        dispImageNo += 1
        //表示している画像の番号をもとに画像を表示する
        displayImage()
       
    }
    
    @IBAction func play(_ sender: Any) {
        //再生中か停止しているかを判定
        if(timer == nil){
            //再生時の処理
            //タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            //再生/停止ボタンの名前を停止にかえる
            startButton.setTitle("停止", for: .normal)
            
            //戻るボタンと進むボタンをタップ不可にする
            backButton.isEnabled = false
            nextButton.isEnabled = false
            
        }else{
            //停止時の処理
            //タイマーを停止する
            timer.invalidate()
            
            //タイマーを削除しておく（timer.invalidateだけだとtimerがnilにならないため）
            timer = nil
            
            //再生停止ボタンの名前を再生に変える
            startButton.setTitle("再生", for: .normal)
            
            //戻るボタンと進むボタンをタップ可能にする
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
    
    }
    
    @IBAction func tapAction(_ sender: Any) {
        //segueを利用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のLargeimageViewControllerを取得する
        let largeimageViewController:LargeimageViewController = segue.destination as! LargeimageViewController
        //遷移先のLargeimageViewControllerで宣言しているsendImageにUIImageViewに表示された画像を代入して渡す
        largeimageViewController.sendImage = imageView.image!
        
        if self.timer != nil {
            self.timer.invalidate()  //タイマーを停止する
            // play() の self.timer == nil で判断するために、 self.timer = nil としておく
            self.timer = nil
            //戻るボタンと進むボタンをタップ可能にする
            backButton.isEnabled = true
            nextButton.isEnabled = true
            //再生停止ボタンの名前を再生に変える
            startButton.setTitle("再生", for: .normal)
        }
        }
    
    //遷移先から戻ってくるときに呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageViewに表示する画像を設定
        let image = UIImage(named: "boss")
        imageView.image = image
        // Do any additional setup after loading the view.
    }


}

