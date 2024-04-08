//
//  SecondViewController.swift
//  MagicTheGatheringTestApp
//
//  Created by Noel H. Yusta on 5/4/24.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
   
    

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var cardTableView: UITableView!
    
    
    var cards: [Card] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cardTableView.isHidden = true
        activityIndicator.isHidden = true
        cardTableView.delegate = self
        cardTableView.dataSource = self
        generalConfigureButton(button: backButton)
        generalConfigureButton(button: reloadButton)
       // generalConfigureTableView(view: cardTableView)

             fetchDataFromAPI()
    }
  
    //configuramos la tabla
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(cards[indexPath.row])
        let celda = tableView.dequeueReusableCell(withIdentifier: "cardTableViewCell", for: indexPath) as! cardTableViewCell
        
        celda.setValues(name: cards[indexPath.row].name ?? "",type: cards[indexPath.row].type ?? "",imageUrl: cards[indexPath.row].imageUrl)
        
        celda.selectionStyle = .none
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cardTableView.frame.height / 2.7
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let thirdViewController: ThirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        thirdViewController.card = cards[indexPath.row]
        self.navigationController?.pushViewController(thirdViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
           
            if let celda = tableView.cellForRow(at: indexPath) {
                celda.contentView.backgroundColor = UIColor.clear
            }
            
            
        }
    
 
  

    func fetchDataFromAPI() {
        cardTableView.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let apiUrl = "https://api.magicthegathering.io/v1/cards"
        
        // llamamos a la API con Alamofire
        AF.request(apiUrl)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: CardResponse.self) { response in
                switch response.result {
                case .success(let cardResponse):
                    // Almacenamos los datos en la variable cards
                    self.cards = cardResponse.cards
                    
                    // Actualizamos la tabla en el hilo principal
                    DispatchQueue.main.async {
                        self.cardTableView.reloadData()
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                        self.cardTableView.isHidden = false
                    }
                case .failure(let error):
                    // Manejamos el error según el código del error proporcionado en la documentación
                    switch error {
                    case let afError as AFError:
                        switch afError {
                        case .responseValidationFailed(reason: let reason):
                            switch reason {
                            case .unacceptableStatusCode(let code):
                                switch code {
                                case 400:
                                    self.showAlert(title: "Error \(code)", message: "Solicitud incorrecta: no pudimos procesar esa acción")
                                case 403:
                                    self.showAlert(title: "Error \(code)", message: "Has excedido el límite de tasa")
                                case 404:
                                    self.showAlert(title: "Error \(code)", message: "No se pudo encontrar el recurso solicitado")
                                case 500:
                                    self.showAlert(title: "Error \(code)", message: "Tuvimos un problema con nuestro servidor. Por favor, inténtalo de nuevo más tarde")
                                case 503:
                                    self.showAlert(title: "Error \(code)", message: "Estamos temporalmente fuera de servicio por mantenimiento. Por favor, inténtalo de nuevo más tarde")
                                default:
                                    // Error fuera de los códigos proporcionados por la documentación
                                    self.showAlert(title: "Error \(code)", message: "Error inesperado")
                                }
                            default:
                                // Mensaje de error genérico
                                self.showAlert(title: "Error", message: "Error de validación de respuesta")
                            }
                        default:
                            // Mensaje de error genérico
                            self.showAlert(title: "Error", message: "Error al procesar la respuesta")
                        }
                    default:
                        // Mensaje de error genérico
                        self.showAlert(title: "Error", message: error.localizedDescription)
                    }
                    
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
    }

    
        
        // alerta con un botón de cancelar
        func showAlert(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }

    


    @IBAction func backPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func reloadPressed(_ sender: Any) {
        
        fetchDataFromAPI()
        
    }
}


