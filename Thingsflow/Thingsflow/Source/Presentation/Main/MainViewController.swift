//
//  MainViewController.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import RxSwift
import RxCocoa
import SnapKit

private enum Const {
    static let search = "Search"
    static let appleSwiftIssues = "apple/swift/issues"
}

final class MainViewController: UIViewController {
    private let viewModel: MainViewModelable
    private let coordinator: MainViewCoordinatorProtocol
    private let disposeBag = DisposeBag()

    private let searchBarButton = UIBarButtonItem(
        title: Const.search,
        style: .plain,
        target: nil,
        action: nil
    )

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)

        return label
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()

        return tableView
    }()

    init(viewModel: MainViewModelable, coordinator: MainViewCoordinatorProtocol) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationItem()
        self.setupView()
        self.setupConstratint()
        self.bind()
        self.viewModel.fetchIssueList(text: Const.appleSwiftIssues)
    }

    private func setupNavigationItem() {
        self.navigationItem.rightBarButtonItem = self.searchBarButton
    }

    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubviews(self.titleLabel, self.tableView)
    }

    private func setupConstratint() {
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(10)
        }

        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }

    private func bind() {
        self.viewModel.error
            .observe(on: MainScheduler.instance)
            .bind { [weak self] error in
                self?.coordinator.showErrorAlert(
                    title: error.identifier,
                    message: error.errorMessage
                )
            }
            .disposed(by: self.disposeBag)

        self.viewModel.issueTitle
            .bind(to: self.titleLabel.rx.text)
            .disposed(by: self.disposeBag)

        self.viewModel.issueList
            .observe(on: MainScheduler.instance)
            .bind(to: self.tableView.rx.items) { tableView, row, element in

                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: IssueListCell.identifier,
                    for: IndexPath(row: row, section: .zero)
                ) as? IssueListCell else {
                    return UITableViewCell()
                }

                let cellViewModel = IssueListCellViewModel(issueInformation: element)
                cell.bind(viewModel: cellViewModel)

                return cell
            }
            .disposed(by: self.disposeBag)

        self.tableView.rx.modelSelected(Issue.self)
            .bind { [weak self] issueInformation in

            }
            .disposed(by: self.disposeBag)
    }
}
