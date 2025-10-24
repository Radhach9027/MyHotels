import SwiftUI

enum StayType: String, CaseIterable, Identifiable {
    case hourly = "Hourly"
    case night  = "Night"
    var id: String { rawValue }
}

struct StaySearchParams {
    var type: StayType
    var hours: Int?
    var checkIn: Date?
    var checkOut: Date?
}

struct StayTypeSelectionView: View {
    var onSearch: (StaySearchParams) -> Void = { _ in }
    @State private var type: StayType = .hourly
    @State private var selectedHours: Int = 3
    @State private var startTime = Date()
    @State private var checkIn  = Calendar.current.startOfDay(for: Date())
    @State private var checkOut = Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: Date()))!
    private let hourOptions = [3, 6, 9]
    var body: some View {
        VStack(spacing: 8) {
            headerCard
            if type == .hourly { hourlyCard } else { nightCard }
            searchButton
        }
    }

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Picker("", selection: $type) {
                ForEach(StayType.allCases) { Text($0.rawValue).tag($0) }
            }
            .pickerStyle(.segmented)

            Group {
                if type == .hourly {
                    Text("BOOK FOR 3, 6 OR 9 HOURS!").font(.headline).fontWeight(.semibold)
                    Text("Flexible slots, great savings").font(.subheadline).foregroundStyle(.secondary)
                } else {
                    Text("BOOK FOR 1 OR MORE NIGHTS").font(.headline).fontWeight(.semibold)
                    Text("Select your stay dates").font(.subheadline).foregroundStyle(.secondary)
                }
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.blue.opacity(0.1)))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.blue.opacity(0.25), lineWidth: 0.6))
    }

    private var hourlyCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            fieldCard {
                VStack(alignment: .leading, spacing: 6) {
                    Text("City, Area or Property Name").font(.caption).foregroundStyle(.secondary)
                    Text("Where to?").font(.headline)
                }
            }

            fieldCard {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Duration").font(.subheadline).foregroundStyle(.secondary)
                    HStack(spacing: 10) {
                        ForEach(hourOptions, id: \.self) { h in
                            Chip(title: "\(h) Hours", selected: selectedHours == h) { selectedHours = h }
                        }
                    }
                }
            }

            fieldCard {
                VStack(alignment: .leading, spacing: 8) {
                    DatePicker("Start Time", selection: $startTime, displayedComponents: [.date, .hourAndMinute])
                    let end = Calendar.current.date(byAdding: .hour, value: selectedHours, to: startTime) ?? startTime
                    HStack {
                        Text("Ends").foregroundStyle(.secondary)
                        Spacer()
                        Text(end.formatted(date: .abbreviated, time: .shortened))
                            .font(.subheadline.weight(.semibold))
                    }
                }
            }
        }
    }

    private var nightCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            fieldCard {
                VStack(alignment: .leading, spacing: 6) {
                    Text("City, Area or Property Name").font(.caption).foregroundStyle(.secondary)
                    Text("Where to?").font(.headline)
                }
            }

            HStack(spacing: 12) {
                fieldCard {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Check-in").font(.caption).foregroundStyle(.secondary)
                        DatePicker("", selection: $checkIn, in: Date()..., displayedComponents: .date)
                            .labelsHidden()
                    }
                }
                fieldCard {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Check-out").font(.caption).foregroundStyle(.secondary)
                        DatePicker("", selection: $checkOut, in: minCheckoutDate..., displayedComponents: .date)
                            .labelsHidden()
                    }
                }
            }

            if checkOut <= checkIn {
                Text("Checkout must be after check-in.")
                    .font(.footnote).foregroundStyle(.red)
            }
        }
        .onChange(of: checkIn) { _ in if checkOut <= checkIn { checkOut = minCheckoutDate } }
    }

    private var searchButton: some View {
        Button {
            switch type {
            case .hourly:
                onSearch(.init(type: .hourly, hours: selectedHours, checkIn: nil, checkOut: nil))
            case .night:
                onSearch(.init(type: .night, hours: nil, checkIn: checkIn, checkOut: checkOut))
            }
        } label: {
            Text("Search")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
        }
        .buttonStyle(.borderedProminent)
        .tint(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }

    private var minCheckoutDate: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: checkIn))!
    }

    private func fieldCard<Content: View>(@ViewBuilder _ content: () -> Content) -> some View {
        content()
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color(.systemBackground)))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.gray.opacity(0.15)))
            .shadow(color: .black.opacity(0.03), radius: 6, x: 0, y: 3)
    }
}

private struct Chip: View {
    let title: String
    let selected: Bool
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline.weight(.semibold))
                .padding(.vertical, 8)
                .padding(.horizontal, 14)
                .background(Capsule().fill(selected ? Color.blue.opacity(0.15) : Color.gray.opacity(0.1)))
                .overlay(Capsule().stroke(selected ? Color.blue : Color.gray.opacity(0.25), lineWidth: 1))
        }
        .buttonStyle(.plain)
        .animation(.easeInOut(duration: 0.15), value: selected)
    }
}
