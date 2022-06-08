//
//  LoginView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 04/05/22.
//

import UIKit

class LoginView: UIView {
    
    
    // MARK: VIEW DECLARATION
    private var imageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        return view
    }()
    private var backgroudImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "insagramgBG")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "instagram-text")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = Constant.margin30
        stackView.axis = .vertical
        return stackView
    }()
    var txtUserName: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .default
        textField.returnKeyType = .next
        textField.configure(placeHolder: "Email")
        return textField
        
    }()
    
    var txtPassword: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .default
        textField.returnKeyType = .done
        textField.configure(placeHolder: "Password")
        return textField
    }()
    
    
    private var btnLogin: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = Constant.margin8
        button.addTarget(self, action: #selector(buttonLogInClicked), for: .touchUpInside)
        return button
    }()
    private var btnForgotPassword: UIButton = {
        let button = UIButton(type: .system)
        button.contentHorizontalAlignment = .trailing
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)

        let fullAttributedString = NSMutableAttributedString()

        var  attributedLinkString = NSMutableAttributedString(string: "Forgot Password?", attributes:[NSAttributedString.Key.foregroundColor: UIColor.gray,NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        fullAttributedString.append(attributedLinkString)
        button.setAttributedTitle(fullAttributedString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonCreateNewClicked), for: .touchUpInside)
        return button
    }()
    private var btnCreate: UIButton = {
        let button = UIButton(type: .system)
        
        let fullAttributedString = NSMutableAttributedString()

        var  attributedLinkString = NSMutableAttributedString(string: "Don't have account? ", attributes:[NSAttributedString.Key.foregroundColor: UIColor.gray])
        fullAttributedString.append(attributedLinkString)
        
        attributedLinkString = NSMutableAttributedString(string: "Click here to ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue])
        fullAttributedString.append(attributedLinkString)
        
        attributedLinkString = NSMutableAttributedString(string: "Sign Up ", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.foregroundColor: UIColor.blue])
        fullAttributedString.append(attributedLinkString)
        button.setAttributedTitle(fullAttributedString, for: .normal)
     
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonCreateNewClicked), for: .touchUpInside)
        return button
    }()
    
    // MARK: VIEW LIFE CYCLES
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView(){
        
        imageBackgroundView.configureViewWithStaticHeight(superView: self,height: (UIScreen().height / 3) )
        
        backgroudImage.configureView(superView: imageBackgroundView)
        
        logoImage.configureView(superView: imageBackgroundView)
    
        let margin = Margin(top: Constant.margin20, leading: Constant.margin12, bottom: Constant.margin12, trailing: Constant.margin12)
        
        stackView.configureWithTopMargin(superView: self,corespondingView:imageBackgroundView, margin: margin)
        
        addSubViewsInStackView()
    
    }
    @objc
    func buttonLogInClicked(){
        
    }
    @objc
    func buttonCreateNewClicked(){
        
    }
    
    private func addSubViewsInStackView(){
        stackView.addArrangedSubview(txtUserName)
        stackView.addArrangedSubview(txtPassword)
        
        stackView.addArrangedSubview(btnLogin)
        stackView.addArrangedSubview(btnForgotPassword)
        stackView.addArrangedSubview(btnCreate)
        
        txtUserName.heightAnchor.constraint(equalToConstant: Constant.margin40).isActive = true
        txtPassword.heightAnchor.constraint(equalToConstant: Constant.margin40).isActive = true
        btnLogin.heightAnchor.constraint(equalToConstant: Constant.margin40).isActive = true
    }
    
}

extension UIScreen {
    public var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    public var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
}
extension UIView {
    
    func configureView(superView:UIView,constant:CGFloat = 0 ){
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: constant).isActive = true
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: constant).isActive = true
    }
    func configureWithTopMargin(superView:UIView,corespondingView:UIView,margin:Margin ){
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: margin.leading).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -(margin.trailing)).isActive = true
        self.topAnchor.constraint(equalTo: corespondingView.bottomAnchor, constant: margin.top).isActive = true
        self.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: superView.bottomAnchor, multiplier: 1).isActive = true
       
    }
    func configureViewWithStaticHeight(superView:UIView,constant:CGFloat = 0 , height:CGFloat = 0 ){
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: constant),
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}

struct Margin {
    let top: CGFloat
    let leading: CGFloat
    let bottom: CGFloat
    let trailing: CGFloat
}

extension UITextField {
    
    func configure(placeHolder:String){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.autocorrectionType = .default
        self.placeholder = placeHolder
        self.leftViewMode = .always
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12.0, height: 1))
    }
}

struct Constant {
    static let margin4: CGFloat = 4
    static let margin8: CGFloat = 8
    static let margin12: CGFloat = 12
    static let margin16: CGFloat = 16
    static let margin20: CGFloat = 20
    static let margin30: CGFloat = 30
    static let margin40: CGFloat = 40
    
    
}
