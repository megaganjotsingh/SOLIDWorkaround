//
//  JSON.swift
//  NetworkingSample
//
//  Created by Admin on 19/05/23.
//

import Foundation

typealias JSONAny = AnyObject
typealias JSONObject = [String: Any]
typealias JSONArray = [AnyObject]
typealias JSONString = String
typealias JSONInt = Int
typealias JSONNumber = NSNumber

enum JSON {
    case array(JSONArray)
    case object(JSONObject)
    case number(JSONNumber)
    case jString(JSONString)
    
    case null
    case none
    
    init(_ object: JSONAny?) {
        if let object = object {
            switch object {
            case let obj as JSONObject:
                self = .object(obj)
            case let obj as JSONString:
                self = .jString(obj)
            case let obj as JSONNumber:
                self = .number(obj)
            case let obj as JSONArray:
                self = .array(obj)
            default:
                self = .none
            }
        } else {
            self = .null
        }
    }
    
    subscript(_ index: Int) -> JSON {
        get {
            if case .array(let jSONArray) = self {
                if index >= 0 || index < jSONArray.count {
                    return JSON(jSONArray[index])
                }
            }
            return .none
        }
    }
}

extension JSON {
    var int: Int? {
        if case .number(let jSONNumber) = self {
            return jSONNumber.intValue
        }
        return .none
    }
    
    var string: String? {
        if case .jString(let jSONString) = self {
            return jSONString
        }
        return .none
    }
}
