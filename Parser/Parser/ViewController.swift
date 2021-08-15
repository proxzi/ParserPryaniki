//
//  ViewController.swift
//  Parser
//
//  Created by Dmitry on 11.08.2021.
//

import UIKit
import PinLayout

class ViewController: UIViewController {

    private let url = "https://pryaniky.com/static/json/sample.json"
    private let tableView = UITableView()
    private var someStruct: SomeStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: String(describing: DataTableViewCell.self))
        
        view.addSubview(tableView)
        
        tableView.tableFooterView = UIView()
        
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.pin.all()
        
    }
    
    
}

extension ViewController {
    
    private func fetchData() {
        NetworkRequest.sendRequest(url: self.url) { (someStruct) in
            self.someStruct = someStruct
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func showResult(with indexPath: IndexPath) {
        guard let someStruct = self.someStruct else { return }
        
        let str = someStruct.view[indexPath.row]
        var data: Datum?
        for item in someStruct.data {
            if item.name == str {
                data = item
                break
            }
        }
        guard let dataClass = data?.data else { return }
        debugPrint("[DEBUG DataClass: \n \(dataClass)]")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as? DataTableViewCell else { return .init()}
        cell.configure(with: self.someStruct?.view[indexPath.row] ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let someStruct = self.someStruct else { return 0}
        return someStruct.view.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showResult(with: indexPath)
    }
}
