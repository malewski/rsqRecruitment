//
//  DrugPresenter.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 03/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

class DrugPresenter {

    private let view: DrugView

    init(view: DrugView, drugs: [Drug]) {
        self.view = view
        self.view.showDrugs(drugs: drugs)
    }

}
