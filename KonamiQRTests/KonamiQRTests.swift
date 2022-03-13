//
//  KonamiQRTests.swift
//  KonamiQRTests
//
//  Created by Atsushi Nagase on 2022/03/14.
//

import XCTest
@testable import KonamiQR

class KonamiQRTests: XCTestCase {

    func testURL() throws {
        var url = KonamiURL(url: URL(string: "https://foo.bar/")!)
        XCTAssertNil(url)

        url = KonamiURL(url: URL(string: "https://member.konamisportsclub.jp/hoge.php")!)
        XCTAssertNil(url)

        url = KonamiURL(url: URL(string: "https://member.konamisportsclub.jp/login.php")!)
        XCTAssertNotNil(url)
        XCTAssertEqual(url, .login)

        url = KonamiURL(url: URL(string: "https://member.konamisportsclub.jp/digital_memberscard_barcode.php")!)
        XCTAssertNotNil(url)
        XCTAssertEqual(url, .qrcode)

        url = KonamiURL(url: URL(string: "https://member.konamisportsclub.jp/sp_error.php")!)
        XCTAssertNotNil(url)
        XCTAssertEqual(url, .error)
    }

}
