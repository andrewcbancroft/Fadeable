import UIKit

public protocol Fadeable {
    var alpha: CGFloat {get set}
    
    mutating func fadeIn(duration: NSTimeInterval, delay: NSTimeInterval, completion: (Bool) -> Void)
    mutating func fadeOut(duration: NSTimeInterval, delay: NSTimeInterval, completion: (Bool) -> Void)
}

public extension Fadeable {
    public mutating func fadeIn(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.alpha = 1.0
            }, completion: completion)	}
    
    public mutating func fadeOut(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
}

extension UIView: Fadeable {}
