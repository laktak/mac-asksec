import Contacts
import EventKit
import ArgumentParser


struct AskSec: ParsableCommand {

    @Flag(help: "Ask for contacts permissions.")
    var contact: Bool = false

    @Flag(help: "Ask for calendar permissions.")
    var calendar: Bool = false

    @Flag(help: "Ask for reminders permissions.")
    var reminder: Bool = false

    func showResult(accessPermitted: Bool, err: Any?) {
        if accessPermitted {
            print("permission: ok")
        } else {
            print("permission: fail")
            if err != nil {
                print(err!)
            }
        }
    }

    func run() throws {

        if calendar {
            print("now asking for calendar permission")
            let semaphore = DispatchSemaphore(value: 0)
            EKEventStore().requestAccess(to: .event) { (accessPermitted, err) in
                showResult(accessPermitted: accessPermitted, err: err)
                semaphore.signal()
            }
            _ = semaphore.wait(timeout: .now() + 10.0)
        }

        if reminder {
            print("now asking for reminders permission")
            let semaphore = DispatchSemaphore(value: 0)
            EKEventStore().requestAccess(to: .reminder) { (accessPermitted, err) in
                showResult(accessPermitted: accessPermitted, err: err)
                semaphore.signal()
            }
            _ = semaphore.wait(timeout: .now() + 10.0)
        }

        if contact {
            print("now asking for contacts permission")
            let semaphore = DispatchSemaphore(value: 0)
            CNContactStore().requestAccess(for: CNEntityType.contacts) { (accessPermitted, err) in
                showResult(accessPermitted: accessPermitted, err: err)
                semaphore.signal()
            }
            _ = semaphore.wait(timeout: .now() + 10.0)
        }

        if !calendar && !contact && !reminder {
            print("no options, use: --help")
            return
        }


    }
}

AskSec.main()
