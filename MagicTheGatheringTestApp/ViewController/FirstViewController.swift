//
//  FirstViewController.swift
//  MagicTheGatheringTestApp
//
//  Created by Noel H. Yusta on 4/4/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var TextView: UILabel!
    @IBOutlet weak var cardButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.text = "Noel Hernández Yusta \n\nnoelyusta@hotmail.com \n\n4/4/2024"
        TextView.adjustsFontSizeToFitWidth = true
        generalConfigureButton(button: cardButton)

        cardButton.setTitle("Ver Cartas", for: .normal)
        cardButton.isEnabled = true
    }
    

  
    
    @IBAction func goToSecondViewControllerPressed(_ sender: Any) {
        print("buttonpressed")
        cardButton.titleLabel?.textColor = UIColor.white
        let secondViewController: SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
