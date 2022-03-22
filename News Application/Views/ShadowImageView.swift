//  ShadowImageView.swift
//  News Application

import UIKit

class ShadowImageView: UIView {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 10.0
        return view
    }()
    
    init () {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(baseView)
        baseView.addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        [baseView, imageView].forEach { (constraints) in
            NSLayoutConstraint.activate([
                constraints.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                constraints.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                constraints.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                constraints.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
            ])
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
        baseView.layer.shouldRasterize = true
        baseView.layer.rasterizationScale = UIScreen.main.scale
    }
}
