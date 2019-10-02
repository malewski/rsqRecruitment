//
//  Patient.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 02/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//


struct APIResponse: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let patient: Patient
    let date: String?

    enum CodingKeys: String, CodingKey {
        case patient
        case date = "receiptdate"
    }
}
struct Patient: Decodable {
    let age: String?
    let drugs: [Drug]

    enum CodingKeys: String, CodingKey {
        case age = "patientonsetage"
        case drugs = "drug"
    }
}

struct Drug: Decodable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "medicinalproduct"
    }
}
