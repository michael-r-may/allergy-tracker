//
//  QuickActionsTests.swift
//  AllergyTracker
//
//  Created by Developer on 2016/06/25.
//  Copyright © 2016 Radical Robot. All rights reserved.
//

import XCTest

import AllergyTracker

class QuickActionsTests: XCTestCase {

    func testThatShortcutTitleIsCorrectForAGivenIncidentName() {
        // given
        let incidentName = "Cat"
        
        // when
        let shortcutName = QuickActions.shortcutTitleForIncidentName(incidentName)
        
        // then
        XCTAssertEqual(shortcutName, "Log Cat")
    }
    
}
