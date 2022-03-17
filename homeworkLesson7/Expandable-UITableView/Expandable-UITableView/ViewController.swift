//
//  ViewController.swift
//  Expandable-UITableView
//
//  Created by Светлана on 17.03.2022.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    private let customCellId = "customCellId"
    private let customHeaderId = "customHeaderId"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CustomCell.self, forCellReuseIdentifier: customCellId)
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: customHeaderId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
}

// MARK: - Private methods
extension ViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func expandSection(_ tag: Int) {
        let section = tag
        
        var indexPaths = [IndexPath]()
        for row in sectionsModels[section].data.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isOpen = sectionsModels[section].isOpen
        sectionsModels[section].isOpen = !isOpen
        
        if isOpen {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellId, for: indexPath) as! CustomCell
        
        let model = sectionsModels[indexPath.section].data[indexPath.row]
        cell.configureCell(title: model.title, imageString: model.imageString, rating: model.rating)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: customHeaderId) as! CustomHeaderView
        let model = sectionsModels[section]
        header.configureHeader(title: model.title, buttonTag: section, buttonTappedCallback: expandSection)
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !sectionsModels[section].isOpen {
            return 0
        }
        return sectionsModels[section].data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
