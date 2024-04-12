//
//  ViewController.swift
//  ContactsApp
//
//  Created by Gega on 4/12/24.
//

import UIKit

struct ContactSection {
    let letter: String
    let contacts: [(name: String, imageName: String)]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var sections = [ContactSection]()
    let ownerName = "Beka Tabunidze"
    let contacts = [
        ("Nodar Ghachava", "Boy1.png"), ("Elene Donadze", "Girl1.png"), ("Temuri Chitashvili", "Boy2.png"), ("Irina Datoshvili", "Girl2.png"), ("Tornike Elqanashvili", "Boy3.png"), ("Ana Ioramashvili", "Girl3.png"), ("Nini Bardavelidze", "Girl4.png"), ("Barbare Tepnadze", "Girl4.png"), ("Mariam Sreseli", "Girl1.png"), ("Valeri Mekhashishvili", "Boy1.png"), ("Zuka Papuashvili", "Boy2.png"), ("Nutsa Beriashvili", "Girl2.png"), ("Luka Kharatishvili", "Boy3.png"), ("Data Robakidze", "Boy3.png"), ("Nika Kakhniashvili", "Boy4.png"), ("Sandro Gelashvili", "Boy4.png"), ("Ana Namgaladze", "Girl1.png"), ("Bakar Kharabadze", "Boy1.png"), ("Archil Menabde", "Boy2.png"), ("Tamuna Kakhidze", "Girl2.png"), ("Giorgi Michitashvili", "Boy3.png"), ("Salome Topuria", "Girl3.png"), ("Luka Gujejiani", "Boy4.png"), ("Gega Tatulishvili", "Boy2.png"), ("Raisa Badalova", "Girl1.png"), ("Aleksandre Saroiani", "Boy1.png"), ("Begi Kopaliani", "Boy2.png"), ("Akaki Titberidze", "Boy2.png"), ("Sandro Kupatadze", "Boy3.png"), ("Gvantsa Gvagvalia", "Girl3.png"), ("Vano Kvakhadze", "Boy4.png")
    ]
    
    private func createSections() {
        let groupedDictionary = Dictionary(grouping: contacts, by: { String($0.0.prefix(1)) })
        let keys = groupedDictionary.keys.sorted()
        sections = keys.map { key in
            let values = groupedDictionary[key]!.sorted { $0.0 < $1.0 }
            return ContactSection(letter: key, contacts: values)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
                navigationController?.navigationBar.prefersLargeTitles = true
                navigationItem.title = "iOS Squad"
            } else {
                navigationItem.title = "iOS Squad"
            }
        setupTableView()
        tableView.tableHeaderView = createTableHeader()
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactCell")
        createSections()
        tableView.reloadData()
    }
    
    func createTableHeader() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        headerView.backgroundColor = .clear

        let imageView = UIImageView(frame: CGRect(x: 16, y: 30, width: 60, height: 60))
        imageView.image = UIImage(named: "Boy1.png")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.layer.masksToBounds = true
        
        let label = UILabel(frame: CGRect(x: 84, y: 45, width: view.frame.size.width - 100, height: 40))
        label.text = "Beka Tabunidze"
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)

        headerView.addSubview(imageView)
        headerView.addSubview(label)

        return headerView
    }

    func setupTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].contacts.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].letter
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactTableViewCell
        let contact = sections[indexPath.section].contacts[indexPath.row]
        cell.configure(name: contact.name, imageName: contact.imageName)

        if contact.name == ownerName {
            cell.iconImageView.isHidden = false
        } else {
            cell.hideIcon()
        }

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map { $0.letter }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return sections.firstIndex { $0.letter == title } ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        
        let selectedContact = sections[indexPath.section].contacts[indexPath.row]

        detailsVC.contactName = selectedContact.name
        detailsVC.contactImageName = selectedContact.imageName

        navigationController?.pushViewController(detailsVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
