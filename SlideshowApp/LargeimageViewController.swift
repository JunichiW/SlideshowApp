//
//  LargeimageViewController.swift
//  SlideshowApp
//
//  Created by TDS-01-724 on 2021/05/30.
//

import UIKit

class LargeimageViewController: UIViewController {

    @IBOutlet weak var largeimageview: UIImageView!
   
    //UIImageViewに画像を受け取るためのプロパティ（変数）を宣言
    var sendImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タップされた画像をlargeimageviewに表示
        largeimageview.image = sendImage
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
