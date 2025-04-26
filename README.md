# NavigationController

Everyone who tried to use SwiftUI’s `NavigationView` in a big production level app faced a problem navigating using a standard `NavigationView`. Of course the `NavigationStack` fixes the problem, but what if you can’t use `NavigationStack` because it is not available pre iOS 16?

With `NavigationView` you have to have a `NavigationLink` in your current `View` to navigate to a next `View`. So you have to put a `NavigationLink` with specific `View` in order to navigate there. When using a `ViewModel` you can’t just call `push(NextView())` to show the `NextView`. You have to activate the `NavigationLink` which has to be in your current `View` in order to show the `NextView`. It is ok if you have a simple app which has exact hierarchy of views, but if you have a complicated dynamic routes such approach becomes painful.

It would be better to have a solution when you can just say which view you want to navigate to without putting all possible `NavigationLink`s into current view. In this case my solution comes in handy.

You just write:

```swift
controller.push(ProfileView())
```

And `NavigationView` pushes the `ProfileView` on to the stack. All you need is to add case profile to `enum Screen` and add `ProfileView()` into `ScreenView`. This way `NavigationCoordinator` will be able to push `ProfileView` onto the navigation stack without any more efforts.

The basic example is:

```swift
import SwiftUI

@main
struct NavigationApp: App {
    @StateObject var controller = NavigationController(root: HomeView())
    
    var body: some Scene {
        WindowGroup {
            controller.view
        }
    }
}
```

This is how `HomeView` looks like:

```swift
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var controller: NavigationController

    var body: some View {
        VStack(spacing: 20) {
            Text("Home View").font(.largeTitle)
            Button("Go to Profile") {
                controller.push(ProfileView())
            }
            Button("Go to Settings") {
                controller.push(SettingsView())
            }
        }
        .navigationTitle("Home")
    }
}
```

**That’s it!** You can now build a complicated hierarchy of navigation in your app. And it is compatible with MVVM approach.

![NavigationController](https://github.com/user-attachments/assets/9fe3ce38-7aa2-4204-9ff5-8afa6c3ea923)

## Warning

This solution relies on `AnyView` which is dangerous. Apple Engineers don’t recommend to use `AnyView` because it has performance issues and may have other unexpected issues. Use `NavigationController` variant cautious.

More reliable variant is available at https://github.com/0xMarK/NavigationCoordinator
