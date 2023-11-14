//
//  LoadingViewController.swift
//  pots-n-pans
//
//  Created by Gabriel Hübner on 11/14/23.
//

import UIKit

class LoadingViewController: UIViewController {
    var uploadedImage : String = ""
    
    let apiUrl = "https://api.runpod.ai/v2/mi1w7cfskbr6up/runsync"
    let apiKey = ApiKeys.ApiKey

    override func viewDidLoad() {
        super.viewDidLoad()
        sendRequestAndPerformSegue()
        
    }
    func sendRequestAndPerformSegue() {
            let base64Image = uploadedImage
            
            guard let url = URL(string: apiUrl) else {
                print("Invalid URL")
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(apiKey, forHTTPHeaderField: "Authorization")

            let requestBody: [String: Any] = [
                "input": [
                    "img": base64Image,
                    "threshold": 0.3
                ] as [String : Any]
            ]
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])

                request.httpBody = jsonData

                URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data, error == nil else {
                        print("Error: \(error?.localizedDescription ?? "Unknown error")")
                        return
                    }

                    if let dataString = String(data: data, encoding: .utf8) {
                            print("Raw Data: \(dataString)")
                        } else {
                            print("Unable to convert data to string.")
                        }
                    do {
                        
                        let responseObject = try JSONDecoder().decode(ResponseModel.self, from: data)

                        DispatchQueue.main.async {
                            if let recipesViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecipesViewController") as? RecipesViewController {
                                                    recipesViewController.responseObject = responseObject

                                                    self.present(recipesViewController, animated: true, completion: nil)
                                                }
                                        }

                    } catch {
                        print("Error parsing JSON: \(error.localizedDescription)")
                    }
                }.resume()

            } catch {
                print("Error creating JSON: \(error.localizedDescription)")
            }
        }

    }


