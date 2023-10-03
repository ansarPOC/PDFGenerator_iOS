//
//  PDFPage.swift
//  PDF_Demo
//
//  Created by Ansar on 12/05/23.
//

import Foundation

public protocol FilePathConvertible {
    var url: URL { get }
    var path: String { get }
}

extension FilePathConvertible {
    var isEmptyPath: Bool {
        return path.isEmpty
    }
}

extension String: FilePathConvertible {
    public var url: URL {
        return URL(fileURLWithPath: self)
    }

    public var path: String {
        return self
    }
}

extension URL: FilePathConvertible {
    public var url: URL {
        return self
    }
}
