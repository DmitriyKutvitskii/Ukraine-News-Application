//
//  News.swift
//  News Application
//
//  Created by Дмитрий Кутвицкий on 13.03.2021.
//
import Foundation

struct News: Decodable {
	let author: String?
	let title: String?
	let description: String?
	let urlToImage: String?
	let url: String?
}
struct NewsEnvelope: Decodable {
	let status: String?
	let totalResults: Int
	let articles: [News]
}
