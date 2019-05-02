//
//  main.swift
//  DLS
//
//  Created by Ethan Cardboard Box on 20/3/19.
//  Copyright © 2019 Ethan Cardwell. All rights reserved.
//
// 'con' is 'nil' for this program

import Cocoa
import Foundation
import AppKit

//let hi = 1

//let ProgramArgumentsPass1 = readLine()! //CommandLine.arguments.joined(separator: " ")
//var ProgramArguments = ProgramArgumentsPass1
//print(ProgramArguments)


let CON = "This is Depracticated! Have a nice day! :)" // IMPORTANT: THIS IS DEPRACTICATED! USE "DOS.CON" INSTEAD!
// To Be Honest it does not matter anyways if its depracticated or not. it *TECHNICALY* did nothing.
// Old Description: "MAIN VAR, USED AS DUMMY VAR FOR TESTING"

// -----------------------------------------------------
// | TODO: REPLACE ALL "CON" REFRENCES WITH "DOS.CON"! |
// -----------------------------------------------------
func ErrorManager(question: String, text: String) -> Int {
    let alert = NSAlert()
    alert.messageText = question
    alert.informativeText = text
    alert.alertStyle = .warning
    alert.addButton(withTitle: "Abort")
    alert.addButton(withTitle: "Ignore")
    alert.addButton(withTitle: "Retry")
    let HI = alert.runModal()
    //alert.begin
    return HI.rawValue
    
}


public var sizeToDisplay = "not yet Calculated"
 let dispatchQueue = DispatchQueue(label: "Folder size", qos: .background)
let fileManager = FileManager.default
public var path = fileManager.currentDirectoryPath
var dir = try fileManager.contentsOfDirectory(atPath: path)

//let workItem = DispatchWorkItem
//}
let  byteCountFormatter =  ByteCountFormatter()
byteCountFormatter.allowedUnits = .useBytes
byteCountFormatter.countStyle = .file

dispatchQueue.async{
    // get your directory url
    let documentsDirectoryURL = URL(fileURLWithPath: path)
    //print(documentsDirectoryURL)
    //print()
    // check if the url is a directory
    if (try? documentsDirectoryURL.resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true {
        var folderSize = 0
        (FileManager.default.enumerator(at: documentsDirectoryURL, includingPropertiesForKeys: nil)?.allObjects as? [URL])?.lazy.forEach {
            folderSize += (try? $0.resourceValues(forKeys: [.totalFileAllocatedSizeKey]))?.totalFileAllocatedSize ?? 0
        }
        

        //byteCountFormatter.string
        sizeToDisplay = byteCountFormatter.string(for: folderSize) ?? ""
        
        //print(sizeToDisplay)  // "X,XXX,XXX bytes"
    }
}


//@discardableResult

func shell(_ command: String) -> String {
    let task = Process()
    task.launchPath = "/bin/bash"
    task.arguments = ["+o", "verbose", "-c", command]
    
    //---------------------------------------//
    //      alternative that does work       //
    //       with fullscreen programs        //
    //---------------------------------------//
    
    // task.launchPath = "/usr/bin/screen"
    // task.arguments = [command]
    
    //---------------------------------------//
    //       alternative that does not       //
    //     work with fullscreen programs     //
    //---------------------------------------//
    
    // task.launchPath = "/bin/bash"
    // task.arguments = ["-c", command]

    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    //task.waitUntilExit()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
    
    print(output)
    //return output
    return output
}

print(" ")



//print("\u{001B}[2J")
//setenv("TERM","xterm",0);

print("Yet Another DOS Like Shell")
repeat {
    var randomCONVAR = Int.random(in: 0 ... 999999)
    path = fileManager.currentDirectoryPath
    dir = try fileManager.contentsOfDirectory(atPath: path)
    //fileManager.dir

    //MARK: Get raw value
    
    var freeDiskSpaceInBytes:Int64 {
        get {
            do {
                let systemAttributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String)
                //print(systemAttributes)
                //FileAttributeKey.systemSize
                let freeSpace = (systemAttributes[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value
                return freeSpace!
            } catch {
                return 0
            }
        }
    }
    var freeDiskSpace:String {
        get {
            return byteCountFormatter.string(fromByteCount: freeDiskSpaceInBytes)
        }
    }
    var usedDiskSpaceInBytes:Int64 {
        get {
            do {
                let systemAttributes = try FileManager.default.attributesOfItem(atPath: path as String)
                //print(systemAttributes)
                //FileAttributeKey.systemSize
                let usedSpace = (systemAttributes[FileAttributeKey.size] as? NSNumber)?.int64Value
                return usedSpace!
            } catch {
                return 0
            }
        }
    }
    var usedDiskSpace:String {
        get {
            return byteCountFormatter.string(fromByteCount: usedDiskSpaceInBytes)
        }
    }
    
   
    
   //dispatchQueue.

    
    
    
     //let files = fileManager.conten
    if path == "/" {
        print("C:/>", terminator:"")
    } else {
        print("C:" + path + "/>", terminator:"")
    }
    let response = readLine()
    let UserInput = response!
    let hello = "world!"
    var index = hello.startIndex
    var paraUsed = String.SubSequence(" ")
    
    let seperatedInput = UserInput.components(separatedBy: " ")

    let command = seperatedInput.first ?? String("con")
    
    _ = String(response?.dropLast() ?? Substring("con "))
    
    if UserInput.contains(" ") {
        //String.CompareOptions.
        //print("test")
        index = UserInput.range(of: " ")!.upperBound
        //let indexInt = response?.distance(from: (response?.startIndex)!, to: index!)
        //let indexmap = index.map(transform: (index) throws -> UnboundedRange_)
        //let indexmap = index.map { (index) -> UnboundedRange_ in
        //let paramatersUsed = index.map((response?.substring(from:))!)
        paraUsed = UserInput[index...]
        //index.
        //let commandUsed = index.map((response?.substring(to:))!)
        
        //let indexInt = response?.distance(from: "", to: " ")
        //let parameter = String(response?[..<index])
        //print(index!)
        //print(commandUsed!)
    }
    let paraUsedString = String(paraUsed)
    //print(command)
    if ((command == "dir")) {
        DOS.Dir(usedDiskSpace: usedDiskSpace, freeDiskSpace: freeDiskSpace, dir2: dir)
    } else if (command == "cd..") {
        DOS.GoUp()
    } else if (command == "cd") {
        DOS.ChangeDir(newpath: String(paraUsed))
    } else if (command == "edit") {
        DOS.Nano()
    } else if (command == "nano") || (command == "/usr/bin/nano") {
        DOS.Nano()
    } else if (command == "echo") {
        DOS.Echo(Input: String(paraUsed))
    } else if (command == "editor") {
        DOS.Edit()
    } else if (command == "color") {
        DOS.Colour(colorCode: paraUsedString)
    } else if (command == "md") {
        DOS.MakeDir(Input: String(paraUsed))
    } else if (command == "rd") {
        DOS.RemoveDir(Input: String(paraUsed))
    } else if (command == "con") {
        DOS.Console()
    } else if (command == "pause") {
        DOS.Pause()
    } else if fileManager.fileExists(atPath: path + "/" + (response ?? String("con"))) || fileManager.fileExists(atPath: (response ?? String("con"))) || fileManager.fileExists(atPath: "/bin/" + (response ?? String("con"))) {
        //TODO. DOS.FileHandler(response: response!, UserInput: UserInput, command: command)
        DOS.Execute(path: response!)
    } else {
        DOS.Invalid()
    }
    //let POPUP = ErrorManager(question: "ok", text: "hello")
    
} while true

func keyDown(event: NSEvent) {
    //super.keyDown(event)
    print("Caught a key down: \(event.keyCode)!")
}



