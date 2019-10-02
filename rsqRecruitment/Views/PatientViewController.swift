//
//  PatientViewController.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 01/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import UIKit

protocol PatientViewDelegate: class {
    func displayPatient(patientList: [Result])
    func showDrugs(drugs: [Drug])
}

class PatientViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear

        tableView.register(PatientViewCell.self, forCellReuseIdentifier: String(describing: PatientViewCell.self))
        return tableView
    }()

    private var patientList = [Result]()
    private let patientPresenter = PatientPresenter(service: PatientService())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.patientPresenter.setViewDelegate(patientViewDelegate: self)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

}

extension PatientViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.patientPresenter.selectPatient(patient: patientList[indexPath.row].patient)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension PatientViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PatientViewCell.self), for: indexPath) as! PatientViewCell
        if let age = patientList[indexPath.row].patient.age {
            cell.ageLabel.text = "Pacjent: wiek \(age)"
        }
        if let date = patientList[indexPath.row].date {
            cell.dateLabel.text = "Data recepty: \(date)"
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList.count
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
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

}
