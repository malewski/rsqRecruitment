//
//  Drug.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 03/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

struct Drug: Decodable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "medicinalproduct"
    }
}
