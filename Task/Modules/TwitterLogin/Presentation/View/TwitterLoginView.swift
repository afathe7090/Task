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
    
    private lazy var scrollVIew: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var twitterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "twitter")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Palatino Bold", size: 30)
        lbl.textAlignment = .center
        lbl.text = "Sign in by Twitter"
        return lbl
    }()
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Gmail
    //-----------------------------------------------------------------------------------
    
    private lazy var gmailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var siginGmailLabel: UILabel =  {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Palatino Bold", size: 18)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.text = "Sign in with google"
        return lbl
    }()
    
    
    private lazy var googleImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "google")
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return image
    }()
    
    private lazy var googleStack: UIStackView = {
        let arrangedSubView = [googleImageView, siginGmailLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubView)
        stackView.axis = .horizontal
        stackView.contentMode = .scaleToFill
        stackView.spacing = 0
        stackView.alignment = .center
        return stackView
    }()
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  apple
    //-----------------------------------------------------------------------------------
    
    private lazy var appleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var siginAppleLabel: UILabel =  {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont(name: "Palatino Bold", size: 18)
        lbl.textAlignment = .center
        lbl.text = "Sign in with apple"
        return lbl
    }()
    
    
    private lazy var appleImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "apple")
        image.tintColor = .black
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return image
    }()
    
    private lazy var appleStack: UIStackView = {
        let arrangedSubView = [appleImageView, siginAppleLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubView)
        stackView.axis = .horizontal
        stackView.contentMode = .scaleToFill
        stackView.spacing = 0
        stackView.alignment = .center
        return stackView
    }()
    
    
    
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -separator
    //-----------------------------------------------------------------------------------
    private lazy var rightSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    
    private lazy var leftSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var separatorStack: UIStackView =  {
        let arrangedSubView = [leftSeparator, orLabel,rightSeparator]
        let stackView = UIStackView(arrangedSubviews: arrangedSubView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.alignment = .center
        return stackView
    }()
    
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Fields
    //-----------------------------------------------------------------------------------
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private lazy var fieldsStack: UIStackView = {
        let arrangedSubView: [UIView] = [emailTextField , passwordTextField]
        let stackView = UIStackView(arrangedSubviews: arrangedSubView)
        return stackView
    }()
    
    
    
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
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Layout
    //-----------------------------------------------------------------------------------
   
    
    fileprivate func configureContainerView(){
        addSubview(scrollVIew)
        scrollVIew.snp.makeConstraints({$0.edges.equalTo(self.snp.edges)})
        
        scrollVIew.addSubview(containerView)
        containerView.snp.makeConstraints({
            $0.edges.equalTo(scrollVIew.snp.edges)
            $0.width.equalTo(scrollVIew.snp.width).multipliedBy(1)
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
        
    }
}
