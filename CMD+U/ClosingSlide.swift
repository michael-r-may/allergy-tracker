import Foundation

struct ThankYou {
    let talk = TalkSummary(title: "Testing An Untested App", format: "Live Coding 😀")
    let speaker = Speaker(firstName: "Michael", lastName: "May", twitter: "@codermay")
    
    let appSource = GitHubRepo(sourceURL: NSURL(string: "https://github.com/radicalrobot/allergy-tracker")!, author: "Emily Toop")
}

struct GitHubRepo {
    let sourceURL: NSURL
    let author: String
}
