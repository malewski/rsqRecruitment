//
//  PatientViewController.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 01/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import UIKit

protocol PatientViewDelegate: NSObject {
    func displayPatient(patientList: [Result])
    func showDrugs(drugs: [Drug])
}

class PatientViewController: UITableViewController {

    private var patientList = [Result]()
    private let customView = PatientView()
    private let patientPresenter = PatientPresenter(service: PatientService())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = customView
        self.patientPresenter.setViewDelegate(patientViewDelegate: self)
    }

}

extension PatientViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customView.cellIdentifier, for: indexPath) as! PatientViewCell
        if let age = patientList[indexPath.row].patient.age {
            cell.ageLabel.text = "Pacjent: wiek \(age)"
        }
        if let date = patientList[indexPath.row].date {
            cell.dateLabel.text = "Data recepty: \(date)"
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension PatientViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(patientList[indexPath.row])
        self.patientPresenter.selectPatient(patient: patientList[indexPath.row].patient)
    }
}

extension PatientViewController: PatientViewDelegate {

    func displayPatient(patientList: [Result]) {
        self.patientList = patientList
        self.tableView.reloadData()
    }

    func showDrugs(drugs: [Drug]) {
        let nextViewController = DrugViewController()
        nextViewController.drugs = drugs
        nextViewController.navigationController?.title = "Drugs"
        self.show(nextViewController, sender: nil)
    }

}
