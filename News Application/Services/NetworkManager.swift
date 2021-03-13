//
//  NetworkManager.swift
//  News Application
//
//  Created by Дмитрий Кутвицкий on 13.03.2021.
import Foundation

class NetworkManager {
	let imageCache = NSCache <NSString, NSData>()
	
	static let shared = NetworkManager()
	private init() {}
	
	private let baseUrlString = "https://newsapi.org/v2/"
	private let USTopHedline = "top-headlines?country=ua"
	
	func getNews(completion: @escaping ([News]?) -> Void) {
		let urlString = "\(baseUrlString)\(USTopHedline)&apiKey=\(APIKey.key)"
		
		guard let url = URL(string: urlString) else {
			return
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard error == nil, let data = data else {
				completion(nil)
				return
		}
			
			let newsEnvelope = try? JSONDecoder() .decode(NewsEnvelope.self, from: data)
			newsEnvelope == nil ? completion(nil) : completion(newsEnvelope!.articles)
			
		}.resume()
		
	}
}
