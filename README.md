# CurrencyConverter Application

This Swift code creates an iOS application that displays real-time exchange rates for various currencies using an API. The app fetches exchange rates and displays them on the user interface through labels for each currency. It also includes a flashing color effect for updated values to indicate recent changes in rates.

## Tools and Technologies Used

-  `Swift`: Programming language used for developing the application.
- `UIKit`: Framework used to build the user interface components.
- `URLSession`: Used for making network requests to fetch real-time exchange rates.
- `JSONSerialization`: Utilized for parsing JSON data from the API.
- `GitHub`: For version control and code hosting.


## Features
### Labels
- `cadLabel`: Shows the exchange rate for the Canadian Dollar (CAD).
- `chfLabel`: Shows the exchange rate for the Swiss Franc (CHF).
- `gbpLabel`: Shows the exchange rate for the British Pound (GBP).
- `jpyLabel`: Shows the exchange rate for the Japanese Yen (JPY).
- `usdLabel`: Shows the exchange rate for the US Dollar (USD).
- `tryLabel`: Shows the exchange rate for the Turkish Lira (TRY).

### ViewDidLoad
Initializes basic settings when the app starts.

### Fetching Exchange Rates

- **getRatesClicked**: Triggered when the user clicks a button, this function initiates the process of fetching currency rates from an API.

## API Usage

### 1- Request & Session:
Sets up a URL and initiates a session to make an API request to fetch exchange rates.
```swift
let url = URL(string: "https://data.fixer.io/api/latest?access_key=YOUR_ACCESS_KEY")
let session = URLSession.shared
```

### 2- Response & Data:
Handles the data received from the API and checks for errors. If an error occurs, it displays an alert.
```swift
let task = session.dataTask(with: url!) { (data, response, error) in
    if error != nil {
        // Handle error with an alert
    } else {
        // Process the data
    }
}
```
### 3-Parsing & JSON Serialization:
Parses JSON data from the API response to extract and display the rates for each currency.
```swift
if let rates = jsonResponse["rates"] as? [String : Any] {
    if let cad = rates["CAD"] as? Double {
        self.updateLabel(self.cadLabel, withText: "CAD: \(cad)")
    }
    // Similar code for other currencies
}
```
### 4-Updating Label & Flashing Color:
When a currency rate is updated, the corresponding label text changes and a flashing effect is applied to indicate the update.
```swift
private func updateLabel(_ label: UILabel, withText newText: String) {
    if label.text != newText {
        label.text = newText
        startFlashingColor(label: label)
    }
}
```
- **The startFlashingColor function alternates the label’s color between red and black a set number of times, then holds the final color as red.**
```swift
private func startFlashingColor(label: UILabel) {
    var flashCount = 0
    _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
        flashCount += 1
        label.textColor = (label.textColor == .red) ? .black : .red
        if flashCount >= 10 {
            timer.invalidate()
            label.textColor = .red
        }
    }
}
```

### 5-Usage

- To view the latest exchange rates, start the application and click the "Get Rates" button.

- The current exchange rates fetched from the API will be displayed in the respective labels.





















https://github.com/user-attachments/assets/93d9079a-f2ce-4597-b106-53f2576920fc










