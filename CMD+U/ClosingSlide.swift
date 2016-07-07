import Foundation

struct ThankYou {
    let talk = TalkSummary(title:  "Testing An Untested App",
                           format: "Live Coding 😀")
    
    let speaker = Speaker(name: "Michael May",
                          twitter: "@codermay")
    
    let appSource = GitHubRepo(
        sourceURL:"https://github.com/radicalrobot/allergy-tracker",
        author: "Emily Toop")
    
    let apologiesToEU = (quote: "Ask most Londoners what we love about this city and we'll say one thing; it's diversity...Our city has not changed. It remains a place that cherishes human beings of all nationalities and ethnic backgrounds.", author: "Time Out Magazine")
}

struct GitHubRepo {
    let sourceURL: String
    let author: String
}
