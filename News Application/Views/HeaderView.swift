//  HeaderView.swift
//  News Application

import UIKit

final class HeaderView: UIView {
    //header
    private var fontSize: CGFloat
    
    private lazy var headingLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Ukraine News"
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "Hoefler Text", size: fontSize)
        headerLabel.textColor = .black
        return headerLabel
    }()
    
    private lazy var headerCircleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        image.image = UIImage(systemName: "waveform.path.ecg", withConfiguration:
                                config)?.withRenderingMode(.alwaysOriginal)
        return image
    }()
    
    private lazy var plusImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        image.image = UIImage(systemName: "waveform.path.ecg", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return image
    }()
    
    // HeadLines
    private lazy var subheadlineLabel: UILabel = {
        let subHeadlineLabel = UILabel()
        subHeadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        subHeadlineLabel.text = "-BREAKING NEWS!-"
        subHeadlineLabel.layer.cornerRadius = 10
        subHeadlineLabel.layer.borderWidth = 0.8
        subHeadlineLabel.layer.borderColor = UIColor.red.cgColor
        subHeadlineLabel.font = UIFont(name: "Copperplate", size: 22.00)
        subHeadlineLabel.textColor = .black
        subHeadlineLabel.textAlignment = .center
        return subHeadlineLabel
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel, plusImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
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
    private func setupView() {
        addSubview(headerStackView)
        addSubview(subheadlineLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
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
