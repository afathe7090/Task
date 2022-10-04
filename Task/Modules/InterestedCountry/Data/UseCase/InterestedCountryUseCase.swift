//
//  InterestedCountryUseCase.swift
//  Task
//
//  Created by Ahmed Fathy on 03/10/2022.
//

import Foundation


class InterestedCountryUseCase  {
    
    
    private let repo: InterestedCountryRepo = InterestedCountryRepoImple()
    
    func fetchCities() async ->  [City]{
        return await repo.fetchCities()
    }
}
