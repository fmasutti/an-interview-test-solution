import Foundation
import UIKit

final class ItemDescriptionView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemDescription: UILabel!
    @IBOutlet weak var btnState: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    init(name: String, description: String, hiddenButtonState: Bool = true) {
        // This frame size bellow will be reviewed by "SetupView"
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        setupView()
        lblItemName.text = name
        lblItemDescription.text = description
        btnState.isHidden = hiddenButtonState
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed("ItemDescriptionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func btnStatusTouched(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        button.isSelected = !button.isSelected
    }
    
}
