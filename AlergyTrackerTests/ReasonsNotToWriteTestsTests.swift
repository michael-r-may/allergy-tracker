//
//  Created by Developer on 2016/06/25.
//  Copyright © 2016 Radical Robot. All rights reserved.
//

import XCTest

import AllergyTracker

class ReasonsNotToWriteTestsTests: XCTestCase {

    func testThatWeCanAlwaysFindAnExcuseNotToWriteTestsIfWeWantTo() {
        // given
        // when
        let excuse = ReasonsNotToWriteTests.giveMeAnExcuse()
        
        // then
        XCTAssertNotNil(excuse)
    }
    
}
