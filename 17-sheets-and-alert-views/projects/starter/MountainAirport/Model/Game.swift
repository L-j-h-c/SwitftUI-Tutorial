/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

struct Game {
  let start = RGB()
  var target = RGB.random()
  var round = 1
  var scoreRound = 0
  var scoreTotal = 0

  /// Check the guess values of an RGB object against a target RGB object.
  /// Compute the score out of 100. Add bonus points to very high scores.
  ///   - parameters:
  ///     - guess: The RGB object with guess values.
  mutating func check(guess: RGB) {
    let difference = lround(guess.difference(target: target) * 100.0)
    scoreRound = 100 - difference
    if difference == 0 {
      scoreRound += 100
    } else if difference == 1 { scoreRound += 50 }
    scoreTotal += scoreRound
  }

  /// Start a new round with a random RGB target object.
  mutating func startNewRound() {
    round += 1
    scoreRound = 0
    target = RGB.random()
  }

  /// Start a new game: Reset total score to 0.
  mutating func startNewGame() {
    round = 0
    scoreTotal = 0
    startNewRound()
  }
}
