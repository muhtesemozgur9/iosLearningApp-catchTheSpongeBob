//
//  ViewController.swift
//  catchTheSpongeBob
//
//  Created by muhtesemozgur9 on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    var timer = Timer()
    var counter = 0
    var score = 0
    var imageView = UIImageView()
    var x = 50
    var y = 150
    let width = 100
    let height = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true;
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageClicked))
        imageView.addGestureRecognizer(gestureRecognizer)
        

        highScoreLabel.text = String(UserDefaults.standard.object(forKey: "highScore") as! Int)

        
    }
    

    
    @IBAction func startButtonClicked(_ sender: Any) {
        score = 0
        scoreLabel.text = String(score)
        counter = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(myTimerFunc), userInfo: nil, repeats: true)
    }
    
    
    @objc func myTimerFunc(){
        counter -= 1
        timeLeftLabel.text = "Time Left : \(counter)"
        if(counter == 0){
            timer.invalidate()
            let alert = UIAlertController(title: "GAME OVER", message: "Your Score is : \(score)", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert,animated:true,completion: nil)
            timeLeftLabel.text = "Time's Over!"
        }
        let randomInt = Int.random(in: 0..<9)
//        print("RandomInt => \(randomInt)")
        if randomInt == 0{
            
        }
        if randomInt == 1{
            x = 150
            y = 150
        }
        if randomInt == 2{
            x = 250
            y = 150
        }
        if randomInt == 3{
            x = 50
            y = 250
        }
        if randomInt == 4{
            x = 150
            y = 250
        }
        if randomInt == 5{
            x = 250
            y = 250
        }
        if randomInt == 6{
            x = 50
            y = 350
        }
        if randomInt == 7{
            x = 150
            y = 350
        }
        if randomInt == 8{
            x = 250
            y = 350
        }
        imageView.image = UIImage(named:"spongebob")
        imageView.frame = CGRect(x:x,y:y,width:width,height:height)
        view.addSubview(imageView)
    }
    
    @objc func imageClicked (){
        score += 1
        scoreLabel.text = String(score)
        if (UserDefaults.standard.object(forKey: "highScore") as? String) != nil{
            if Int(UserDefaults.standard.object(forKey: "highScore") as! String)! < score {	
                UserDefaults.standard.set(score, forKey: "highScore")
            }
        }else{
            UserDefaults.standard.set(score, forKey: "highScore")
        }
        
    }


}

