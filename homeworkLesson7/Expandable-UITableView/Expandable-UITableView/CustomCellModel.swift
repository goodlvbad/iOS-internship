//
//  CustomCellModel.swift
//  Expandable-UITableView
//
//  Created by Светлана on 17.03.2022.
//

import Foundation

struct CustomCellModel {
    let title: String
    let imageString: String
    let rating: Int
}

struct SectionModel {
    var isOpen: Bool
    let data: [CustomCellModel]
    let title: String
}


let rock: [CustomCellModel] = [
    CustomCellModel(title: "Nirvana - Nevermind", imageString: "music.note.house", rating: 10),
    CustomCellModel(title: "Arctic Monkeys - AM", imageString: "music.note.house", rating: 9),
    CustomCellModel(title: "Queen - A Night at the Opera", imageString: "music.note.house", rating: 10),
    CustomCellModel(title: "Iron Maiden - Seventh Son Of A Seventh Son", imageString: "music.note.house", rating: 10),
]

let pop: [CustomCellModel] = [
    CustomCellModel(title: "Taylor Swift - 1989", imageString: "music.note.house.fill", rating: 7),
    CustomCellModel(title: "Lady Gaga - Born this way", imageString: "music.note.house.fill", rating: 9),
    CustomCellModel(title: "Adele - 25", imageString: "music.note.house.fill", rating: 10),
]

let jazz: [CustomCellModel] = [
    CustomCellModel(title: "Ella Fitzgerald - Ella Fitzgerald Sings the Duke Ellington Songbook", imageString: "music.note.list", rating: 8),
    CustomCellModel(title: "Jaco Pastorius - Jaco Pastorius", imageString: "music.note.list", rating: 7),
]


var sectionsModels: [SectionModel] = [
    SectionModel(isOpen: true, data: rock, title: "Rock"),
    SectionModel(isOpen: true, data: pop, title: "Pop"),
    SectionModel(isOpen: true, data: jazz, title: "Jazz"),
]
