//
//  TwitterLoginViewModel.swift
//  Task
//
//  Created by Ahmed Fathy on 01/10/2022.
//

import Foundation
import Combine

protocol ViewModelType{
    associatedtype Input
    associatedtype Output
}


protocol TwitterLoginViewModelProtocol: AnyObject {
    var input: TwitterLoginViewModel.Input { get }
    var output: TwitterLoginViewModel.Output { get }
    
    func twitterSignInAuthintication()
}

enum TwitterLoginBindingCases {
    case showHUD
    case dismissHud
    case goHome
    
}

class TwitterLoginViewModel: TwitterLoginViewModelProtocol, ViewModelType{
   
    
    class Input {
        fileprivate(set) var bindingViewControllerCases: PassthroughSubject<TwitterLoginBindingCases, Never> = .init()
    }
    
    class Output {}
    
    let input: Input = .init()
    let output: Output = .init()
    
    private let useCase: TwitterLoginUseCase = TwitterLoginUseCase()
    
    func twitterSignInAuthintication(){
        input.bindingViewControllerCases.send(.showHUD)
        Task{
            do{
                _ = try await useCase.twitterSignInAuthintication()
                self.input.bindingViewControllerCases.send(.goHome)
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
        input.bindingViewControllerCases.send(.dismissHud)
    }
    
}
