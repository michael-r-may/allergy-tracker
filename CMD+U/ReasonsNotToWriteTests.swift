import Foundation

public enum ReasonsNotToWriteTests : String {
    
    case AFewMoreLinesWontHurt =
    "I mean, a few more lines of untested code won’t hurt, right?"
    
    case IllTestItMyself =
    "And it’s not really untested...because you’re gonna test it yourself anyway"
    
    case WritingTestsSlowsMeDown =
    "And writing tests would just slow you down"
    
    case MakesNoDifference =
    "And they’d make almost no difference either since there are no other tests. It’s like shining a candle from the top of a hill in the dead of night. Nobody sees it but you."
    
    case IllAddTestsLater =
    "...you know, you can always add the tests later, when you have more time."
    
    public static func giveMeAnExcuse() -> String {
        switch(arc4random() % 4) {
        case 0 : return AFewMoreLinesWontHurt.rawValue
        case 1 : return IllTestItMyself.rawValue
        case 2 : return WritingTestsSlowsMeDown.rawValue
        case 3 : return MakesNoDifference.rawValue
        default : return IllAddTestsLater.rawValue
        }
    }
}
