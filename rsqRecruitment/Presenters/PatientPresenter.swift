//
//  PatientPresenter.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 02/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import Foundation

class PatientPresenter {

    private let patientService: PatientService
    weak private var patientViewDelegate: PatientViewDelegate?

    init(service: PatientService) {
        self.patientService = service
        self.getPatient()
    }

    func setViewDelegate(patientViewDelegate: PatientViewDelegate?){
        self.patientViewDelegate = patientViewDelegate
    }

    func getPatient() {
        patientService.getPatient { (result) in
            if let result = result {
                self.patientViewDelegate?.displayPatient(patientList: result)
            }
        }
    }

    func selectPatient(patient: Patient) {
        self.patientViewDelegate?.showDrugs(drugs: patient.drugs)
    }

}
