//
//  FoodTableViewCell.swift
//  LearnRxSwift
//
//  Created by Irvan P. Saragi on 21/01/24.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
  
  static let identifier = "cell"
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(nameFood)
    addSubview(imageFood)
    setConstraint()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let nameFood : UILabel = {
    let name = UILabel()
    name.text = "Name Food"
    name.font = .systemFont(ofSize: 16, weight: .semibold)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  let imageFood : UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "imagefood")
    image.clipsToBounds = true
    image.contentMode = .scaleAspectFill
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  
  func setConstraint(){
    NSLayoutConstraint.activate([
      imageFood.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      imageFood.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      imageFood.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      imageFood.widthAnchor.constraint(equalToConstant: 100),
      imageFood.heightAnchor.constraint(equalToConstant: 100),
      
      nameFood.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 2),
      nameFood.leadingAnchor.constraint(equalTo: imageFood.trailingAnchor, constant: 8),
      
    ])
  }
}
