//
//  ViewController.swift
//  LearnRxSwift
//
//  Created by Irvan P. Saragi on 19/01/24.
//

import UIKit
import RxSwift
import RxCocoa

let viewmodel = FoodViewModel()
class ViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    self.title = "Menu"
    tableView.frame = view.bounds
    tableViewItems()
  }
  
  let tableItem = Observable.just([
    Food(name: "Hamburger", image: "humberger"),
    Food(name: "Pizza", image: "pizza"),
    Food(name: "Salmon", image: "salmon"),
    Food(name: "Spagethi", image: "spaghetti")
  ])
  let disposeBag = DisposeBag()
  
  
  private let tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.register(FoodTableViewCell.self, forCellReuseIdentifier: FoodTableViewCell.identifier)
    return table
  }()
  
  
  func tableViewItems() {
    tableItem.bind(
      to: tableView
        .rx
        .items(cellIdentifier: FoodTableViewCell.identifier, cellType: FoodTableViewCell.self)){
          (tv, tableItems, cell) in
          cell.nameFood.text = tableItems.name
          cell.imageFood.image = UIImage.init(named: tableItems.image)
          
        }
        .disposed(by: disposeBag)
    
    tableView
      .rx.setDelegate(self)
      .disposed(by: disposeBag)
  }
}

extension ViewController: UITableViewDelegate, didtapRow {
  func didtapRow(_ cell: DetailViewController) {
    let vc = DetailViewController()
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}
