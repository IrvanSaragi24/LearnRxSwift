//
//  ViewModel.swift
//  LearnRxSwift
//
//  Created by Irvan P. Saragi on 20/01/24.
//

import Foundation
import RxSwift
import RxCocoa


struct FoodViewModel{
  var items = PublishSubject<[Food]>()
  
  func fetcItems(){
   let foods = [
    Food(name: "Hamburger", image: "humberger"),
    Food(name: "Pizza", image: "pizza"),
    Food(name: "Salmon", image: "salmon"),
    Food(name: "Spagethi", image: "spaghetti"),
   ]
    
    items.onNext(foods)
    items.onCompleted()
  }
}
