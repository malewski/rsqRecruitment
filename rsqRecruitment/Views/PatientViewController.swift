//
//  PatientViewController.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 01/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import UIKit

protocol PatientView: class {
    func displayPatient(patientList: [PatientData])
    func showDrugs(drugs: [Drug])
}

class PatientViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.backgroundColor = UIColor(red: 0.94, green: 0.86, blue: 0.76, alpha: 1.0)
        tableView.register(PatientViewCell.self, forCellReuseIdentifier: String(describing: PatientViewCell.self))
        return tableView
    }()

    private var patientList: [PatientData] = []
    var presenter: PatientPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
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
        presenter.selectPatient(patient: patientList[indexPath.row].patient)
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
            cell.dateLabel.text = "Data recepty: \(date.convertDate())"
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList.count
    }
}

extension PatientViewController: PatientView {

    func displayPatient(patientList: [PatientData]) {
        self.patientList = patientList
        tableView.reloadData()
    }

    func showDrugs(drugs: [Drug]) {
        let nextViewController = DrugViewController()
        nextViewController.presenter = DrugPresenter(view: nextViewController, drugs: drugs)
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}

private extension String {
    func convertDate() -> String {
        let formater = DateFormatter()
        formater.dateFormat = "YYYYMMDD"
        let date = formater.date(from: self)
        formater.dateFormat = "DD.MM.YYYY"
        if let date = date {
            return formater.string(from: date)
        } else {
            return self
        }
    }
}
