//
//  CounterView.swift
//  GHActions
//
//  Created by Rafael Venetikides on 18/08/26.
//

import UIKit
import SnapKit

final class CounterView: UIView {
  private(set) lazy var increaseButton: UIButton = {
    let buttonConfig = UIButton.Configuration.plain()
    var imageConfig = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 28, weight: .bold))
    let buttonImage = UIImage(systemName: "plus", withConfiguration: imageConfig)

    let view = UIButton(configuration: buttonConfig)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setImage(buttonImage, for: .normal)
    view.tintColor = .systemGreen

    return view
  }()

  private(set) lazy var decreseButton: UIButton = {
    let buttonConfig = UIButton.Configuration.plain()
    var imageConfig = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 28, weight: .bold))
    let buttonImage = UIImage(systemName: "minus", withConfiguration: imageConfig)

    let view = UIButton(configuration: buttonConfig)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setImage(buttonImage, for: .normal)
    view.tintColor = .systemRed

    return view
  }()

  private(set) lazy var counterLabel: UILabel = {
    let view = UILabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.font = .systemFont(ofSize: 42, weight: .bold)
    view.textAlignment = .center
    view.textColor = .label
    view.numberOfLines = 0

    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupViewHierarchy()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViewHierarchy() {
    addSubview(increaseButton)
    addSubview(decreseButton)
    addSubview(counterLabel)
  }

  private func setupConstraints() {
    counterLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview()
      make.leading.lessThanOrEqualToSuperview()
    }

    increaseButton.snp.makeConstraints { make in
      make.centerX.equalTo(counterLabel.snp.centerX)
      make.bottom.equalTo(counterLabel.snp.top).offset(-75)
      make.leading.lessThanOrEqualToSuperview()
    }

    decreseButton.snp.makeConstraints { make in
      make.centerX.equalTo(counterLabel.snp.centerX)
      make.top.equalTo(counterLabel.snp.bottom).offset(75)
      make.leading.lessThanOrEqualToSuperview()
    }
  }
}
