//
//  CounterViewController.swift
//  GHActions
//
//  Created by Rafael Venetikides on 18/08/26.
//

import UIKit
import Combine

class CounterViewController: UIViewController {

  private var counterView = CounterView()
  private var viewModel: CounterViewModel
  private var cancellables = Set<AnyCancellable>()

  init(viewModel: CounterViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = counterView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBackground
    bindViewModel()
    counterView.increaseButton.addTarget(self, action: #selector(didTapIncreaseButton), for: .touchUpInside)
    counterView.decreseButton.addTarget(self, action: #selector(didTapDecreaseButton), for: .touchUpInside)
  }

  private func bindViewModel() {
    viewModel.$counterValue.sink { [weak self] value in
      self?.counterView.counterLabel.text = "\(value)"
    }
    .store(in: &cancellables)
  }

  @objc
  private func didTapIncreaseButton() {
    viewModel.increaseValue()
  }

  @objc
  private func didTapDecreaseButton() {
    viewModel.decreaseValue()
  }
}

