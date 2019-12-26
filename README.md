# MVVMWithWebServices
Introducing MVVM
One issue facing iOS developers is how to deal with major iOS updates for existing projects. More specifically, how to implement UI/UX changes as iOS evolves. Because iOS uses a combined view-controller design, this task can require a greater level of effort than should be necessary. Here's why: because the view and controller are coupled, an iOS view-controller class will usually contain both UI logic and business logic. This means that changes in the way the view is presented (UI logic) will usually also require changes to business logic within the same view controller class.

Further, as view controller classes implement increasingly complex UI requirements, the amount of business-logic code also tends to grow within the same view controller class. This, is turn, typically results in large, unwieldy, and difficult-to-read view controller classes.

Wouldn't it be better to have thin, flexible, easy-to-read view controller classes in iOS?

The MVVM Design Pattern

The "Model-View ViewModel" design pattern, or "MVVM", is similar to the MVC as implemented in iOS, but provides better decoupling of the UI and business logic. This decoupling results in thin, flexible, and easy-to-read view controller classes in iOS.

MVVM also provides better encapsulation. Business logic and workflows are contained almost exclusively in the viewModel (referred to as the view manager in the example project). The view/view controllers concern themselves only with the UI and know little, if anything, about the business logic and work flow in the viewModel.

MVVM is built around three fundamental parts: data model, view/view-controller, and viewModel:
1) Data Model

Just like in the MVC design pattern, the MVVM data model is a class that declares properties for managing business data. For instance, a banking app would need to manage user account data like account balances, transaction history, etc. These data objects are declared in the model as class properties with appropriate getters and setters.

2) ViewModel

The viewModel is at the heart of the MVVM design pattern and provides the connection between the business logic and the view/view controller. The view (UI) responds to user input by passing input data (defined by the model) to the viewModel. In turn, the viewModel evaluates the input data and responds with an appropriate UI presentation according business logic workflow.

The viewModel then is the hub of activity in the MVVM design, acting as an intelligent traffic control center for the model, business logic, workflow, and view/view-controller.

3) View/View Controller

The view/view controller is the context (i.e. the view controller class) that presents user interface elements. As mentioned above, in iOS the view/view controller is usually coupled to business logic within a view controller class.

Conversely, in MVVM, the view/view controller contains little or no business logic and is primarily responding to the viewModel to configure and present UI elements (e.g. table views, buttons, etc.)

View Models + Networking = ?
While researching the MVVM implementations in iOS, I came across a lot of resources where the developer implemented the networking code and data access code right inside the view model.

Example

Let's take a look at what this might look like in an Xcode project. Below you will find a link to the MVVM_Example Xcode project. In our example project, there are three main classes that correlate to the MVVM design pattern.

Conclusion
This is just a very introductory look at the MVVM model. I believe that the MVVM approach in iOS can greatly improve if Swift allows the capability of making custom attributes.
This will allow us to create dynamic validation frameworks where each view model can easily validate and return broken rules associated with the view.
As Michael Long pointed out in the comments, MVVM makes it easy to test the logic behind the views.
Another benefit of moving your ViewController’s business logic into your ViewModel is that the viewModel then becomes a lot easier to create unit tests for those components of your application.
