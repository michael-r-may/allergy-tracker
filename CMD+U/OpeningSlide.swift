import Foundation
import CoreLocation

struct Event {
    let conference = Conference(name: "CMD+U", location: CLLocation(latitude: 40.33241, longitude: -0.194569), date: NSDate(timeIntervalSince1970: 1467972000000))
    
    let talk = TalkSummary(title: "Testing An Untested App", format: "Live Coding 😰")
    
    let speaker = Speaker(firstName: "Michael", lastName: "May", twitter: "@codermay")
}

struct TalkSummary {
    let title: String
    let format: String
}

struct Speaker {
    let firstName: String
    let lastName: String
    let twitter: String
}

struct Conference {
    let name: String
    let location: CLLocation
    let date: NSDate
}
