import UIKit

public extension NSLayoutConstraint {
    static func inset(
        view: UIView,
        inSuperview superView: UIView,
        withInset inset: UIEdgeInsets? = nil
    ) -> [NSLayoutConstraint] {
        return [
            .top(
                firstView: superView,
                secondView: view,
                constant: -Float(inset?.top ?? 0)
            ),
            .left(
                firstView: superView,
                secondView: view,
                constant: -Float(inset?.left ?? 0)
            ),
            .right(
                firstView: superView,
                secondView: view,
                constant: Float(inset?.right ?? 0)
            ),
            .bottom(
                firstView: superView,
                secondView: view,
                constant: Float(inset?.bottom ?? 0)
            )
        ]

    }

    static func safeAreaTop(
        safeAreaView: UIView,
        otherView: UIView,
        constant: Float = 0,
        statusBar: Bool = false
    ) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            return safeAreaView
                .safeAreaLayoutGuide
                .topAnchor
                .constraint(
                    equalTo: otherView.topAnchor,
                    constant: CGFloat(constant)
            )
        } else {
            var finalConstant = constant

            if statusBar {
                finalConstant = -20 + constant
            }

            return top(
                firstView: safeAreaView,
                secondView: otherView,
                constant: finalConstant
            )
        }
    }

    static func safeAreaBottom(
        safeAreaView: UIView,
        otherView: UIView,
        constant: Float = 0
    ) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            return safeAreaView
                .safeAreaLayoutGuide
                .bottomAnchor
                .constraint(
                    equalTo: otherView.bottomAnchor,
                    constant: CGFloat(constant)
            )
        } else {
            return bottom(
                firstView: safeAreaView,
                secondView: otherView,
                constant: constant
            )
        }
    }

    static func top(
        firstView: UIView,
        secondView: UIView,
        constant: Float = 0
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: firstView,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: secondView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: CGFloat(constant)
        )
    }
    static func left(
        firstView: UIView,
        secondView: UIView,
        constant: Float = 0
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: firstView,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: secondView,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: CGFloat(constant)
        )
    }
    static func right(
        firstView: UIView,
        secondView: UIView,
        constant: Float = 0
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: firstView,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: secondView,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: CGFloat(constant)
        )
    }
    static func bottom(
        firstView: UIView,
        secondView: UIView,
        constant: Float = 0
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: firstView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: secondView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: CGFloat(constant)
        )
    }

    static func over(
        topItem: UIView,
        bottomItem: UIView,
        constant: Float = 0
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: topItem,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: bottomItem,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: -1 * CGFloat(constant)
        )
    }

    static func aside(
        left: UIView,
        right: UIView,
        constant: Float = 0
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: left,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: right,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: -1 * CGFloat(constant)
        )
    }

    static func height(
        view: UIView,
        constant: Float
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: view,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: CGFloat(constant)
        )
    }

    static func heightEqualTo(
        parentView: UIView,
        view: UIView,
        constant: Float
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: view,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: parentView,
            attribute: NSLayoutConstraint.Attribute.height,
            multiplier: 1,
            constant: CGFloat(constant)
        )
    }

    static func width(
        view: UIView,
        constant: Float
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: view,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: CGFloat(constant)
        )
    }

    static func widthEqualTo(
        parentView: UIView,
        view: UIView,
        constant: Float
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: view,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: parentView,
            attribute: NSLayoutConstraint.Attribute.width,
            multiplier: 1,
            constant: CGFloat(constant)
        )
    }

    static func aspectRadio(
        view: UIView,
        constant: Float
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: view,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.height,
            multiplier: CGFloat(constant),
            constant: 0
        )
    }

    static func centerY(
        firstView: UIView,
        secondView: UIView,
        constant: Float = 0
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: firstView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: secondView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: CGFloat(constant)
        )
    }

    static func centerX(
        firstView: UIView,
        secondView: UIView,
        constant: Float = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(
                item: firstView,
                attribute: NSLayoutConstraint.Attribute.centerX,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: secondView,
                attribute: NSLayoutConstraint.Attribute.centerX,
                multiplier: 1,
                constant: CGFloat(constant)
            )
    }
}
