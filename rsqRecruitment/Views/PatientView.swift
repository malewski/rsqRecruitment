//
//  PatientView.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 01/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import UIKit

class PatientView: UITableView {
    
    let cellIdentifier = "patientCell"

    init() {
        super.init(frame: .zero, style: .plain)
        register(PatientViewCell.self, forCellReuseIdentifier: cellIdentifier)
        setupTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupTableView() {
        self.separatorColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: self.topAnchor),
            leftAnchor.constraint(equalTo: self.leftAnchor),
            rightAnchor.constraint(equalTo: self.rightAnchor),
            bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}

class PatientViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Pacjent: wiek nieznany"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Data recepty: nieznana"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupView() {
        addSubview(cellView)
        cellView.addSubview(ageLabel)
        cellView.addSubview(dateLabel)

        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
            ])

        NSLayoutConstraint.activate([
            ageLabel.heightAnchor.constraint(equalToConstant: 50),
            ageLabel.widthAnchor.constraint(equalToConstant: 250),
            ageLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20),
            ageLabel.topAnchor.constraint(equalTo: cellView.topAnchor)
            ])

        NSLayoutConstraint.activate([
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
            dateLabel.widthAnchor.constraint(equalToConstant: 250),
            dateLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20),
            dateLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor)
            ])
    }
}
