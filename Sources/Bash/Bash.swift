//
//  Bash.swift
//  SwiftBash
//
//  Created by Mihael Isaev on 10.10.2024.
//

import Foundation

public struct Bash {
    public enum WhichError: Error, CustomStringConvertible {
        case notFound(program: String)
        
        public var description: String {
            switch self {
            case .notFound(let program): return "Program named `\(program)` not found"
            }
        }
    }
    
    public static func whichBool(_ program: String) -> Bool {
        do {
            _ = try which(program)
            return true
        } catch {
            return false
        }
    }
    
    /// Returns path to program binary
    public static func which(_ program: String) throws -> String {
        let stdout = Pipe()
        let process = Process()
        process.launchPath = "/bin/bash"
        process.arguments = ["-c", "which \(program)"]
        process.standardOutput = stdout
        
        let outHandle = stdout.fileHandleForReading

        process.launch()
        process.waitUntilExit()
        
        guard process.terminationStatus == 0 else {
            throw WhichError.notFound(program: program)
        }
        
        let data = outHandle.readDataToEndOfFile()
        guard data.count > 0, let path = String(data: data, encoding: .utf8) else {
            throw WhichError.notFound(program: program)
        }
        return path.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
