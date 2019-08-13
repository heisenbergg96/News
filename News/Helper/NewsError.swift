//
//  NewsError.swift
//  News
//
//  Created by Vikhyath on 13/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import Foundation

enum NewsError: Error {
    
    case urlError
    case networkUnavailable
    case wrongDataFormat
    case missingData
    case creationError
}

extension NewsError: LocalizedError {
    
    public var errorDescription: String? {
        
        switch self {
        case .urlError:
            return NSLocalizedString("Could not create a URL.", comment: "")
        case .networkUnavailable:
            return NSLocalizedString("Could not get data from the remote server.", comment: "")
        case .wrongDataFormat:
            return NSLocalizedString("Could not digest the fetched data.", comment: "")
        case .missingData:
            return NSLocalizedString("Found and will discard a quake missing a valid code, magnitude, place, or time.", comment: "")
        case .creationError:
            return NSLocalizedString("Failed to create a new Quake object.", comment: "")
        }
    }
}
