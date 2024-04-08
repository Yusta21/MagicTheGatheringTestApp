//
//  GeneralConfigure.swift
//  MagicTheGatheringTestApp
//
//  Created by Noel H. Yusta on 4/4/24.
//

import Foundation
import UIKit

func generalConfigureButton(button:UIButton){
    
    button.layer.cornerRadius = 10
    button.layer.shadowOffset = CGSize(width: 0, height: 0)
    button.layer.shadowOpacity = 0.6
    button.layer.shadowRadius = 4.0
    button.layer.borderWidth = 2
    button.backgroundColor = UIColor.brown
    button.titleLabel?.textColor = UIColor.black
    button.layer.shadowColor = CGColor(red: 51, green: 153, blue: 255, alpha: 0.5)

}

func generalConfigureTableView(view:UITableView){
    view.layer.cornerRadius = 10
    view.layer.borderWidth = 2
    view.backgroundColor = UIColor.brown

}

func generalConfigureView(view:UIView){
    view.layer.cornerRadius = 10
    view.layer.shadowOffset = CGSize(width: 0, height: 0)
    view.layer.shadowOpacity = 0.6
    view.layer.shadowRadius = 4.0
    view.layer.borderWidth = 2
    view.backgroundColor = UIColor.brown
    view.layer.shadowColor = CGColor(red: 51, green: 153, blue: 255, alpha: 0.5)
}
