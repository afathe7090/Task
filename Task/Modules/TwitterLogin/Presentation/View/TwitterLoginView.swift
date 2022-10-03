//
//  TwitterLoginView.swift
//  Task
//
//  Created by Ahmed Fathy on 01/10/2022.
//

import UIKit
import SnapKit


protocol TwitterViewDelegate: AnyObject {
    
}


class TwitterLoginView: UIView {
    
    
    private weak var delegate: TwitterViewDelegate!

    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Layout
    //-----------------------------------------------------------------------------------
    
    let containerView = TTView(color: .clear)
    let twitterImageView = TTImageView(image: .twitter_img)
    let titleLabel = TTLabel(text: "Sign in by Twitter", font: .palatino_bold_twitter, textAlignment: .center)

    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Gmail
    //-----------------------------------------------------------------------------------
    
    
    let gmailView       = TTView(color: .white, borderColor: .lightGray, borderWidth: 1, cornerRadius: 30)
    let siginGoogleLabel = TTLabel(text: "Sign in with google", font: .palatino_bold, textAlignment: .center, textColor: .black)
    let googleImageView = TTImageView(image: .google_img , height: 30,width: 30)
    
    private lazy var googleStack: TTStackView = {
        let arrangedSubView = [googleImageView, siginGoogleLabel]
        let googleStack = TTStackView(arrangedSubView: arrangedSubView, spacing: 0, axis: .horizontal, contentMode: .scaleToFill, alignment: .center)
        return googleStack
    }()
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  apple
    //-----------------------------------------------------------------------------------
    
    let appleView       = TTView(color: .white, borderColor: .lightGray, borderWidth: 1, cornerRadius: 30)
    let siginAppleLabel = TTLabel(text: "Sign in with apple", font: .palatino_bold, textAlignment: .center, textColor: .black)
    let appleImageView  = TTImageView(image: .apple_img , height: 30,width: 30)
    
    private lazy var appleStack: TTStackView = {
        let arrangedSubView = [appleImageView, siginAppleLabel]
        let appleStack = TTStackView(arrangedSubView: arrangedSubView, spacing: 0, axis: .horizontal, contentMode: .scaleToFill, alignment: .center)
        return appleStack
    }()
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -separator
    //-----------------------------------------------------------------------------------
    
    
    let rightSeparator = TTView(color: .lightGray , height: 1)
    let leftSeparator = TTView(color: .lightGray , height: 1)
    let orLabel = TTLabel(text: "Or", textAlignment: .center)
    
    private lazy var separatorStack: TTStackView = {
        let arrangedSubView = [leftSeparator, orLabel,rightSeparator]
        let separatorStack = TTStackView(arrangedSubView: arrangedSubView, spacing: 0, axis: .horizontal, contentMode: .scaleToFill, alignment: .center ,distribution: .fillEqually)
        return separatorStack
    }()
    
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Fields
    //-----------------------------------------------------------------------------------
    
    let emailTextField = TTTextField(fontSiza: 17, placeholder: "Phone, email, or username",
                                     placeholderFont: .systemFont(ofSize: 17), placeholderColor: .darkGray)
    let passwordTextField = TTTextField(fontSiza: 17, placeholder: "Password",
                                     placeholderFont: .systemFont(ofSize: 17), placeholderColor: .darkGray)
    
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Init
    //-----------------------------------------------------------------------------------
    init(delegate: TwitterViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.backgroundColor = .systemBackground
        configureContainerView()
        configureTitleVIewByTwitterImageAndTittleLabel()
        configureGoogleView()
        configureAppleView()
        configureSeparatorViews()
        configureEmailANdPasswordView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Layout
    //-----------------------------------------------------------------------------------
    
    fileprivate func configureContainerView(){
        addSubview(containerView)
        containerView.snp.makeConstraints({
            $0.edges.equalTo(snp.edges)
        })
    }
    
    fileprivate func configureTitleVIewByTwitterImageAndTittleLabel(){
        containerView.addSubview(twitterImageView)
        twitterImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalTo(snp.centerX)
            $0.width.height.equalTo(100)
        }
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({
            $0.top.equalTo(twitterImageView.snp.bottom).offset(20)
            $0.leading.equalTo(containerView.snp.leading).offset(20)
            $0.trailing.equalTo(containerView.snp.trailing).offset(-20)
        })
    }
    
    fileprivate func configureGoogleView(){
        containerView.addSubview(gmailView)
        gmailView.snp.makeConstraints({
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(containerView)
            $0.width.equalTo(containerView).multipliedBy(0.85)
            $0.height.equalTo(60)
        })
        
        gmailView.addSubview(googleStack)
        googleStack.snp.makeConstraints({
            $0.center.equalTo(gmailView)
            $0.width.equalTo(gmailView.snp.width).multipliedBy(0.8)
            $0.height.equalTo(gmailView.snp.height).multipliedBy(0.9)
        })
    }
    
    fileprivate func configureAppleView(){
        containerView.addSubview(appleView)
        appleView.snp.makeConstraints({
            $0.top.equalTo(gmailView.snp.bottom).offset(20)
            $0.centerX.equalTo(containerView)
            $0.width.equalTo(containerView).multipliedBy(0.85)
            $0.height.equalTo(60)
        })
        
        appleView.addSubview(appleStack)
        appleStack.snp.makeConstraints({
            $0.center.equalTo(appleView)
            $0.width.equalTo(appleView.snp.width).multipliedBy(0.8)
            $0.height.equalTo(appleView.snp.height).multipliedBy(0.9)
        })
    }
    
    fileprivate func configureSeparatorViews(){
        containerView.addSubview(separatorStack)
        separatorStack.snp.makeConstraints({
            $0.top.equalTo(appleView.snp.bottom).offset(10)
            $0.width.equalTo(containerView.snp.width).multipliedBy(0.85)
            $0.centerX.equalTo(containerView.snp.centerX)
            $0.height.equalTo(30)
        })
    }
    
    fileprivate func configureEmailANdPasswordView(){
        containerView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints({
            $0.top.equalTo(separatorStack.snp.bottom).offset(15)
            $0.leading.equalTo(containerView.snp.leading).offset(20)
            $0.trailing.equalTo(containerView.snp.trailing).offset(-20)
            $0.height.equalTo(50)
            
        })
//
        containerView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints({
            $0.top.equalTo(emailTextField.snp.bottom).offset(25)
            $0.leading.equalTo(containerView.snp.leading).offset(20)
            $0.trailing.equalTo(containerView.snp.trailing).offset(-20)
            $0.height.equalTo(50)
        })
        
    }
    
}

