//  ViewController.swift
//  News Application

import UIKit
import SafariServices

class ViewController: UIViewController {
	
	var viewModel = NewsListviewModel()
	
	private lazy var headerView: HeaderView = {
		let v = HeaderView(fontSize: 32)
		return v
	}()
	
	private lazy var tableView: UITableView = {
		let v = UITableView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.tableFooterView = UIView()
		v.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
		v.delegate = self
		v.dataSource = self
		return v
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		fetchNews()
		
	}
	
	func setupView() {
		view.backgroundColor = .white
		view.addSubview(headerView)
		view.addSubview(tableView)
		setupConstraints()
	}
	
	func setupConstraints() {
		// header
		NSLayoutConstraint.activate([
			headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
			headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			headerView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
			headerView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
		])
		// table View
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		
		])
	}
	
	func fetchNews() {
		viewModel.getNews { (_) in
			self.tableView.reloadData()
		}
	}
}

// Checking the request from the server.
//
//		NetworkManager.shared.getNews { (news) in
//			guard let news = news else {return}
//			print(news[0].title)
//		}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.newsVM.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
		let news = viewModel.newsVM[indexPath.row]
		cell?.newsVM = news
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let news = viewModel.newsVM[indexPath.row]
		guard let url = URL(string: news.url) else {
			return
		}
		
	//Opening window in safari
		let config = SFSafariViewController.Configuration()
		let safariViewController = SFSafariViewController(url: url, configuration: config)
		safariViewController.modalPresentationStyle = .fullScreen
		present(safariViewController, animated: true)
	}
}
