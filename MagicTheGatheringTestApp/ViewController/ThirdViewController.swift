//
//  ThirdViewController.swift
//  MagicTheGatheringTestApp
//
//  Created by Noel H. Yusta on 6/4/24.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardText: UILabel!
    @IBOutlet weak var cardRarity: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    
    var card: Card?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        generalConfigureView(view: cardView)
        generalConfigureButton(button: backButton)
        
        
        cardName.text = card?.name
        cardType.text = card?.type
        cardText.text = card?.text
        cardRarity.text = card?.rarity
        
        cardName.adjustsFontSizeToFitWidth = true
        cardText.adjustsFontSizeToFitWidth = true
        cardType.adjustsFontSizeToFitWidth = true
        cardRarity.adjustsFontSizeToFitWidth = true

        if let url = card?.imageUrl {
            // Cargamos y almacenamos en caché la imagen utilizando Kingfisher
            cardImage.kf.setImage(with: url)
        } else {
            // Si no hay una URL de imagen válida, establecer la imagen a la del reverso
            cardImage.image = UIImage(named: "magic high")
        }
        
    }
 
    

    @IBAction func backPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
