//
//  Data.swift
//  Parser
//
//  Created by Dmitry on 11.08.2021.
//

import Foundation

struct SomeStruct: Decodable {
    let data: [Datum]
    let view: [String]
}

struct Datum: Decodable {
    let name: String
    let data: DataClass
}

struct DataClass: Decodable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant: Decodable {
    let id: Int
    let text: String
}

