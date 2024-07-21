import UIKit

class CustomToggleButton: UIButton {
    var isOn: Bool = false {
        didSet {
            updateAppearance()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        self.addTarget(self, action: #selector(toggleState), for: .touchUpInside)
        updateAppearance()
    }
    
    @objc private func toggleState() {
        isOn = !isOn
    }
    
    private func updateAppearance() {
        let imageName = isOn ? "English" : "Russian"
        self.setImage(UIImage(named: imageName), for: .normal)
    }
}
