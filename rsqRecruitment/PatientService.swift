//
//  PatientService.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 02/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import Foundation

class PatientService {

    func getPatient(completion: @escaping ([Result]?) -> () ) {
        let url = URL(string: "https://api.fda.gov/drug/event.json?limit=10")!
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, response, error) -> Void in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(model.results)
                }
            } catch {
                print(error)
            }
        }

        task.resume()
    }

}
