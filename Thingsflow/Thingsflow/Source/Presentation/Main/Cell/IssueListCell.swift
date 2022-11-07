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

        return stackView
    }()

    private let numberLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private let titleLabel: UILabel = {
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
        self.contentView.backgroundColor = .systemBackground
        self.addSubview(self.contentsStackView)
        self.contentsStackView.addArrangedSubviews(self.numberLabel, self.titleLabel)
    }

    private func setupConstraint() {
        self.contentsStackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
    }

    func bind(viewModel: IssueListCellViewModelable) {
        self.numberLabel.text = viewModel.number
        self.titleLabel.text = viewModel.title
    }
}
