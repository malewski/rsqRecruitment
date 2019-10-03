//
//  Patient.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 02/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

struct Patient: Decodable, Equatable {
    let age: String?
    let drugs: [Drug]

    enum CodingKeys: String, CodingKey {
        case age = "patientonsetage"
        case drugs = "drug"
    }
}
