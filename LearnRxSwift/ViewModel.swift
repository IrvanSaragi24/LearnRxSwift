//
//  ViewModel.swift
//  LearnRxSwift
//
//  Created by Irvan P. Saragi on 20/01/24.
//

import Foundation
import RxSwift
import RxCocoa


struct ProductViewModel{
  var items = PublishSubject<[Product]>()
  
  func fetcItems(){
   let products = [
    Product(imageName: "house", title: "Home"),
    Product(imageName: "gear", title: "Settings"),
    Product(imageName: "person.circle", title: "Profile"),
    Product(imageName: "airplane", title: "Flights"),
    Product(imageName: "bell", title: "Activity"),
   ]
    
    items.onNext(products)
    items.onCompleted()
  }
}
