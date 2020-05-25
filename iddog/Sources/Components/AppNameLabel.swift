import UIKit

class AppNameLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }

    init() {
        super.init(frame: .zero)
        setupLabel()
    }

    private func setupLabel() {
        text = ComponentConstants.AppNameLabel.appName
        textColor = R.color.appWhite()
        font = FontHelper.font(
            for: HelveticaNeue.boldItalic,
            and: ComponentConstants.AppNameLabel.appNameFontSize
        )
        translatesAutoresizingMaskIntoConstraints = false
    }
}
