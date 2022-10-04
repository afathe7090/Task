//
//  InterestedCountryViewModel.swift
//  Task
//
//  Created by Ahmed Fathy on 03/10/2022.
//

import Foundation
import Combine

protocol InterestedCountryViewModelProtocol: AnyObject{
    var input: InterestedCountryViewModel.Input { get }
    var output: InterestedCountryViewModel.Output { get }
}


class InterestedCountryViewModel: InterestedCountryViewModelProtocol,ViewModelType{
    
    class Input{
        let citites: CurrentValueSubject<[String], Never> = CurrentValueSubject([])
    }
    
    class Output{
    }
    
    
    var input: Input = .init()
    var output: Output = .init()
    
    private let useCase: InterestedCountryUseCase = InterestedCountryUseCase()
    

}
