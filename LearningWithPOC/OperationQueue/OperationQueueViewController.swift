//
//  OperationQueueViewController.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 05/05/22.
//

import UIKit

class OperationQueueViewController: UIViewController {
    
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    private var name: String = "Dipak"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Operation Queue"
        configureQueue()
        updateNameSync()
    }
    
    func updateNameSync() {
        DispatchQueue.global().async {
            self.lockQueue.async {
                self.name.append("Makwana")
            }
        }

        // Executed on the Main Thread
        lockQueue.async {
            // Executed on the lock queue
            print(self.name)
        }
    }
    
    private func configureQueue(){
        let queue = OperationQueue()
        let blockOperation = BlockOperation {
            print("Executing - 1")
        }
        queue.addOperation {
          print("Executing - 2")
        }
        queue.addOperation(blockOperation)
        
        debugPrint(queue.maxConcurrentOperationCount)
        
        let fileURL = URL(fileURLWithPath: "..")
        let contentImportOperation = ContentImportOperation(itemProvider: NSItemProvider(contentsOf: fileURL)!)

        contentImportOperation.completionBlock = {
            print("Importing completed!")
        }
        let contentUploadOperation = UploadContentOperation()
        contentUploadOperation.addDependency(contentImportOperation)
        contentUploadOperation.completionBlock = {
            print("Uploading completed!")
        }
        queue.addOperations([contentImportOperation, contentUploadOperation], waitUntilFinished: true)
    }
}

final class ContentImportOperation: Operation {

    let itemProvider: NSItemProvider

    init(itemProvider: NSItemProvider) {
        self.itemProvider = itemProvider
        super.init()
    }

    override func main() {
        guard !isCancelled else { return }
        print("Importing content..")

    }
}
final class UploadContentOperation: Operation {
    override func main() {
        guard !dependencies.contains(where: { $0.isCancelled }), !isCancelled else {
            return
        }

        print("Uploading content..")
    }
}
