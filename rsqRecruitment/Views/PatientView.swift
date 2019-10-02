//
//  PatientView.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 01/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import UIKit

class PatientViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.90, green: 0.71, blue: 0.49, alpha: 1.0)
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
        backgroundColor = UIColor(red: 0.94, green: 0.86, blue: 0.76, alpha: 1.0)
        addSubview(backView)
        backView.addSubview(ageLabel)
        backView.addSubview(dateLabel)

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            backView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            backView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
            ])

        NSLayoutConstraint.activate([
            ageLabel.heightAnchor.constraint(equalToConstant: 50),
            ageLabel.widthAnchor.constraint(equalToConstant: 250),
            ageLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20),
            ageLabel.topAnchor.constraint(equalTo: backView.topAnchor)
            ])

        NSLayoutConstraint.activate([
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
            dateLabel.widthAnchor.constraint(equalToConstant: 250),
            dateLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20),
            dateLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
            ])
    }
}
