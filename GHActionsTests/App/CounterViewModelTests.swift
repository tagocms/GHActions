//
//  CounterViewModelTests.swift
//  GHActions
//
//  Created by Rafael Venetikides on 18/08/26.
//

import Testing
@testable import GHActions

@Suite("Counter View Model Tests")
@MainActor
struct CounterViewModelTests {
  @Test
  func `counterValue is created with value 0`() async throws {
    let sut = CounterViewModel()

    #expect(sut.counterValue == 0)
  }

  @Test
  func `increaseValue increases counterValue by 1`() async throws {
    let sut = CounterViewModel()

    sut.increaseValue()

    #expect(sut.counterValue == 1)
  }

  @Test
  func `deceaseValue decreases counterValue by 1`() async throws {
    let sut = CounterViewModel()
    sut.increaseValue()
    try #require(sut.counterValue == 1)

    sut.decreaseValue()

    #expect(sut.counterValue == 0)
  }
}
