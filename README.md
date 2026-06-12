# iOS BacktestxCharts

**BacktestxChartsIOS** is a native Swift wrapper for the custom **BacktestX Lightweight Charting Engine** (built on optimized Canvas rendering). It allows you to display and control high-performance interactive charts in your iOS applications using clean, native Swift APIs.

---

## Features

- **Native Wrapper:** Exposes a native `BacktestxChartView` subclass of `UIView`.
- **Zero Web Configuration:** Automatically manages the local web view, file paths, and bundle resources.
- **Custom Drawing Toolbar:** Native touch-screen interaction for trend lines, Fibonacci, Buy/Sell markers, and zone highlighters.
- **Built-in Indicators:** Direct APIs to toggle indicators like SMA, EMA, MACD, RSI, and Bollinger Bands.
- **Custom Horizontal Scales:** Support for Yield Curves, Option Strikes, and standard time-series.
- **Custom Candle Types:** Render hollow candles, bars, line charts, or Heikin-Ashi candles.

---

## Requirements

- **iOS 11.0+**
- **Xcode 13+**
- **Swift 5.0+**

---

## Installation

### Swift Package Manager (SPM)
Add the package to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/backtestx-official/BacktestxChartsIOS.git", from: "1.0.0")
]
```

Or in Xcode:
1. Go to **File > Add Package Dependencies...**
2. Paste the repository URL: `https://github.com/backtestx-official/BacktestxChartsIOS.git`
3. Select the version and target.

### CocoaPods
Integrate the library into your Xcode project by specifying it in your `Podfile`:

```ruby
pod 'BacktestxCharts', :git => 'https://github.com/backtestx-official/BacktestxChartsIOS.git', :tag => '1.0.0'
```

---

## Usage

### 1. Initialize the Chart View
Import the module, create an instance of `BacktestxChartView`, and add it to your view layout:

```swift
import UIKit
import BacktestxCharts

class ChartViewController: UIViewController {
    var chartView: BacktestxChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the view
        chartView = BacktestxChartView(frame: self.view.bounds)
        chartView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(chartView)
    }
}
```

### 2. Loading and Updating Data
Provide bar/candle data formatted as a JSON string. The wrapper handles rendering automatically:

```swift
let jsonData = """
[
  {"time": "2018-10-19", "open": 180.34, "high": 180.99, "low": 178.57, "close": 179.85},
  {"time": "2018-10-22", "open": 180.82, "high": 181.40, "low": 177.56, "close": 178.75},
  {"time": "2018-10-23", "open": 175.77, "high": 179.49, "low": 175.44, "close": 178.53}
]
"""

chartView.updateData(jsonData: jsonData)
```

### 3. Switch Symbols & Resolutions
Switch symbols or timeframes dynamically from native UI actions:

```swift
// Change symbol to BTCUSD on a 30-minute interval
chartView.changeSymbol("BTCUSD", resolution: "30m")
```

---

## Custom API & Floating Toolbar Actions

### Accessing indicators programmatically
You can evaluate custom JavaScript actions directly on the raw web view if you need to build advanced controls:

```swift
// Add an EMA Indicator programmatically from Swift
chartView.webView.evaluateJavaScript("window.chart.addIndicator('ema', { period: 20 })", completionHandler: nil)

// Set chart rendering style to Hollow Candles
chartView.webView.evaluateJavaScript("window.chart.setChartType('hollow')", completionHandler: nil)
```

---

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.
