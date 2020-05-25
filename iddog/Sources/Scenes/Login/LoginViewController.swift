import UIKit

protocol LoginDisplayLogic: class {}

final class LoginViewController: UIViewController {
    var interactor: LoginBusinessLogic?
    var router: LoginRouterType?

    private lazy var appNameLabel: AppNameLabel = {
        let label = AppNameLabel()
        return label
    }()

    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = LoginConstants.contentStackViewSpacing
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var typeYourEmailLabel: UILabel = {
        let label = UILabel()
        label.font = FontHelper.font(
            for: HelveticaNeue.regular,
            and: LoginConstants.yourEmailLabelFontSize
        )
        label.textColor = R.color.appWhite()
        label.text = R.string.localizable.typeYourEmail()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.string.localizable.email()
        textField.font = FontHelper.font(
            for: HelveticaNeue.regular,
            and: LoginConstants.emailTextFieldFontSize
        )
        textField.backgroundColor = R.color.appWhite()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = R.color.appGreen()
        button.titleLabel?.font = FontHelper.font(
            for: HelveticaNeue.bold,
            and: LoginConstants.signUpButtonFontSize
        )
        button.setTitleColor(
            R.color.appWhite(),
            for: .normal
        )
        button.setTitle(
            R.string.localizable.signUp(),
            for: .normal
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: Object lifecycle

    override init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?
    ) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildView()
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }
}

extension LoginViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(appNameLabel)
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubview(typeYourEmailLabel)
        contentStackView.addArrangedSubview(emailTextField)
        contentStackView.addArrangedSubview(signUpButton)
    }

    func setupConstraints() {
        appNameLabel.centerXConstraint(parentView: view)
        appNameLabel.centerYConstraint(
            parentView: view,
            constant: LoginConstants.Constraints.appNameLabelcenterYConstraint
        )

        contentStackView.centerXConstraint(parentView: view)
        contentStackView.centerYConstraint(parentView: view)
        contentStackView.widthConstraint(
            constant: LoginConstants.Constraints.contentStackViewWidthConstraint
        )

        emailTextField.heightConstraint(
            constant: LoginConstants.Constraints.emailTextFieldHeightConstraint
        )

        signUpButton.heightConstraint(
            constant: LoginConstants.Constraints.signUpButtonHeightConstraint
        )
    }

    func additionalSetup() {
        view.backgroundColor = R.color.appPurple()
    }
}

extension LoginViewController: LoginDisplayLogic {}
