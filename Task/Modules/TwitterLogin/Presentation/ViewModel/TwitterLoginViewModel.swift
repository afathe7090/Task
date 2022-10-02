//
//  TwitterLoginViewModel.swift
//  Task
//
//  Created by Ahmed Fathy on 01/10/2022.
//

import Foundation


protocol ViewModelType{
    associatedtype Input
    associatedtype Output
}


protocol TwitterLoginViewModelProtocol: AnyObject {
    var input: TwitterLoginViewModel.Input { get }
    var output: TwitterLoginViewModel.Output { get }
}

class TwitterLoginViewModel: TwitterLoginViewModelProtocol, ViewModelType{
   
    
    class Input {}
    
    class Output {}
    
    let input: Input = .init()
    let output: Output = .init()
    
    
    
    
}
