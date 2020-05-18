import UIKit

extension UIView {
    func safeAreaTop(
        safeAreaView: UIView,
        constant: Float = 0,
        statusBar: Bool = false
    ) {
        let constraint = NSLayoutConstraint.safeAreaTop(
            safeAreaView: safeAreaView,
            otherView: self,
            constant: constant,
            statusBar: statusBar
        )
        constraint.isActive = true
    }
    
    func safeAreaBottom(
        safeAreaView: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.safeAreaBottom(
            safeAreaView: safeAreaView,
            otherView: self,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func insetConstraints(
        inSuperview superView: UIView,
        withInset inset: UIEdgeInsets? = nil
    ) {
        let constraints = NSLayoutConstraint.inset(
            view: self,
            inSuperview: superView,
            withInset: inset
        )
        constraints.active()
    }
    
    func topConstraint(
        parentView: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.top(
            firstView: self, secondView: parentView,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func leftConstraint(
        parentView: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.left(
            firstView: self, secondView: parentView,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func rightConstraint(
        parentView: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.right(
            firstView: self,
            secondView: parentView,
            constant: -constant
        )
        constraint.isActive = true
    }
    
    func bottomConstraint(
        parentView: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.bottom(
            firstView: self,
            secondView: parentView,
            constant: -constant
        )
        constraint.isActive = true
    }
    
    func overConstraint(
        topItem: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.over(
            topItem: topItem,
            bottomItem: self,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func aside(
        leftItem: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.aside(
            left: leftItem,
            right: self,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func heightConstraint(constant: Float = 0) {
        let constraint = NSLayoutConstraint.height(
            view: self,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func heightConstraintEqualTo(
        parentView: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.heightEqualTo(
            parentView: parentView,
            view: self,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func widthConstraint(constant: Float = 0) {
        let constraint = NSLayoutConstraint.width(
            view: self,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func widthConstraintEqualTo(
        parentView: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.widthEqualTo(
            parentView: parentView,
            view: self,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func aspectRadioConstraint(constant: Float) {
        let constraint = NSLayoutConstraint.aspectRadio(
            view: self,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func centerYConstraint(
        parentView: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.centerY(
            firstView: self,
            secondView: parentView,
            constant: constant
        )
        constraint.isActive = true
    }
    
    func centerXConstraint(
        parentView: UIView,
        constant: Float = 0
    ) {
        let constraint = NSLayoutConstraint.centerX(
            firstView: self,
            secondView: parentView,
            constant: constant
        )
        constraint.isActive = true
    }
}
