//
//  cardTableViewCell.swift
//  MagicTheGatheringTestApp
//
//  Created by Noel H. Yusta on 5/4/24.
//

import UIKit
import Kingfisher





class cardTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var imageCardView: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var backView: UIView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        generalConfigureView(view: backView)
       // backView.backgroundColor = UIColor.clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       
    }
    
    func setValues(name: String, type: String, imageUrl: URL?) {
        
        
        cardName.text = name
        cardType.text = type
        cardName.adjustsFontSizeToFitWidth = true
        cardType.adjustsFontSizeToFitWidth = true
        
           if let url = imageUrl {
               // Cargamos y almacenamos en caché la imagen utilizando Kingfisher
               imageCardView.kf.setImage(with: url)
           } else {
               // Si no hay una URL de imagen válida, establecemos la imagen a la del reverso
               imageCardView.image = UIImage(named: "magic high")
           }
    }
    
}
