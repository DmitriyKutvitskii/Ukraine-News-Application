//
//  NewsViewModel.swift
//  News Application

import Foundation

struct NewsViewModel {
	let news: News
	
	var author: String {
		return news.author ?? "Unknown"
	}
	var title: String {
		return news.title ?? ""
	}
	var description: String {
		return news.description ?? ""
	}
	var url: String {
		return news.url ?? ""
	}
// Image news - nill (photo)
	var urlToImage: String {
		return news.urlToImage ?? "https://placeanad.nydailynews.com/wp-content/uploads/2020/03/cropped-NYDN-logo.png"
	}
}
