//
//  CounterViewModel.swift
//  GHActions
//
//  Created by Rafael Venetikides on 18/08/26.
//

import Combine

final class CounterViewModel {
  @Published private(set) var counterValue = 0

  func increaseValue() {
    if counterValue < 99 {
      counterValue += 1
    } else {
      counterValue = 0
    }
  }

  func decreaseValue() {
    guard counterValue > 0 else {
      return
    }
    counterValue -= 1
  }
}
