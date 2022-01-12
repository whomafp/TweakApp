


import Foundation

struct Chart: Codable {
    let colors: [String]?
    let questions: [Question]?
}

struct Question: Codable {
    let total: Int?
    let text: String?
    let chartData: [ChartModel]?
}

struct ChartModel: Codable {
    let text: String?
    let percetnage: Int?
}
