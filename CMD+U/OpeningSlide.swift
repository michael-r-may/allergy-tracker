import Foundation
import CoreLocation

struct Event {
    let conference = CMDU()
    let talk = TestingAnUntestedApp()
    let author = MichaelMay()
}

struct TestingAnUntestedApp {
    let title = "Testing An Untested App"
    let format = "Live Coding 😰"
}

struct MichaelMay {
    let name = "Michael May"
    let twitter = "@codermay"
}

struct CMDU {
    let eventName = "CMD+U Conference"
    let location = CLLocation(latitude: 40.33241, longitude: -0.194569)
    let date = NSDateComponents()
    
    init() {
        date.year = 2016
        date.month = 7
        date.day = 8
    }
}
