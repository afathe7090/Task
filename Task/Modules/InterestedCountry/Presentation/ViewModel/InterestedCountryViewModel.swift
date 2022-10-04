//
//  InterestedCountryViewModel.swift
//  Task
//
//  Created by Ahmed Fathy on 03/10/2022.
//

import Foundation


protocol InterestedCountryViewModelProtocol: AnyObject{
    var input: InterestedCountryViewModel.Input { get }
    var output: InterestedCountryViewModel.Output { get }
    func fetchCities()
}


class InterestedCountryViewModel: InterestedCountryViewModelProtocol,ViewModelType{
    
    class Input{
        @Published var countriesSelected: [String] = []
        
    }
    
    class Output{
        @Published fileprivate(set) var countriesName: [String] = []{
            didSet{
                isLoadingCollectionView = true
            }
        }
        @Published var isLoadingCollectionView: Bool = false
    }
    
    
    var input: Input = .init()
    var output: Output = .init()
    
    private let useCase: InterestedCountryUseCase = InterestedCountryUseCase()
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Functions
    //-----------------------------------------------------------------------------------
    func fetchCities(){
        Task{
            let cities = await useCase.fetchCities()
            output.countriesName = cities.map({$0.name})
            DispatchQueue.main.async {
                self.output.isLoadingCollectionView = true
            }
        }
        
    }
}
