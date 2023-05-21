//
//  FileLoader.swift
//  NetworkingSample
//
//  Created by Admin on 21/05/23.
//

import Foundation

enum JsonLoadError: Error {
    case noFileAtPath
    case corruptFile
    case wrongFilePath
    case fileNotConvertibleToData
}

struct FileLoader {
    static func getJsonFile(_ name: String) -> Completion<String> {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            return .success(filePath)
        } else {
            return .failure(JsonLoadError.noFileAtPath)
        }
    }
}

func data(_ path: String) -> Completion<Data> {
    if let url = URL(string: path) {
        do {
            let data = try Data(contentsOf: url)
            return .success(data)
        } catch let error as NSError {
            return .failure(error)
        }
    } else {
        return .failure(JsonLoadError.wrongFilePath)
    }
}

struct FileData {
    static func changeToData(_ path: String) -> Completion<Data> {
        if let data = NSData(contentsOfFile: path) as? Data {
            return .success(data)
        } else {
            return .failure(JsonLoadError.fileNotConvertibleToData)
        }
    }
}

func serializeJson(_ data: Data) -> Completion<Any> {
    do {
        let jsonObj = try JSONSerialization.jsonObject(with: data)
        return .success(jsonObj)
    } catch let error {
        return .failure(error)
    }
}
