//
//  MyEventViewController.swift
//  HuskyTeamMatch_final
//
//  Created by Iris on 11/16/23.
//

import UIKit

class MyEventViewController: UIViewController {
    let myEvent = MyEventView()
    var events = [Event]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadEventsFromFirebase()
    }
    
    override func loadView() {
        view = myEvent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
        setupDelegatesAndTargets()
    }
    
    private func setupTableView() {
        myEvent.tableViewEvents.register(MyEventTableViewCell.self, forCellReuseIdentifier: "MyEventTableViewCell")
        myEvent.tableViewEvents.dataSource = self
        myEvent.tableViewEvents.delegate = self
    }

    private func setupUI() {
        self.title = "MyEvent"
        myEvent.tableViewEvents.separatorStyle = .none
        myEvent.tableViewEvents.backgroundColor = .white
    }
   
    private func setupDelegatesAndTargets() {
        myEvent.createEventButton.addTarget(self, action: #selector(createEventButtonTapped), for: .touchUpInside)
    }

    @objc private func createEventButtonTapped() {
        let newEventVC = AddNewEventViewController()
        newEventVC.onEventCreated = { [weak self] newEvent in
            self?.events.append(newEvent)
            self?.myEvent.tableViewEvents.reloadData()
        }
        
        navigationController?.pushViewController(newEventVC, animated: true)
    }
    
    private func loadEventsFromFirebase() {
        FirebaseEventService.sharedEvent.loadEvents { [weak self] fetchedEvents in
            self?.events = fetchedEvents
            self?.myEvent.tableViewEvents.reloadData()
        }
    }
}

extension MyEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyEventTableViewCell", for: indexPath) as? MyEventTableViewCell else {
            fatalError("Expected MyEventTableViewCell type for reuseIdentifier MyEventTableViewCell. Check the cell type in Storyboard.")
        }
        let event = events[indexPath.row]
        cell.LabelEvent.text = event.title
        return cell
    }
}

extension MyEventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Here you can handle the cell selection if needed.
//        let eventDetailVC = EventDetailViewController()
//        let selectedEvent = events[indexPath.row]
//        eventDetailVC.eventDetail.event = selectedEvent
//        navigationController?.pushViewController(eventDetailVC, animated: true)
        
    }
}

