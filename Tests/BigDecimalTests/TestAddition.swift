//
//  TestAddition.swift
//  BigDecimalTests
//
//  Created by Leif Ibsen on 06/05/2021.
//

//
// Test cases from General Decimal Arithmetic - speleotrove.com
//

import XCTest
@testable import BigDecimal

class TestAddition: XCTestCase {

    override func setUpWithError() throws {
        //BigDecimal.nanFlag = false
    }

    override func tearDownWithError() throws {
        //XCTAssertFalse(BigDecimal.nanFlag)
    }

    struct test {

        let x: String
        let y: String
        let result: String

        init(_ x: String, _ y: String, _ result: String) {
            self.x = x
            self.y = y
            self.result = result
        }
    }

    let tests1: [test] = [
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.42211023638922337114834538"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.4221102363892233711483454"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.422110236389223371148345"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.42211023638922337114835"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.4221102363892233711483"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.422110236389223371148"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.42211023638922337115"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.4221102363892233711"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.422110236389223371"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.42211023638922337"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.4221102363892234"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.422110236389223"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.42211023638922"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.4221102363892"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.422110236389"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.42211023639"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.4221102364"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.422110236"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.42211024"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.4221102"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.422110"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.42211"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.4221"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.422"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.42"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166.4"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "98471174166"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "9.847117417E+10"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "9.84711742E+10"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "9.8471174E+10"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "9.847117E+10"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "9.84712E+10"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "9.8471E+10"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "9.847E+10"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "9.85E+10"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "9.8E+10"),
        test("98471198160.56524417578665886060", "-23994.14313393939743548945165462", "1E+11"),
    ]

    func test1() throws {
        for i in 0 ..< tests1.count {
            let rnd = Rounding(.toNearestOrAwayFromZero, tests1.count - i)
            XCTAssertEqual(rnd.round(BigDecimal(tests1[i].x) + BigDecimal(tests1[i].y)).asString(), tests1[i].result)
            XCTAssertEqual(BigDecimal(tests1[i].x).add(BigDecimal(tests1[i].y), rnd).asString(), tests1[i].result)
        }
    }
    
    func test2() throws {
        let rnd = Rounding(.toNearestOrAwayFromZero, 16)
        XCTAssertEqual(rnd.round(BigDecimal("1E16") + BigDecimal("-5000000.000010001")).asString(), "9999999995000000")
        XCTAssertEqual(rnd.round(BigDecimal("1E16") + BigDecimal("-5000000.000000001")).asString(), "9999999995000000")
        XCTAssertEqual(BigDecimal("1E16").add(BigDecimal("-5000000.000010001"), rnd).asString(), "9999999995000000")
        XCTAssertEqual(BigDecimal("1E16").add(BigDecimal("-5000000.000000001"), rnd).asString(), "9999999995000000")
    }
    
    let tests3: [test] = [
        test("1", "1", "2"),
        test("2", "3", "5"),
        test("5.75", "3.3", "9.05"),
        test("5", "-3", "2"),
        test("-5", "-3", "-8"),
        test("-7", "2.5", "-4.5"),
        test("0.7", "0.3", "1.0"),
        test("1.25", "1.25", "2.50"),
        test("1.23456789", "1.00000000", "2.23456789"),
        test("1.23456789", "1.00000011", "2.23456800"),
        test("0.4444444444", "0.5555555555", "1.00000000"),
        test("0.4444444440", "0.5555555555", "1.00000000"),
        test("0.4444444444", "0.5555555550", "0.999999999"),
        test("0.44444444449", "0", "0.444444444"),
        test("0.444444444499", "0", "0.444444444"),
        test("0.4444444444999", "0", "0.444444444"),
        test("0.4444444445000", "0", "0.444444445"),
        test("0.4444444445001", "0", "0.444444445"),
        test("0.444444444501", "0", "0.444444445"),
        test("0.44444444451", "0", "0.444444445"),
        test("0", "1", "1"),
        test("1", "1", "2"),
        test("2", "1", "3"),
        test("3", "1", "4"),
        test("4", "1", "5"),
        test("5", "1", "6"),
        test("6", "1", "7"),
        test("7", "1", "8"),
        test("8", "1", "9"),
        test("9", "1", "10"),
        test("0.9998", "0.0000","0.9998"),
        test("0.9998", "0.0001","0.9999"),
        test("0.9998", "0.0002","1.0000"),
        test("0.9998", "0.0003","1.0001"),
        test("70", "10000e+9", "1.00000000E+13"),
        test("700", "10000e+9", "1.00000000E+13"),
        test("7000", "10000e+9", "1.00000000E+13"),
        test("70000", "10000e+9", "1.00000001E+13"),
        test("700000", "10000e+9", "1.00000007E+13"),
        test("10000e+9", "70", "1.00000000E+13"),
        test("10000e+9", "700", "1.00000000E+13"),
        test("10000e+9", "7000", "1.00000000E+13"),
        test("10000e+9", "70000", "1.00000001E+13"),
        test("10000e+9", "700000", "1.00000007E+13"),
    ]

    func test3() throws {
        let rnd = Rounding(.toNearestOrAwayFromZero, 9)
        for t in tests3 {
            XCTAssertEqual(rnd.round(BigDecimal(t.x) + BigDecimal(t.y)).asString(), t.result)
            XCTAssertEqual(BigDecimal(t.x).add(BigDecimal(t.y), rnd).asString(), t.result)
        }
    }

    let tests4: [test] = [
        test("10000e+9", "7", "10000000000007"),
        test("10000e+9", "70", "10000000000070"),
        test("10000e+9", "700", "10000000000700"),
        test("10000e+9", "7000", "10000000007000"),
        test("10000e+9", "70000", "10000000070000"),
        test("10000e+9", "700000", "10000000700000"),
        test("10000e+9", "7000000", "10000007000000"),
        test("12", "7.00", "19.00"),
        test("1.3", "-1.07", "0.23"),
        test("1.3", "-1.30", "0.00"),
        test("1.3", "-2.07", "-0.77"),
        test("1E+2", "1E+4", "1.01E+4"),
        test("1", "0.0001", "1.0001"),
        test("1", "0.00001", "1.00001"),
        test("1", "0.000001", "1.000001"),
        test("1", "0.0000001", "1.0000001"),
        test("1", "0.00000001", "1.00000001"),
        test("1", "0", "1"),
        test("1", "0.", "1"),
        test("1", ".0", "1.0"),
        test("1", "0.0", "1.0"),
        test("1", "0.00", "1.00"),
        test("0", "1", "1"),
        test("0.", "1", "1"),
        test(".0", "1", "1.0"),
        test("0.0", "1", "1.0"),
        test("0.00", "1", "1.00"),
        test("999999998", "1", "999999999"),
        test("999999999", "1", "1000000000"),
        test("99999999", "1", "100000000"),
        test("9999999", "1", "10000000"),
        test("999999", "1", "1000000"),
        test("99999", "1", "100000"),
        test("9999", "1", "10000"),
        test("999", "1", "1000"),
        test("99", "1", "100"),
        test("9", "1", "10"),
    ]
    
    func test4() throws {
        for t in tests4 {
            XCTAssertEqual((BigDecimal(t.x) + BigDecimal(t.y)).asString(), t.result)
        }
    }
    
    let tests5: [test] = [
        test("4.444444444444444", "0.5555555555555567", "5.000000000000001"),
        test("4.444444444444444", "0.5555555555555566", "5.000000000000001"),
        test("4.444444444444444", "0.5555555555555565", "5.000000000000001"),
        test("4.444444444444444", "0.5555555555555564", "5.000000000000000"),
        test("4.444444444444444", "0.5555555555555553", "4.999999999999999"),
        test("4.444444444444444", "0.5555555555555552", "4.999999999999999"),
        test("4.444444444444444", "0.5555555555555551", "4.999999999999999"),
        test("4.444444444444444", "0.5555555555555550", "4.999999999999999"),
        test("4.444444444444444", "0.5555555555555545", "4.999999999999999"),
        test("4.444444444444444", "0.5555555555555544", "4.999999999999998"),
        test("4.444444444444444", "0.5555555555555543", "4.999999999999998"),
        test("4.444444444444444", "0.5555555555555542", "4.999999999999998"),
        test("4.444444444444444", "0.5555555555555541", "4.999999999999998"),
        test("4.444444444444444", "0.5555555555555540", "4.999999999999998"),
    ]
    
    func test5() throws {
        let rnd = Rounding(.toNearestOrAwayFromZero, 16)
        for t in tests5 {
            XCTAssertEqual((rnd.round(BigDecimal(t.x) + BigDecimal(t.y))).asString(), t.result)
            XCTAssertEqual(BigDecimal(t.x).add(BigDecimal(t.y), rnd).asString(), t.result)
        }
    }
    
    func test6() throws {
        var x = BigDecimal.one + 1  // check mixed mode addition
        XCTAssertEqual(x, BigDecimal(2))
        
        var y = 1 + BigDecimal.one  // check mixed mode addition
        XCTAssertEqual(y, BigDecimal(2))
        
        x = BigDecimal.one - 2      // check mixed mode subtraction
        XCTAssertEqual(x, -BigDecimal(1))
        
        y = 1 - BigDecimal.one      // check mixed mode subtraction
        XCTAssertEqual(y, BigDecimal.zero)
        
        let z : BigDecimal = 1 + 1
        XCTAssertEqual(z, BigDecimal(2))
    }
}
