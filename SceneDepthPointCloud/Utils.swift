//
//  Utils.swift
//  SceneDepthPointCloud
//
//  Created by Waley Zheng on 10/2/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation

/// Get current time in string.
func getTimeStr() -> String {
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd_hhmmss"
    return df.string(from: Date())
}

/// Save file to a directory.
func saveFile(content: String, filename: String, folder: String) async throws -> () {
    print("Save file to \(folder)/\(filename)")
    let url = getDocumentsDirectory().appendingPathComponent(folder, isDirectory: true).appendingPathComponent(filename)
    try content.write(to: url, atomically: true, encoding: .utf8)
}

func getDocumentsDirectory() -> URL {
    // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    // just send back the first one, which ought to be the only one
    return paths[0]
}

func createDirectory(folder: String) {
    let path = getDocumentsDirectory().appendingPathComponent(folder)
    do
    {
        try FileManager.default.createDirectory(at: path, withIntermediateDirectories: true)
    }
    catch let error as NSError
    {
        print("Unable to create directory \(error.debugDescription)")
    }
    
}

/// Send task start/finish messages.
protocol TaskDelegate: AnyObject {
    func didStartTask()
    func didFinishTask()
}
