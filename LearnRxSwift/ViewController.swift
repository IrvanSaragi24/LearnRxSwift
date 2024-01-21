//
//  ViewController.swift
//  LearnRxSwift
//
//  Created by Irvan P. Saragi on 19/01/24.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  let tableItem = Observable.just(["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"])
  let disposeBag = DisposeBag()
  
  private let tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.frame = view.bounds
    tableViewItems()
  }

  func tableViewItems() {
    tableItem.bind(
      to: tableView
        .rx
        .items(cellIdentifier: "cell")) {
      (tv, tableItems, cell) in cell.textLabel?.text = tableItems
    }
    .disposed(by: disposeBag)
  }
}

