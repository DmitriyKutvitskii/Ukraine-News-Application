//  HeaderView.swift
//  News Application

import UIKit

final class HeaderView: UIView {
//header
	private var fontSize: CGFloat
	
	private lazy var headingLabel: UILabel = {
		let v = UILabel()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.text = "Ukraine News"
		v.textAlignment = .center
		v.font = UIFont(name: "Hoefler Text", size: fontSize)
		v.textColor = .black
		return v
	}()
	
	private lazy var headerCircleImage: UIImageView = {
		let v = UIImageView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.contentMode = .scaleAspectFit
		let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
		v.image = UIImage(systemName: "waveform.path.ecg", withConfiguration:
		  config)?.withRenderingMode(.alwaysOriginal)
		return v
		}()
	
	private lazy var plusImage: UIImageView = {
		let v = UIImageView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.contentMode = .scaleAspectFit
		let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
		v.image = UIImage(systemName: "waveform.path.ecg", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
		return v
	}()
	
// HeadLines
	private lazy var subheadlineLabel: UILabel = {
		let v = UILabel()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.text = "-BREAKING NEWS!-"
		v.layer.cornerRadius = 10
		v.layer.borderWidth = 0.8
		v.layer.borderColor = UIColor.red.cgColor
		v.font = UIFont(name: "Copperplate", size: 22.00)
		v.textColor = .black
		v.textAlignment = .center
		return v
	}()
	
	private lazy var headerStackView: UIStackView = {
		let v = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel, plusImage])
		v.translatesAutoresizingMaskIntoConstraints = false
		v.axis = .horizontal
		v.distribution = .equalCentering
		return v
	}()
	
	init(fontSize:CGFloat) {
		self.fontSize = fontSize
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	func setupView() {
		addSubview(headerStackView)
		addSubview(subheadlineLabel)
		setupConstraints()
	}
	
	func setupConstraints() {
// NEWS Header
		NSLayoutConstraint.activate([
			headerStackView.topAnchor.constraint(equalTo: topAnchor),
			headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			headerStackView.bottomAnchor.constraint(equalTo: headerStackView.bottomAnchor)
		])
//Subheadline
	  NSLayoutConstraint.activate([
			subheadlineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 10),
			subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			subheadlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}
}
