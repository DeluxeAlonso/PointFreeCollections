//
//  Models.swift
//  Standups
//
//  Created by Alonso on 16/10/24.
//

import SwiftUI
import Tagged

struct Standup: Equatable, Identifiable, Codable {
    let id: Tagged<Self, UUID>
    var attendees: [Attendee] = []
    var duration = Duration.seconds(60 * 5)
    var meetings: [Meeting] = []
    var theme: Theme = .bubblegum
    var title = ""

    var durationPerAttendee: Duration {
        self.duration / self.attendees.count
    }
}

struct Attendee: Equatable, Identifiable, Codable {
    let id: Tagged<Self, UUID>
    var name: String
}

struct Meeting: Equatable, Identifiable, Codable {
    let id: Tagged<Self, UUID>
    let date: Date
    var transcript: String
}

enum Theme:
    String,
    CaseIterable,
    Equatable,
    Hashable,
    Identifiable,
    Codable
{
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow

    var id: Self { self }

    var accentColor: Color {
        switch self {
        case
                .bubblegum,
                .buttercup,
                .lavender,
                .orange,
                .periwinkle,
                .poppy,
                .seafoam,
                .sky,
                .tan,
                .teal,
                .yellow:

            return .black
        case .indigo, .magenta, .navy, .oxblood, .purple:
            return .white
        }
    }

    var mainColor: Color { Color(self.rawValue) }

    var name: String { self.rawValue.capitalized }
}

extension Standup {
    static let mock = Self(
        id: Standup.ID(UUID()),
        attendees: [
            Attendee(id: Attendee.ID(UUID()), name: "Blob"),
            Attendee(id: Attendee.ID(UUID()), name: "Blob Jr"),
            Attendee(id: Attendee.ID(UUID()), name: "Blob Sr"),
            Attendee(id: Attendee.ID(UUID()), name: "Blob Esq"),
            Attendee(id: Attendee.ID(UUID()), name: "Blob III"),
            Attendee(id: Attendee.ID(UUID()), name: "Blob I"),
        ],
        duration: .seconds(60),
        meetings: [
            Meeting(
                id: Meeting.ID(UUID()),
                date: Date().addingTimeInterval(-60 * 60 * 24 * 7),
                transcript: """
            Lorem ipsum dolor sit amet, consectetur \
            adipiscing elit, sed do eiusmod tempor \
            incididunt ut labore et dolore magna aliqua. \
            Ut enim ad minim veniam, quis nostrud \
            exercitation ullamco laboris nisi ut aliquip \
            ex ea commodo consequat. Duis aute irure \
            dolor in reprehenderit in voluptate velit \
            esse cillum dolore eu fugiat nulla pariatur. \
            Excepteur sint occaecat cupidatat non \
            proident, sunt in culpa qui officia deserunt \
            mollit anim id est laborum.
            """
            )
        ],
        theme: .orange,
        title: "Design"
    )
}
