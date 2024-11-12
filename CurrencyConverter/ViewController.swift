//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by XECE on 12.11.2024.
//


import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var cadLabel: UILabel!
    
    @IBOutlet weak var chfLabel: UILabel!
    
    @IBOutlet weak var gbpLabel: UILabel!
    
    @IBOutlet weak var jpyLabel: UILabel!
    
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func getRatesCliked(_ sender: Any) {
    
        
        // adım 1 = request- session  internete gidip urlye gitmek, istek yollamak
        // adım 2 = reponse - data  datayı almak
        // adım 3 = parsing- json serialization  aldığımız datayı işlemek
        //1adım
        let url = URL(string: "https://data.fixer.io/api/latest?access_key=21db029f3f55303ba9d1bc12f5a5cca5")
        
        //istek atıyoruz
        let session = URLSession.shared
        
        //closure
        let task = session.dataTask(with: url!) { (data, response, error ) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                //adım2
                if data != nil {
                    do {
                        
                        let jsonResponse  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        
                        
                        
                        //ASYNC
                        
                        DispatchQueue.main.async {
                            // Asenkron olarak yapılacak işlemler buraya gelecek
                            // Örneğin:
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                if let cad = rates["CAD"] as? Double {
                                    self.updateLabel(self.cadLabel, withText: "CAD: \(cad)")
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.updateLabel(self.chfLabel, withText: "CHF: \(chf)")
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.updateLabel(self.gbpLabel, withText: "GBP: \(gbp)")
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.updateLabel(self.jpyLabel, withText: "JPY: \(jpy)")
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.updateLabel(self.usdLabel, withText: "USD: \(usd)")
                                }
                                if let turkish = rates["TRY"] as? Double {
                                    self.updateLabel(self.tryLabel, withText: "TRY: \(turkish)")
                                }
                                
                            }
                        }
                    } catch {
                        print ("error")
                    }
                    
                }
                
            }
            
        }
        task.resume()
        
    }
    
    
    private func updateLabel(_ label: UILabel, withText newText: String) {
        if label.text != newText {
            label.text = newText
            startFlashingColor(label: label)
        }
    }

    private func startFlashingColor(label: UILabel) {
        // Yanıp sönme sayısı
        var flashCount = 0
        
        // Timer ile yanıp sönme efekti
        _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            flashCount += 1
            label.textColor = (label.textColor == .red) ? .black : .red // Renk değiştir

            // Belirli bir yanıp sönme sayısından sonra animasyonu durdur
            if flashCount >= 10 { // Örneğin 6 kez yanıp söndükten sonra durdur
                timer.invalidate() // Timer'ı durdur
                label.textColor = .red // Rengi kırmızıya sabitle
            }
        }
    }
        }
    

    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
  
        
    









