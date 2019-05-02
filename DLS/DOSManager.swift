//
//  DOSManager.swift
//  DLS
//
//  Created by Ethan Cardboard Box on 1/4/19.
//  Copyright © 2019 Ethan Cardwell. All rights reserved.
//

//let DOS = "MAIN DOS SUFFIX"

import Foundation




struct DOSColours {
    
    struct con {
        //-----suffixes-----//
        static var black = "0"
        static var red = "1"
        static var green = "2"
        static var yellow = "3"
        static var blue = "4"
        static var magenta = "5"
        static var cyan = "6"
        static var white = "7"
        //-----prefixes-----//
        static var foreground = "3"
        static var background = "4"
    }
    
    struct dos {
        //-----suffixes-----//
        static var black = "0"
        static var red = "4"
        static var green = "2"
        static var yellow = "6"
        static var blue = "1"
        static var magenta = "5"
        static var cyan = "3"
        static var white = "7"
        //-----prefixes-----//
        static var foreground = "suffix"
        static var background = "prefix"
    }
}
class DOS {
    
    
    
    static var CON = "con" //DOS Null value
    
    class func shell(_ command: String) -> String {
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
    
    class func Echo(Input: String) {
        //let ARGUMENTS = Input
        if Input == CON || Input == "" {
            print("Do not a nill value (or indicator) as an argument!")
            print("E.g. Providing Strings like \"con\" or entering nothing")
        } else {
            print(Input)
        }
    }
    
    class func MakeDir(Input: String) {
        let NewProcess = shell("/bin/mkdir " + String(Input))
        _ = NewProcess.first
    }
    class func RemoveDir(Input: String) {
        let NewProcess = shell("/bin/rmdir " + String(Input))
        _ = NewProcess.first
    }
    
    class func Console() {
        print("CON - Used as a nill indicator by the DLS Interpreter.")
        print(" ")
        print("Instead of entering nothing for a dos value, CON will be used instead to avoid ")
        print("crashing from nill values trying to be unwrapped and such.")
        print(" ")
        print("Errors that involve trying to print the string \"CON\" or providing \"CON\" as an ")
        print("argument are simply nothing to worry about. if you really need to print \"CON\" for ")
        print("some reason, simply use the DLS-VARIABLE; \"%%console%%\"which, is automaticly")
        print("replaced by \"CON\".")
    }
    
    class func Pause() {
        print("press enter to continue", terminator:"")
        _ = readLine() ?? String("")
    }
    
    class func Colour(colorCode: String) {
        
        // black   30
        // red     31
        // green   32
        // yellow  33
        // blue    34
        // magenta 35
        // cyan    36
        // white   37
        // change background = 40
        
        //let DOS = "MAIN DOS SUFFIX"
        var BGColour = " "
        var FGColour = " "
        if colorCode.prefix(1) == DOSColours.dos.black {
            BGColour = DOSColours.con.black
        }
        if colorCode.prefix(1) == DOSColours.dos.red {
            BGColour = DOSColours.con.red
        }
        if colorCode.prefix(1) == DOSColours.dos.green {
            BGColour = DOSColours.con.green
        }
        if colorCode.prefix(1) == DOSColours.dos.yellow {
            BGColour = DOSColours.con.yellow
        }
        if colorCode.prefix(1) == DOSColours.dos.blue {
            BGColour = DOSColours.con.blue
        }
        if colorCode.prefix(1) == DOSColours.dos.magenta {
            BGColour = DOSColours.con.magenta
        }
        if colorCode.prefix(1) == DOSColours.dos.cyan {
            BGColour = DOSColours.con.cyan
        }
        if colorCode.prefix(1) == DOSColours.dos.white {
            BGColour = DOSColours.con.white
        }
        
        
        if colorCode.suffix(1) == DOSColours.dos.black {
            FGColour = DOSColours.con.black
        }
        if colorCode.suffix(1) == DOSColours.dos.red {
            FGColour = DOSColours.con.red
        }
        if colorCode.suffix(1) == DOSColours.dos.green {
            FGColour = DOSColours.con.green
        }
        if colorCode.suffix(1) == DOSColours.dos.yellow {
            FGColour = DOSColours.con.yellow
        }
        if colorCode.suffix(1) == DOSColours.dos.blue {
            FGColour = DOSColours.con.blue
        }
        if colorCode.suffix(1) == DOSColours.dos.magenta {
            FGColour = DOSColours.con.magenta
        }
        if colorCode.suffix(1) == DOSColours.dos.cyan {
            FGColour = DOSColours.con.cyan
        }
        if colorCode.suffix(1) == DOSColours.dos.white {
            FGColour = DOSColours.con.white
        }
        print("\u{001B}[0;" + DOSColours.con.background + BGColour + "m", terminator:"")
        print("\u{001B}[0;" + DOSColours.con.foreground + FGColour + "m", terminator:"")
        
    }
    
    class func Edit() {
        
        print("\u{001B}[0;44mThe Edit recreation is under construction")
        print("\u{001B}[0;34mEnter Text Input: ")
        print("\u{001B}[0;37m")
        let line01 = readLine() ?? String("")
        let line02 = readLine() ?? String("")
        let line03 = readLine() ?? String("")
        let line04 = readLine() ?? String("")
        let line05 = readLine() ?? String("")
        let line06 = readLine() ?? String("")
        let line07 = readLine() ?? String("")
        let line08 = readLine() ?? String("")
        let line09 = readLine() ?? String("")
        let line10 = readLine() ?? String("")
        let line11 = readLine() ?? String("")
        let line12 = readLine() ?? String("")
        print("\u{001B}[0;34mprinting input")
        print("\u{001B}[0;37m")
        print(line01)
        print(line02)
        print(line03)
        print(line04)
        print(line05)
        print(line06)
        print(line07)
        print(line08)
        print(line09)
        print(line10)
        print(line11)
        print(line12)
    }
    
    class func Goto(goto: String) {
        // holy shizzle this is gonna be difficult.
    }
    
    class func Invalid() {
        print("Bad command or file name")
        print(" ")
    }
    
    class func Dir(usedDiskSpace: String, freeDiskSpace: String, dir2: [String]) {
        
        var dir1 = dir2
        //let dirAsString = dir.joined(separator: "\n")
        
        //let outputFromCommand = dirAsString.replacingOccurrences(of: ",", with: "\0")
        print("")
        print("Directory of C:" + path)
        print(" ")
        //print(outputFromCommand)
        var remainingFiles = dir1.count
        var FileCount = 0
        var DirCount = 0
        var FileSize = 0
        var SPACESCOUNT = ""
        var FILEIS = ""
        repeat {
            SPACESCOUNT = ""
            let FirstFileInDirectory = dir1.first ?? String("No files or folders.")
           
            let systemAttributes = try! FileManager.default.attributesOfItem(atPath: path + "/" + FirstFileInDirectory)
           
            //let documentsDirectoryURL = URL(fileURLWithPath: path)
            
            //print(systemAttributes)
            //FileAttributeKey.systemSize
            let FirstFilesType = (systemAttributes[FileAttributeKey.type] as? String) ?? String("NSFileTypeRegular")
            let FirstFilesSize = (systemAttributes[FileAttributeKey.size] as? NSNumber)?.intValue
            let FirstFilesDateRaw = (systemAttributes[FileAttributeKey.creationDate] as? Date ?? Date(timeIntervalSinceNow: TimeInterval(1.0)))
            let FileDateFormat = DateFormatter()
            FileDateFormat.dateFormat = "dd/MM/yyyy   HH:mm a"
            let FirstFilesDate = FileDateFormat.string(from: FirstFilesDateRaw).uppercased()
            let FormattedFileSizePass1 = (byteCountFormatter.string(for: FirstFilesSize) ?? "").replacingOccurrences(of: "bytes", with: "")
            let FormattedFileSize = FormattedFileSizePass1.replacingOccurrences(of: "byte", with: "")
            //  ?? String("??/??/????")
            //print(systemAttributes)
            SPACESCOUNT = ""
            repeat {
                SPACESCOUNT.insert(" ", at: SPACESCOUNT.startIndex)
                FILEIS = SPACESCOUNT + FormattedFileSize
            } while FILEIS.count < 9
            SPACESCOUNT = ""
            
            
            
            //if return true while repeat let var _ else
            
            if FirstFilesType == "NSFileTypeDirectory" {
                DirCount += 1
                print(FirstFilesDate + "  " + "<DIR>" + "         " + FirstFileInDirectory)
            } else {
                FileSize += FirstFilesSize ?? Int(0)
                FileCount += 1
                print(FirstFilesDate + "  " + "     " + FILEIS + FirstFileInDirectory)
            }
            remainingFiles -= 1
            dir1.removeFirst()
            //FirstFileInDirectory
            
        } while remainingFiles != 0
        //print(try fileManager.attributesOfItem(atPath: path + "/halflife2.ttf"))
        //above was used for testing. i chose a random file
        var FILESTRING = String(FileCount) + " File(s)"
        var DIRSTRING = String(DirCount) + " Dir(s) "
        var DISKUSED = usedDiskSpace
        var DISKFREE = freeDiskSpace + " free"
        var SPACES = ""
        
        // alignment code
        repeat {
            SPACES.insert(" ", at: SPACES.startIndex)
            FILESTRING = SPACES + String(FileCount) + " File(s)"
        } while FILESTRING.count < 24
        SPACES = ""
        repeat {
            SPACES.insert(" ", at: SPACES.startIndex)
            DIRSTRING = SPACES + String(DirCount) + " Dir(s)"
        } while DIRSTRING.count < 24
        SPACES = ""
        repeat {
            SPACES.insert(" ", at: SPACES.startIndex)
            DISKUSED = SPACES + usedDiskSpace
        } while DISKUSED.count < 21
        SPACES = ""
        repeat {
            SPACES.insert(" ", at: SPACES.startIndex)
            DISKFREE = SPACES + freeDiskSpace + " free"
        } while DISKFREE.count < 26
        SPACES = ""
        // end alignment code
        
        //print(" ")
        print(FILESTRING + "  " + DISKUSED)
        print(DIRSTRING + "  " + DISKFREE)
        //print("       " + String(FileCount) + " File(s)         " + usedDiskSpace)//sizeToDisplay)
        //print("       " + String(DirCount) + " Dir(s)" + freeDiskSpace + " free")
        print(" ")
    }
    
    class func GoUp() {
        fileManager.changeCurrentDirectoryPath("..")
        sizeToDisplay = "Not yet calculated"
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
                let  byteCountFormatter =  ByteCountFormatter()
                byteCountFormatter.allowedUnits = .useBytes
                byteCountFormatter.countStyle = .file
                
                sizeToDisplay = byteCountFormatter.string(for: folderSize) ?? ""
                
                //print(sizeToDisplay)  // "X,XXX,XXX bytes"
            }
        }
    }
    
    class func ChangeDir(newpath: String) {
        fileManager.changeCurrentDirectoryPath(String(newpath))
        sizeToDisplay = "Not yet calculated"
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
                let  byteCountFormatter =  ByteCountFormatter()
                byteCountFormatter.allowedUnits = .useBytes
                byteCountFormatter.countStyle = .file
                
                sizeToDisplay = byteCountFormatter.string(for: folderSize) ?? ""
                
                //print(sizeToDisplay)  // "X,XXX,XXX bytes"
            }
        }
    }
    class func Nano() {
        let NewProcess = shell("/usr/bin/screen /usr/bin/nano")
        _ = NewProcess.first
        //print(NewProcess)
    }
    
    class func Execute(path: String) {
        if fileManager.fileExists(atPath: fileManager.currentDirectoryPath + path) {
            _ = shell(fileManager.currentDirectoryPath + path)
            
        } else if fileManager.fileExists(atPath: path) {
            _ = shell(path)
        } else if fileManager.fileExists(atPath: "/usr/bin/" + path) {
            _ = shell("/usr/bin/" + path)
        } else if fileManager.fileExists(atPath: "/bin/" + path) {
            _ = shell("/bin/" + path)
        }
    }
    
//    class func FileHandler(response: String, UserInput: String, command: String) {
//        if fileManager.fileExists(atPath: path + "/" + (response )) {
//            if UserInput.hasSuffix(".bat") || UserInput.hasSuffix(".bat ") {
//
//                let x = LineReader(path: UserInput)
//
//                guard let reader = x else {
//
//                    print("Something happened to bypass the 'if exists' check! did you drag and drop the file into the console?")
//                    throw NSError(domain: "IfExistsReportsTrueButFileStillCannotBeFound", code: 404, userInfo: nil) //ProgramArguments = "con" // cannot open file
//                }
//                //let BatchFileReader = BatchFileReaderPass1 ?? StreamReader(path: " ")!
//
//
//
//                if UserInput.contains("con") {
//
//
//                } else {
//
//                    // If the "-new-profile" argument was passed, then return
//                    // an instance of the new implementation.
//
//                    for line in reader {
//                        print(line)
//                    }
//                }
//            } else {
//                let NewProcess = shell(path + "/" + response)
//                _ = NewProcess.first
//            }
//            //print(NewProcess)
//        } else {
//
//            //print("Debug for ya. Response = \"" + response! + "\". shell input = \"" + "/usr/bin/env" + " " + response! + "\". " )
//
//            if UserInput.hasSuffix(".bat") || UserInput.hasSuffix(".bat ") {
//
//            } else {
//                let NewProcess = shell(response)
//                _ = NewProcess.first
//            }
//            //print(NewProcess)
//
//        }
//    }
    
}

