//
//  DrugViewController.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 02/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import UIKit

protocol DrugView: class {
    func showDrugs(drugs: [Drug])
}

class DrugViewController: UITableViewController {

    var drugs: [Drug] = []
    var presenter: DrugPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 0.94, green: 0.86, blue: 0.76, alpha: 1.0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "drugCell")
    }

}

extension DrugViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drugs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drugCell", for: indexPath)
        cell.textLabel?.text = drugs[indexPath.row].name
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .darkGray
        cell.backgroundColor = UIColor(red: 0.94, green: 0.86, blue: 0.76, alpha: 1.0)
        return cell
    }

}

extension DrugViewController: DrugView {
    
    func showDrugs(drugs: [Drug]) {
        self.drugs = drugs
        tableView.reloadData()
    }

}
