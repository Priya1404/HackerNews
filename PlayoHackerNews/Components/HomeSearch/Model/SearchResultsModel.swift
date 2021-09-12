//
//  SearchResultsModel.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation

class SearchResultsResponse: Codable {
    let hits: [NewsResults]
    let nbHits: Int
    let page: Int
    let nbPages: Int
    let hitsPerPage: Int
    let exhaustiveNbHits: Bool
    let query: String
    let params: String
    let processingTimeMS: Int
}

class NewsResults: Codable {
    let createdAt: String
    let title: String
    let url: String?
    let author: String
    let points: Int
    let storyText: String?
    let commentText: String?
    let numComments: Int
    let storyId: String?
    let storyTitle: String?
    let storyUrl: String?
    let parentId: String?
    let createdAtI: Int
    let relevancyScore: Int?
    let tags: [String]
    let objectID: String
    let highlightResult: HighlightResult?
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title
        case url
        case author
        case points
        case storyText = "story_text"
        case commentText = "comment_text"
        case numComments = "num_comments"
        case storyId = "story_id"
        case storyTitle = "story_title"
        case storyUrl = "story_url"
        case parentId = "parent_id"
        case createdAtI = "created_at_i"
        case relevancyScore = "relevancy_score"
        case tags = "_tags"
        case objectID
        case highlightResult = "_highlightResult"
    }
}

class HighlightResult: Codable {
    let title: Title
    let url: URLObject
    let author: Author
    let storyText: StoryText?
    
    enum CodingKeys: String, CodingKey {
        case title
        case url = "url"
        case author
        case storyText = "story_text"
    }
}

class Title: Codable {
    let value: String
    let matchLevel: String
    let fullyHighlighted: Bool
    let matchedWords: [String]
}

class URLObject: Codable {
    let value: String
    let matchLevel: String
    let fullyHighlighted: Bool?
    let matchedWords: [String]
}

class Author: Codable {
    let value: String
    let matchLevel: String
    let matchedWords: [String?]
}

class StoryText: Codable {
    let value: String
    let matchLevel: String
    let matchedWords: [String?]
}
