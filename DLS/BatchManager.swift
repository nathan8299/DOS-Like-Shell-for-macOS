//else if fileManager.fileExists(atPath: path + "/" + (response ?? String("con"))) || fileManager.fileExists(atPath: (response ?? String("con"))) || fileManager.fileExists(atPath: "/bin/" + (response ?? String("con"))) || fileManager.fileExists(atPath: "/usr/bin/" + (response ?? String("con"))) || fileManager.fileExists(atPath: (responseM)) {
//if fileManager.fileExists(atPath: path + "/" + (response ?? String("con"))) {
//    if UserInput.hasSuffix(".bat") || UserInput.hasSuffix(".bat ") {
//
//        let x = LineReader(path: UserInput)
//        
//        guard let reader = x else {
//
//            print("Something happened to bypass the 'if exists' check! did you drag and drop the file into the console?")
//            throw NSError(domain: "IfExistsReportsTrueButFileStillCannotBeFound", code: 404, userInfo: nil) //ProgramArguments = "con" // cannot open file
//        }
//        //let BatchFileReader = BatchFileReaderPass1 ?? StreamReader(path: " ")!
//
//
//
//        if UserInput.contains("con") {
//
//
//        } else {
//
//            // If the "-new-profile" argument was passed, then return
//            // an instance of the new implementation.
//
//            for line in reader {
//                print(line)
//            }
//        }
//    } else {
//        let NewProcess = shell(path + "/" + response!)
//        _ = NewProcess.first
//    }
//    //print(NewProcess)
//} else {
//
//    //print("Debug for ya. Response = \"" + response! + "\". shell input = \"" + "/usr/bin/env" + " " + response! + "\". " )
//
//    if UserInput.hasSuffix(".bat") || UserInput.hasSuffix(".bat ") {
//
//        var rawInput = command
//        if command.hasSuffix(" ") {
//            rawInput = String(command.dropLast())
//        }
//        //print(rawInput + "(hi)")
//        let x = LineReader(path: rawInput)
//
//        guard let reader = x else {
//
//            print("Something happened to bypass the 'if exists' check! did you drag and drop the file into the console?")
//            throw NSError(domain: "IfExistsReportsTrueButFileStillCannotBeFound", code: 404, userInfo: nil) //ProgramArguments = "con" // cannot open file
//        }
//        //let BatchFileReader = BatchFileReaderPass1 ?? StreamReader(path: " ")!
//
//
//
//        if UserInput.contains("con") {
//
//
//        } else {
//
//            // If the "-new-profile" argument was passed, then return
//            // an instance of the new implementation.
//            var currentLine = 0
//            var gotoLocations = Array(["con"])
//            var gotoLocationsInt = Array([0])
//            //for line in reader {
//            //    print(line)
//            //}
//
//            for line in reader {
//                currentLine += 1
//
//                randomCONVAR = Int.random(in: 0 ... 999999)
//                response = line
//                UserInput = response!.replacingOccurrences(of: "%random%", with: String(randomCONVAR))
//                hello = "world!"
//                index = hello.startIndex
//                paraUsed = String.SubSequence(" ")
//
//                seperatedInput = UserInput.components(separatedBy: " ")
//
//                command = seperatedInput.first ?? String("con")
//
//                if UserInput.contains(" ") {
//                    //String.CompareOptions.
//                    //print("test")
//                    index = UserInput.range(of: " ")!.upperBound
//                    //let indexInt = response?.distance(from: (response?.startIndex)!, to: index!)
//                    //let indexmap = index.map(transform: (index) throws -> UnboundedRange_)
//                    //let indexmap = index.map { (index) -> UnboundedRange_ in
//                    //let paramatersUsed = index.map((response?.substring(from:))!)
//                    paraUsed = UserInput[index...]
//                    //index.
//                    //let commandUsed = index.map((response?.substring(to:))!)
//
//                    //let indexInt = response?.distance(from: "", to: " ")
//                    //let parameter = String(response?[..<index])
//                    //print(index!)
//                    //print(commandUsed!)
//                }
//
//                //print(line)
//                if ((command == "con")) {
//
//                } else if UserInput.hasPrefix(":") {
//                    gotoLocations.append(line)
//                    gotoLocationsInt.append(currentLine)
//
//                } else if ((command == "goto")) {
//                    if gotoLocations.contains(":" + paraUsed) {
//                        let posIndex = gotoLocations.firstIndex(of: ":" + paraUsed)
//                        let pos = (posIndex?.distance(to: 0) ?? 0) * -1
//                        let gotoLine = gotoLocationsInt[pos]
//                        paraUsedString = String(paraUsed)
//
//                        print("need to goto " + paraUsedString + " at line " + String(gotoLine), terminator:"")
//
//                    }
//                } else if ((command == "echo")) {
//
//
//                    //let outputFromCommand = response?.replacingOccurrences(of: "echo", with: "\0")
//                    print(paraUsed, terminator:"")
//                } else if ((command == "pause")) {
//
//
//                    //let outputFromCommand = response?.replacingOccurrences(of: "echo", with: "\0")
//                    DOS.Pause()
//
//
//
//                } else if ((command == "cd..")) {
//                    fileManager.changeCurrentDirectoryPath("..")
//                    sizeToDisplay = "Not yet calculated"
//                    dispatchQueue.async{
//                        // get your directory url
//                        let documentsDirectoryURL = URL(fileURLWithPath: path)
//                        //print(documentsDirectoryURL)
//                        //print()
//                        // check if the url is a directory
//                        if (try? documentsDirectoryURL.resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true {
//                            var folderSize = 0
//                            (FileManager.default.enumerator(at: documentsDirectoryURL, includingPropertiesForKeys: nil)?.allObjects as? [URL])?.lazy.forEach {
//                                folderSize += (try? $0.resourceValues(forKeys: [.totalFileAllocatedSizeKey]))?.totalFileAllocatedSize ?? 0
//                            }
//                            let  byteCountFormatter =  ByteCountFormatter()
//                            byteCountFormatter.allowedUnits = .useBytes
//                            byteCountFormatter.countStyle = .file
//
//                            sizeToDisplay = byteCountFormatter.string(for: folderSize) ?? ""
//
//                            //print(sizeToDisplay)  // "X,XXX,XXX bytes"
//                        }
//                    }
//                } else if ((command == "cd")) {
//                    fileManager.changeCurrentDirectoryPath(String(paraUsed))
//                    sizeToDisplay = "Not yet calculated"
//                    dispatchQueue.async{
//                        // get your directory url
//                        let documentsDirectoryURL = URL(fileURLWithPath: path)
//                        //print(documentsDirectoryURL)
//                        //print()
//                        // check if the url is a directory
//                        if (try? documentsDirectoryURL.resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true {
//                            var folderSize = 0
//                            (FileManager.default.enumerator(at: documentsDirectoryURL, includingPropertiesForKeys: nil)?.allObjects as? [URL])?.lazy.forEach {
//                                folderSize += (try? $0.resourceValues(forKeys: [.totalFileAllocatedSizeKey]))?.totalFileAllocatedSize ?? 0
//                            }
//                            let  byteCountFormatter =  ByteCountFormatter()
//                            byteCountFormatter.allowedUnits = .useBytes
//                            byteCountFormatter.countStyle = .file
//
//                            sizeToDisplay = byteCountFormatter.string(for: folderSize) ?? ""
//
//                            //print(sizeToDisplay)  // "X,XXX,XXX bytes"
//                        }
//                    }
//                } else if ((command == "con")) {
//                    DOS.Console()
//                } else {
//                    print("Bad command or file name")
//                    print(" ")
//                }
//
//            }
//
//        }
//    } else {
//        let NewProcess = shell(response!)
//        _ = NewProcess.first
//    }
//    //print(NewProcess)
//
//}
//}
