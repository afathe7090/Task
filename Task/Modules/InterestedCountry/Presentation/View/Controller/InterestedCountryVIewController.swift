//
//  InterestedCountryVIewController.swift
//  Task
//
//  Created by Ahmed Fathy on 03/10/2022.
//

import UIKit
import Combine
import CombineCocoa

class InterestedCountryVIewController: UIViewController {
    
    
    private let viewModel: InterestedCountryViewModelProtocol
    private(set) var cancellable = Set<AnyCancellable>()
    
    private lazy var mainView: InterestedCountryView =  {
        let view = InterestedCountryView(delegate: self)
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  INit
    //-----------------------------------------------------------------------------------
    init(viewModel: InterestedCountryViewModelProtocol = InterestedCountryViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) { fatalError()}
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Life Cycle
    //-----------------------------------------------------------------------------------
    
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchCities()
        reloadingCollectionView()
        
    }
    
    fileprivate func reloadingCollectionView(){
        viewModel.output.$isLoadingCollectionView.receive(on: RunLoop.main).subscribe(on: RunLoop.main).sink { state in
            if state { self.mainView.collectionView.reloadData() }
        }.store(in: &cancellable)
    }
    
    
}


extension InterestedCountryVIewController: InterestedCountryViewDelegate {
    
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return viewModel.output.countriesName.count
    }
    
    func cellForItemAt(_ cell: CountryCell, indexPath: IndexPath) {
        cell.setupCountryLabel(txt: viewModel.output.countriesName[indexPath.row])
    }
    
    func didSelectItemAt(collectionView: UICollectionView, indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CountryCell else { return }
//        if arrSelectedIndex.count < 7{
//            viewModel.input.countriesSelected.append(viewModel.output.countriesName[indexPath.row])
//            arrSelectedIndex.append(indexPath.row)
//            cell.isSelectedCell(true)
//        }else{
//            return
//        }
    }
    
    func didDeselectItemAt(collectionView: UICollectionView, indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CountryCell else { return }
//        if arrSelectedIndex.contains(indexPath.row) {
//            viewModel.input.countriesSelected = viewModel.input.countriesSelected
//                .filter({$0 != viewModel.output.countriesName[indexPath.row]})
//            cell.isSelectedCell(false)
//        }
    }
    
    
    
    func didTapContinuePublisher(_ tap: AnyPublisher<Void, Never>) {
        tap.sink { _ in
            print(self.viewModel.input.countriesSelected)
        }.store(in: &cancellable)
    }
    
}
