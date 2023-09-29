import UIKit

enum MembersTeams {
    case iOSDevelopmentTeam
    case AndroidDevelopmentTeam
    case UIUXDesignTeam
    
}

struct neonAcademyMember {
    let fullName:String
    var title:String
    let horoscope:String
    let memberLevel:String
    let homeTown:String
    let age:Int
    let contactInformation: ContactInformation
    var mentorLevel:String?
    var team : MembersTeams
    }

class ContactInformation {
    var phoneNumber:Int
    var email:String
    
    init(phoneNumber: Int, email: String) {
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
var memberCenker = neonAcademyMember(fullName: "Cenker Soyak", title: "iOS Developer", horoscope: "Aries", memberLevel: "A1", homeTown: "Izmir", age: 21,contactInformation: ContactInformation(phoneNumber: 05349793739, email: "cenkersyk@gmail.com"), team: .iOSDevelopmentTeam)

var memberBerk = neonAcademyMember(fullName: "Berk Ceylan", title: "iOS Developer", horoscope: "Scorpio", memberLevel: "Lead", homeTown: "Istanbul", age: 25, contactInformation: ContactInformation(phoneNumber: 05332327818, email: "berk@neonapps.com"), team: .iOSDevelopmentTeam)

var memberMelisa = neonAcademyMember(fullName: "Melisa Kilinc", title: "Graphic Designer", horoscope: "Aries", memberLevel: "A1", homeTown: "Istanbul", age: 23, contactInformation: ContactInformation(phoneNumber: 05322263112, email: "melisa@neonapps.com"), team: .UIUXDesignTeam)

var memberSelay = neonAcademyMember(fullName: "Selay Dolma", title: "Graphic Designer", horoscope: "Taurus", memberLevel: "A1", homeTown: "Istanbul", age: 24, contactInformation: ContactInformation(phoneNumber: 05382128676, email: "selay@neonapps.com"), team: .UIUXDesignTeam)

var memberOnur = neonAcademyMember(fullName: "Onur Sahin", title: "Flutter Developer", horoscope: "Libra", memberLevel: "A1", homeTown: "Manisa", age: 32, contactInformation: ContactInformation(phoneNumber: 05348786574, email: "onur@neonapps.com"), team: .AndroidDevelopmentTeam)

var memberMehmet = neonAcademyMember(fullName: "Mehmet Nuri Firat", title: "Flutter Developer", horoscope: "Gemini", memberLevel: "B1", homeTown: "Kars", age: 25, contactInformation: ContactInformation(phoneNumber: 05349798692, email: "mehmet@neonapps.com"), team: .AndroidDevelopmentTeam)


var membersOfNeonApps = [neonAcademyMember]()
membersOfNeonApps.append(memberBerk)
membersOfNeonApps.append(memberCenker)
membersOfNeonApps.append(memberMelisa)
membersOfNeonApps.append(memberSelay)
membersOfNeonApps.append(memberOnur)
membersOfNeonApps.append(memberMehmet)
print("--------------------------")

//Enums&Switches
//1- Creating a new array that contains only iOS Devs and print out their names

var teamiOS = membersOfNeonApps.filter { $0.team == .iOSDevelopmentTeam}
print("iOS Development Team: ")
for member in teamiOS{
    switch member.team {
    case .iOSDevelopmentTeam:
        print(member.fullName)
    case .AndroidDevelopmentTeam:
        break
    case .UIUXDesignTeam:
        break
    }
}

print("\n")
print("-----------------")

//2- Creating a dictionary that contains the numbers and just printing the UI/UX Designers

var teamCounts: [MembersTeams: Int] = [:]

for member in membersOfNeonApps {
    switch member.team {
    case .UIUXDesignTeam:
        teamCounts [.UIUXDesignTeam, default: 0] += 1
    case .iOSDevelopmentTeam:
        teamCounts [.iOSDevelopmentTeam, default: 0] += 1
    case .AndroidDevelopmentTeam:
        teamCounts [.AndroidDevelopmentTeam, default: 0] += 1
    }
}

if let UIUXCount = teamCounts[.UIUXDesignTeam] {
    print("Number of members in the UI/UX Design Team: \(UIUXCount)")
} else {
    print("No members")
}

print("\n")
print("-----------------")

//3- Creating a function that takes a team as an input and print out full names of that team

func takeTeam(teamToPrint: MembersTeams){
    print("Members in the \(teamToPrint):")
    
    for member in membersOfNeonApps {
        if member.team == teamToPrint {
            print(member.fullName)
        }
    }
}
takeTeam(teamToPrint: .iOSDevelopmentTeam)

print("\n")
print("-----------------")

//4- "Create a switch statement that performs different actions based on the team of a member. For example, if a member is in the iOS Development Team, the function could print out "This member is a skilled iOS developer", and if the member is in the UI/UX Design Team, the function could print out "This member is a talented designer".

func describeMember(teamOfMember: neonAcademyMember){
    switch teamOfMember.team {
    case .AndroidDevelopmentTeam:
        print("He/She is a talented Android Developer.")
    case .UIUXDesignTeam:
        print("He/She is a talented UI/UX Designer.")
    case .iOSDevelopmentTeam:
        print("He/She is a talented iOS Developer.")
    }
}

print("\n")
print("-----------------")

//5- Create a function that takes an age as an input and prints out the full names of all members that are older than that age and belong to a specific team (iOS Development Team for example)

func takingAge(takeAge: Int32, team:MembersTeams){
    let newArray = membersOfNeonApps.filter { $0.age > takeAge && $0.team == team}
    for x in newArray{
        print(x.fullName)
    }
}
takingAge(takeAge: 25, team: .iOSDevelopmentTeam)

print("\n")
print("-----------------")

//6- Create a switch statement that gives a promotion to a member based on their team. For example, if a member is in the iOS Development Team, the function could promote them to "Senior iOS Developer" and if the member is in the UI/UX Design Team, the function could promote them to "Lead Designer".

func promoteMember(member: inout neonAcademyMember){
    switch member.team{
    case .iOSDevelopmentTeam :
        member.title = "Senior iOS Developer"
    case .AndroidDevelopmentTeam :
        member.title = "Senior Android Developer"
    case .UIUXDesignTeam:
        member.title = "Lead Designer"
    }
}

promoteMember(member: &memberCenker)
print(memberCenker.title)

print("\n")
print("-----------------")

//7- Create a function that takes a team as an input and calculates the average age of the members in that team.

func averageAge(team: MembersTeams) -> Double{
    let teamMembers = membersOfNeonApps.filter { $0.team == team }
    var totalAge = teamMembers.reduce(0) { $0 + $1.age }
    
    return Double(totalAge/teamMembers.count)
}

print("Average age for iOS Team: \(averageAge(team: .iOSDevelopmentTeam))")

print("\n")
print("-----------------")

//8- Create a switch statement that prints out a different message for each team, such as "The iOS Development Team is the backbone of our academy" for the iOS Development Team and "The UI/UX Design Team is the face of our academy" for the UI/UX Design Team.


for member in membersOfNeonApps {
    
    switch member.team {
    case .iOSDevelopmentTeam:
        print("The iOS Development Team is the backbone of our academy")
    case .UIUXDesignTeam:
        print("The UI/UX Design Team is the face of our academy")
    case .AndroidDevelopmentTeam:
        print("Backbone too")
    }
    
}

print("\n")
print("-----------------")

//9- Create a function that takes a team as an input and returns an array of the contact information of all members in that team.

func getContactOfTeam(getTeam: MembersTeams) -> [ContactInformation]{
    let teamMember = membersOfNeonApps.filter { $0.team == getTeam }
    let newArray = teamMember.map { $0.contactInformation }
    return newArray
}

print("Contacts \(getContactOfTeam(getTeam: .iOSDevelopmentTeam))")

print("\n")
print("-----------------")

//10- Create a switch statement that performs different actions based on the team of a member and their age. For example, if a member is in the iOS Development Team and is over 23 years old, the function could print out "XXX member is a seasoned iOS developer", and if the member is in the UI/UX Design Team and is under 24, the function could print out "XXX member is a rising star in the design world".

func teamAndAge(team: neonAcademyMember, age: Int){
    switch team.team {
    case .iOSDevelopmentTeam:
        if team.age > age {
            print("\(team.fullName) member is a seasoned iOS Developer")
        }
    case .AndroidDevelopmentTeam:
            print("\(team.fullName) member is a seasoned Android Developer")

    case .UIUXDesignTeam:
            print("\(team.fullName) member is a seasoned iOS Developer")
                  }
}
teamAndAge(team: memberCenker, age: 20)
