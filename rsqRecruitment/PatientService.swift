//
//  PatientService.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 02/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import Foundation

protocol DownloadPatient {
    func download(success: @escaping ([PatientData]?) -> Void, failure: @escaping (Error?) -> Void)
}

class PatientService {

    private let url = URL(string: "https://api.fda.gov/drug/event.json?limit=10")!
    private let session = URLSession(configuration: URLSessionConfiguration.default)
}

extension PatientService: DownloadPatient {

    func download(success: @escaping ([PatientData]?) -> Void, failure: @escaping (Error?) -> Void) {
        let task = session.dataTask(with: url) { (data, response, error) -> Void in
            guard error == nil else {
                failure(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(PatientsList.self, from: data)
                DispatchQueue.main.async {
                    success(model.results)
                }
            } catch let error {
                failure(error)
            }
        }
        task.resume()
    }

}
