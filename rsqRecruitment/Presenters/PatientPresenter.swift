//
//  PatientPresenter.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 02/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

class PatientPresenter {

    private let service: PatientService
    private let view: PatientViewController

    init(view: PatientViewController, service: PatientService) {
        self.view = view
        self.service = service
    }

    func viewDidLoad() {
        getPatient()
    }

    private func getPatient() {
        service.getPatient(
            success: { (data) in
            if let data = data {
                self.view.displayPatient(patientList: data)
            }
        }, failure: { (error) in
            print(error?.localizedDescription)
        })
    }

    func selectPatient(patient: Patient) {
        view.showDrugs(drugs: patient.drugs)
    }

}
