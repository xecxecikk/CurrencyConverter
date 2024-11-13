
Certainly! Here’s the README content in English:

CurrencyConverter Application

This Swift application displays current exchange rates for different currencies to the user. It retrieves exchange rates from an API and presents them through labels on the interface.

Features

Labels
cadLabel: Shows the exchange rate for the Canadian Dollar (CAD).
chfLabel: Shows the exchange rate for the Swiss Franc (CHF).
gbpLabel: Shows the exchange rate for the British Pound (GBP).
jpyLabel: Shows the exchange rate for the Japanese Yen (JPY).
usdLabel: Shows the exchange rate for the US Dollar (USD).
tryLabel: Shows the exchange rate for the Turkish Lira (TRY).
Application Flow
View Did Load: Basic setup and label configuration are performed when the application is launched.
Fetching Exchange Rates: Pressing the "Get Rates" button initiates the process to retrieve exchange rates from the API.
API Usage

1. Request & Session
A URL is created, and a session is initiated to connect to the API.

let url = URL(string: "http://data.fixer.io/api/latest?access_key=ac3cf451e543de55a8dd77f41845a3d9")
let session = URLSession.shared
2. Response & Data
Data received from the API is processed with error handling.

let task = session.dataTask(with: url!) { data, response, error in
    // Error handling and data processing
}
3. Parsing & JSON Serialization
The JSON data is parsed, and the exchange rates are assigned to the appropriate labels.

do {
    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
    DispatchQueue.main.async {
        if let rates = jsonResponse["rates"] as? [String: Any] {
            self.cadLabel.text = "CAD: \(rates["CAD"] ?? 0)"
            // Set other exchange rates
        }
    }
} catch {
    print("JSON Parsing Error")
}
Updating Exchange Rates
The exchange rates retrieved from the API are parsed from the JSON data and assigned to the relevant labels.

DispatchQueue.main.async {
    if let cad = rates["CAD"] as? Double { self.cadLabel.text = "CAD : \(cad)" }
    // Update other exchange rates
}
Error Handling

In case of an error, an alert is displayed to inform the user.

let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
alert.addAction(okButton)
self.present(alert, animated: true, completion: nil)
Usage

After launching the application, press the "Get Rates" button to see the exchange rates.
The latest exchange rates retrieved from the API will be displayed in the respective labels.
This README layout provides a clear, professional structure that helps users quickly understand the application’s functionality and workflow.
