# Currency Converter App

This app uses the Fixer API to retrieve and display the latest currency exchange rates to the user.

## Technologies Used
- Swift
- URLSession
- JSONSerialization

## How to Use?

After launching the application, press the "Get Rates" button to view the latest exchange rates. The most recent rates are fetched from the API and displayed in the respective labels.

---

### Code Explanation

#### 1. API URL Setup and Data Task

The API endpoint is defined, and data is fetched asynchronously using `URLSession`:

```swift
let url = URL(string: "http://data.fixer.io/api/latest?access_key=ac3cf451e543de55a8dd77f41845a3d9")
let session = URLSession.shared


