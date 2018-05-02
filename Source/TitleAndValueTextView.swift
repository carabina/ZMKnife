import UIKit
import SnapKit

public class TitleAndValueTextView: BorderBottomView {

    public var titleWidth: CGFloat?
    public var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

    public var title: String? {
        didSet {
            self.titleLabel.text = self.title
        }
    }

    public var titleColor: UIColor = UIColor.black {
        didSet {
            self.titleLabel.textColor = self.titleColor
        }
    }

    public var titleFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.titleLabel.font = self.titleFont
        }
    }

    public var value: String? {
        didSet {
            self.valueLabel.text = self.value
        }
    }

    public var valueColor: UIColor = UIColor.black {
        didSet {
            self.valueLabel.textColor = self.valueColor
        }
    }

    public var valueFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.valueLabel.font = self.valueFont
        }
    }

    public var isValueAlignRight: Bool = true {
        didSet {
            if self.isValueAlignRight {
                self.valueLabel.textAlignment = .right
            } else {
                self.valueLabel.textAlignment = .left
            }
        }
    }

    let titleLabel = UILabel()
    let valueLabel = UILabel()

    public override func updateConstraints() {
        super.updateConstraints()
        let padding = self.padding
        if let titleWidth = self.titleWidth {
            self.titleLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(padding.left)
                make.width.equalTo(titleWidth)
                make.top.equalTo(self).offset(padding.top)
                make.bottom.equalTo(self).offset(-padding.bottom)
            }
        } else {
            self.titleLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(padding.left)
                make.right.equalTo(self.snp.centerX)
                make.top.equalTo(self).offset(padding.top)
                make.bottom.equalTo(self).offset(-padding.bottom)
            }
        }
        self.updateValueLabelConstraints()
    }

    func updateValueLabelConstraints() {
        let padding = self.padding
        self.valueLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right)
            make.right.equalTo(self).offset(-padding.right)
            make.top.equalTo(self).offset(padding.top)
            make.bottom.equalTo(self).offset(-padding.bottom)
        }
    }

    override func initViews() {
        self.backgroundColor = UIColor.white

        self.titleLabel.text = self.title
        self.titleLabel.font = self.titleFont
        self.titleLabel.textColor = self.titleColor
        self.addSubview(self.titleLabel)

        self.valueLabel.text = self.value
        self.valueLabel.font = self.valueFont
        self.valueLabel.textColor = self.valueColor
        self.valueLabel.textAlignment = NSTextAlignment.right
        self.addSubview(self.valueLabel)
        super.initViews()
    }
}
