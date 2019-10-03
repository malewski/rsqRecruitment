//
//  PatientData.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 03/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

struct PatientData: Decodable, Equatable {
    let patient: Patient
    let date: String?

    enum CodingKeys: String, CodingKey {
        case patient
        case date = "receiptdate"
    }
}
