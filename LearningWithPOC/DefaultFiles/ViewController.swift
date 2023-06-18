//
//  ViewController.swift
//  LearningWithPOC
//
//  Created by Apple on 23/03/22.
//

import UIKit
import Combine 
import SwiftUI
import RxSwift

class ViewController: UIViewController {
    
    private let viewModal = FirstViewModal(apiManager:APIManager())
    
   // @IBOutlet weak var tableView: UITableView?
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.registerCell(identifiers: [ListTableCell.identifier])
       // tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        isPalindromeNumber()
        nextLargestNumber()
        // apiOperations()
    }
    
    private func configureViews(){
        configureTableView()
    }
    private func configureTableView(){
       // guard let table = self.tableView else {return}
        self.view.addSubview(tableView)
        tableView.configure(dataSource: self, delegate: self)
        tableView.configureView(superView: view)
        tableView.separatorStyle = .singleLine
    }
    
}
// API Operation
extension ViewController {
    private func apiOperations(){
        getEmployeesByURLSession()
        //getEmployeesByCombine()
    }
    
    private func getEmployeesByURLSession(){
        viewModal.getEmployees(compilation: {result in
            switch result {
            case .success(let employee):
                debugPrint(employee.data![0].name)
                // update UI
                break
            case.failure(let err):
                debugPrint(err)
                // handle Error
                break
            }
        })
    }
    private func getData(){
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModal.courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: ListTableCell.identifier, for: indexPath) as? ListTableCell,let obj = viewModal.courseList[safe:indexPath.row] else {return UITableViewCell()}
        cell.lblTitle?.text = obj.name
        
        return cell
    }
}
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let obj = viewModal.courseList[safe:indexPath.row] else {return}
        
        if obj.id == .combine {
            self.navigateToCombineVC()
        }else if obj.id == .compositionalLayout {
            self.navigateToCompositionalLayout()
        }
        else if obj.id == .viper {
            self.navigateViperVC()
        }
        else if obj.id == .tableViewCollectionView   { // SwiftUI
            self.navigateToSwiftUI_TableCollectionView()
        }
        else if  obj.id == .swiftUI  { // SwiftUI
            self.navigateToSwiftUI_SettingDetailView()
        }
        else if  obj.id == .uiKitSwiftUI  { // SwiftUI
            self.navigateToSwiftUI_SettingView()
        }
        else if  obj.id == .rxSwift  { // SwiftUI
            self.navigateToRxSwiftVC()
        }
        else if  obj.id == .liveTV  { // SwiftUI
            self.navigateToSwiftUI_LiveTVView()
        }
        else if  obj.id == .designViaCode  {
            self.navigateToDesignViaCodeVC()
        }
        
        else if  obj.id == .designCollectionViewViaCode  {
            self.navigateToDesignCollectionViewViaCode()
        }
        else if obj.id == .designTableCollectionViewViaCode {
            navigateToTableCollectionViewViaCode()
        }
        else if obj.id == .operationQueue {
            navigateToOperationQueue()
        }
        else if obj.id == .dsa {
            navigateToDSAVC()
        }

    }
}

extension UIViewController {
    
}

extension UIViewController{
    
    func navigateToCombineVC(){
        let viewController = CombineViewController(nibName: "CombineViewController",bundle:nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToDesignViaCodeVC(){
        let viewController = DesignViaCodeViewController(nibName: "DesignViaCodeViewController",bundle:nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToCompositionalLayout(){
        let viewController = CompositionViewController(nibName: "CompositionViewController",bundle:nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToRxSwiftVC(){
        let viewController = RxSwiftViewController(nibName: "RxSwiftViewController",bundle:nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateViperVC(){
        let viewController = ViperViewController(nibName: "ViperViewController",bundle:nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToDesignCollectionViewViaCode(){
        let viewController = ViaCodeCollectionViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToTableCollectionViewViaCode(){
        let viewController = TableCollectionViewControllerViaCode()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToOperationQueue(){
        let viewController = OperationQueueViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToDSAVC(){
        let viewController = DSAViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

//// SWift UI Navigation
extension UIViewController {
    
    func navigateToSwiftUI_TableCollectionView(){
        let viewController = UIHostingController(rootView: TableCollectionView())
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToSwiftUI_SettingView(){
        let viewController = UIHostingController(rootView: SettingView())
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToSwiftUI_SettingDetailView(){
        let viewController = UIHostingController(rootView: DownloadView())
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToSwiftUI_LiveTVView(){
        let viewController = LiveTVHostingVC(rootView: LiveTVView(selectedItem: nil))
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


extension ViewController {

    func isPalindromeNumber() {
        var number1 = 12321
        let number2 = 12345

        if isPalindrome(number1) {
            print("\(number1) is a palindrome")
        } else {
            print("\(number1) is not a palindrome")
        }

        if isPalindrome(number2) {
            print("\(number2) is a palindrome")
        } else {
            print("\(number2) is not a palindrome")
        }
    }

    func nextLargestNumber() {
        let n = 2314
        if let nextLargest = nextLargestNumber(withSameDigitsAs: n) {
            print("The next largest number with the same digits as \(n) is \(nextLargest)")
        } else {
            print("\(n) is already the largest possible number with the same digits")
        }
    }

    func isPalindrome(_ number: Int) -> Bool {
        var reversedNumber = 0
        var originalNumber = number

        while originalNumber > 0 {
            let lastDigit = originalNumber % 10
            reversedNumber = reversedNumber * 10 + lastDigit
            originalNumber /= 10
        }

        return reversedNumber == number
    }

    func nextLargestNumber(withSameDigitsAs n: Int) -> Int? {
        // Convert the integer to an array of digits
        var digits: [Int] = []
        var temp = n
        while temp > 0 {
            digits.insert(temp % 10, at: 0)
            temp /= 10
        }

        // Find the first digit that is smaller than the digit to its right
        var i = digits.count - 2
        while i >= 0 && digits[i] >= digits[i+1] {
            i -= 1
        }

        // If such a digit is not found, the number is already the largest possible
        if i < 0 {
            return nil
        }

        // Find the smallest digit to the right of A that is larger than A
        var j = digits.count - 1
        while digits[j] <= digits[i] {
            j -= 1
        }

        // Swap A and B
        let tempDigit = digits[i]
        digits[i] = digits[j]
        digits[j] = tempDigit

        // Sort the digits to the right of the swapped digit A in ascending order
        let suffix = digits[(i+1)...].sorted()

        // Construct the resulting array of digits and convert it back to an integer
        let resultDigits = digits[0...i] + suffix
        let result = resultDigits.reduce(0) { $0 * 10 + $1 }
        return result
    }
}
