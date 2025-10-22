# 🏨 MyHotels – SwiftUI App

A modern **hotel discovery and booking** experience built using **SwiftUI**, following **Clean Architecture** principles with **MVVM** pattern and **Dependency Injection (DI)** for scalability and testability.  

---

## 🚀 Features  

- ✅ Explore **top-rated hotels** and **nearby places** with structured, reactive UI.  
- ✅ Built with **Clean Architecture + MVVM** separation for easy maintainability.  
- ✅ **Dependency Injection (DI)** for flexible, decoupled dependencies.  
- ✅ Powered by a **custom NetworkClient** supporting REST APIs with testability.  
- ✅ Modular and composable SwiftUI design system.  
- ✅ Simplified example for real-world app structure (networking, DI, domain use cases).  

---

## 🧱 Architecture Overview  

### ✅ Clean Architecture  

The app is designed around **three main layers**, ensuring a clear separation of responsibilities and dependency flow.

```
Presentation  →  Domain  →  Data  →  Core
```

---

### 📱 Presentation Layer  

Handles UI, user interactions, and view state.

- **HomeView.swift**:  
  Displays sections for top hotels and nearby attractions.  
- **HotelsViewModel.swift**:  
  Uses `@Published` properties to track loading, success, or failure states.  
  Injects use cases using the `@Inject` property wrapper.

```swift
@MainActor
final class HotelsViewModel: ObservableObject {
    @Published private(set) var state: LoadState<[Hotel]> = .idle
    @Inject private var getTopHotels: GetTopHotelsUseCase

    func load() {
        state = .loading
        Task {
            do { state = .loaded(try await getTopHotels.execute()) }
            catch { state = .failed(error) }
        }
    }
}
```

---

### 🧠 Domain Layer  

Contains the **business logic** of the application.

#### Use Cases:
- `GetTopHotelsUseCase` – Fetches top-rated hotels.  
- `GetNearbyPlacesUseCase` – Retrieves nearby places of interest.  

Each use case depends on an abstracted repository interface, ensuring no coupling to specific implementations.

```swift
struct GetTopHotelsUseCase {
    private let repo: HotelRepository
    init(repo: HotelRepository) { self.repo = repo }
    func execute() async throws -> [Hotel] { try await repo.topHotels() }
}
```

---

### 🌐 Data Layer  

Responsible for fetching and providing data from remote APIs.

#### Components:
- `HotelRepository` / `PlacesRepository`: Protocols defining contract methods.  
- `RemoteHotelRepository` / `RemotePlacesRepository`: Concrete implementations using `NetworkClient`.  

Example:
```swift
final class RemoteHotelRepository: HotelRepository {
    @Inject private var client: TraditionalNetworkProtocol
    func topHotels() async throws -> [Hotel] {
        try await client.request(endpoint: .topHotels)
    }
}
```

---

### ⚙️ Core Layer  

Contains reusable infrastructure and frameworks:

- **DependencyContainer** – Custom-built lightweight DI container.  
- **NetworkClient** – Centralized networking abstraction with testable protocol design.  

---

## 💉 Dependency Injection Setup  

All dependencies are registered once during app startup via `Dependency.setup()`.

```swift
import DependencyContainer
import NetworkClient

struct Dependency {
    static func setup() {
        DIContainer.shared.register(TraditionalNetworkProtocol.self, lifetime: .singleton) {
            TraditionalNetwork(config: .default())
        }
        DIContainer.shared.register(HotelRepository.self) {
            RemoteHotelRepository()
        }
        DIContainer.shared.register(GetTopHotelsUseCase.self) {
            GetTopHotelsUseCase()
        }
        DIContainer.shared.register(PlacesRepository.self) {
            RemotePlacesRepository()
        }
        DIContainer.shared.register(GetNearbyPlacesUseCase.self) {
            GetNearbyPlacesUseCase()
        }
    }
}
```

### App Entry Point:

```swift
@main
struct MyHotelsApp: App {
    init() {
        Dependency.setup()
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
```

---

## 🧰 Technologies Used  

| Layer | Technology |
|-------|-------------|
| UI | SwiftUI |
| Architecture | Clean Architecture + MVVM |
| Networking | NetworkClient (custom abstraction over URLSession) |
| Dependency Injection | DIContainer |
| Async Programming | Swift Concurrency (async/await) |
| Design | Programmatic SwiftUI Components |

---

## 🧪 Advantages  

| Benefit | Description |
|----------|-------------|
| 🔄 **Loose Coupling** | Repositories and services communicate via protocols, not concrete types. |
| 🧩 **Scalability** | Easily extend with new modules, APIs, or features. |
| 🧪 **Testability** | Use cases and repositories can be unit-tested via mock injection. |
| 🚀 **Performance** | Async/await + SwiftUI ensures smooth, modern UI rendering. |
| 💡 **Clarity** | Clean boundaries between layers reduce cognitive load for developers. |

---

## 🧾 Example Flow  

1️⃣ **App Starts** → `Dependency.setup()` registers all dependencies.  
2️⃣ **HomeView Appears** → `HotelsViewModel.load()` triggers `GetTopHotelsUseCase`.  
3️⃣ **Use Case Executes** → Fetches from `HotelRepository`.  
4️⃣ **Repository Calls API** via `TraditionalNetwork`.  
5️⃣ **Results Published** → UI updates reactively with hotel list.  

---

## 🔗 Future Enhancements  

- 🏕 Add local caching (CoreData or SQLite).  
- 🗺️ Integrate real APIs for hotel data and places.  
- 🌙 Add dark mode theming.  
- 🧭 Include advanced filtering and search.  
- 📱 Support iPadOS layout and widgets.  

---

## 🧑‍💻 Author  

**Ch. Radhachandan**  
iOS Architect | SwiftUI | Flutter | Clean Architecture Enthusiast  
📍 Hyderabad, India.
