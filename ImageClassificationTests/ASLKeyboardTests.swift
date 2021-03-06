//
//  ASLKeyboardTests.swift
//  ImageClassificationTests
//
//  Created by Ian Applebaum on 3/28/20.
//  Copyright © 2020 Y Media Labs. All rights reserved.
//

import XCTest
@testable import iASL
class ASLKeyboardTests: XCTestCase {
	var noteVC: CreateNoteVC?
	override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		noteVC = CreateNoteVC()
		noteVC?.textView.text = "T"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testKeyboardDelete() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		let keyboard = CameraBoard(target: noteVC!.textView)
		noteVC?.textView.inputView = keyboard
		DispatchQueue.main.async {
			keyboard.deleteChar {

				XCTAssert(keyboard.target!.hasText == false, "Has text")
			}
		}

    }
	func testTestAddReturn() {
		let keyboard = CameraBoard(target: noteVC!.textView)
		noteVC?.textView.inputView = keyboard
		DispatchQueue.main.async {
			keyboard.returnKeyPressed()
			XCTAssert(self.noteVC?.textView.text! == "T\n", "Return key pressed failed. Text = \(String(describing: self.noteVC?.textView.text!))")
		}
	}
//	func testAddASLText() {
//		let keyboard = Caboard(target: noteVC!.textView)
//		noteVC?.textView.inputView = keyboard
//		let image =
//		guard let buffer = CVImageBuffer.buffer(from: image) else {
//            return
//        }
//
//        previewView.image = image
//
//        DispatchQueue.global().async {
//            self.didOutput(pixelBuffer: buffer)
//        }
//	}
}
