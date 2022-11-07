//
//  IssueListCell.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import UIKit

import SnapKit

final class IssueListCell: UITableViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }

    private let contentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5

        return stackView
    }()

    private let hellowBotImageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    private let informationLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupContentsView()
        self.setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContentsView() {
        self.accessoryType = .disclosureIndicator
        self.contentView.backgroundColor = .systemBackground
        self.addSubview(self.contentsStackView)
        self.contentsStackView.addArrangedSubviews(self.informationLabel)
    }

    private func setupConstraint() {
        self.contentsStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(40)
        }
    }

    func bind(viewModel: IssueListCellViewModelable) {
        self.informationLabel.text = viewModel.information
    }

    func insertImage(urlString: String) {
        self.accessoryType = .none
        self.hellowBotImageView.setImage(with: urlString)
        self.informationLabel.removeFromSuperview()
        self.contentsStackView.addArrangedSubview(self.hellowBotImageView)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.hellowBotImageView.image = nil
        self.informationLabel.text = nil
    }
}
