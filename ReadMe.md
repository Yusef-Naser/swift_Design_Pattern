# There are three main types of design patterns:
1. Structural design pattern: Describes how objects are composed and combined to form larger structures. Examples of structural design patterns include Model-View-Controller (MVC), Model-View-ViewModel (MVVM) and Facade.
2. Behavioral design pattern: Describes how objects communicate with each other. Examples of behavioral design patterns are Delegation, Strategy and Observer.
3. Creational design pattern: Describes how to create or instantiate objects. Examples of creational patterns are Builder, Singleton and Prototype.

# How to Read a Class Diagram

## To indicate that one class inherits from another, use an open arrowhead:
<img src="assets/inheritance.tiff" width="50%" />

But instead of reading this as “inherits from,” read this as “is a”. For example, to show
that SheepDog inherits from Dog, you’d draw the following diagram:

<img src="assets/inheritance2.tiff" width="50%" />

You would read this, from bottom to top, as “SheepDog is a Dog.”

## Use a plain arrowhead to indicate a property, which is known as an association in UML terms:

<img src="assets/property.tiff" width="50%" />

- Class diagrams can be written from bottom to top, from left to right, or in any other
orientation you’d like. Regardless of the orientation you choose, the direction of the
arrows define the meaning: Inheritance arrows always point at the superclass, and
property arrows always point at the property class.

- You should read a property arrow as “has a.” For example, if a Farmer has a Dog, you’d draw this:

<img src="assets/property2.tiff" width="50%" />

- You can indicate one-to-many relationships by specifying a range next to the arrowhead. For example, you can denote a Farmer has one or more Dogs like this:
<img src="assets/property3.tiff" width="50%" />

- You should always use the singular form of the class name in class diagrams, even if you’re conveying a one-to-many relationship. In this case, you should write Dog, not Dogs.
- You can use as many arrows and boxes as you need in a single class diagram. For example, here’s how you’d denote a Farmer has a SheepDog that’s a Dog:

<img src="assets/shape1.tiff" width="50%" />

## You also use a box to indicate a protocol. In order to distinguish it from a class, however, you need to write <<protocol>> before its name.

<img src="assets/protocol.tiff" width="50%" />

- Use an open arrowhead with a dashed line to indicate a class implements a protocol:

<img src="assets/protocol1.tiff" width="50%" />

- You may either read this as “implements” or “conforms to.” For example, you’d indicate Farmer conforms to PetOwning like this: Use :

<img src="assets/protocol3.tiff" width="50%" />

## Use a plain arrowhead with a dashed line to indicate “uses,” which is called a “dependency” in UML terms:
<img src="assets/dependcy.tiff" width="50%" />

UML is intentionally vague about what a “dependency” is. Consequently, whenever you
use a dependency arrow, you usually should annotate its purpose. For example, you can
use a dependency arrow to indicate the following things:
• A weak property or delegate.
• An object that’s passed into a method as a parameter, but not held as a property.
• A loose coupling or callback, such as an IBAction from a view to a controller.
Here’s how you’d indicate that Dog delegates to a PetOwning object:

<img src="assets/shape2.tiff" width="50%" />

<img src="assets/shape3.tiff" width="50%" />
