//
//  ViewController.swift
//  News Application
//
//  Created by Дмитрий Кутвицкий on 13.03.2021.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		
		NetworkManager.shared.getNews { (news) in
			guard let news = news else {return}
			print(news[0].title)
		}
		
	}	
}
