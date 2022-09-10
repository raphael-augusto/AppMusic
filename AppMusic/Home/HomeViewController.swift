//
//  ViewController.swift
//  AppMusic
//
//  Created by Raphael Augusto on 31/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeViewControllerScreen?
    
    
    override func loadView() {
        self.screen = HomeViewControllerScreen()
        self.screen?.configureTableViewProtocolos(delegate: self, dataSource: self)
        self.view   = self.screen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//MARK: - Delegate and DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardViewTableViewCell.identifier, for: indexPath) as? CardViewTableViewCell
        cell?.setupCell(data: CardData[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    
    //Redirecting to another screen
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = DetailViewController()
        VC.cardModel = CardData[indexPath.row]
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
    }
    
    
    //Height For cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
