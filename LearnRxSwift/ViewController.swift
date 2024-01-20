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
  
  private var viewModel = ProductViewModel()
  private var bag = DisposeBag()
  
  private let tableView : UITableView = {
    let tablle = UITableView()
    tablle.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tablle
  }()
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.frame = view.bounds
    bindTableData()
 
  }
  
  func bindTableData() {
    //Binds items to table
    viewModel.items.bind(
      to: tableView.rx.items(
        cellIdentifier: "cell",
        cellType: UITableViewCell.self)
    ){ row, model , cell in
      cell.textLabel?.text = model.title
      cell.imageView?.image = UIImage(systemName: model.imageName)
    }.disposed(by: bag)
    
    //Bind a model selected handler
//    tableView.rx.modelSelected(Product.self).bind { product in
//      print(product.title)
//    }
    //fetch item
    viewModel.fetcItems()
    
  }
}

