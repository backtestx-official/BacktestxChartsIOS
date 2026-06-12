import UIKit
import WebKit

public class BacktestxChartView: UIView {
    public private(set) var webView: WKWebView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupWebView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWebView()
    }
    
    private func setupWebView() {
        let configuration = WKWebViewConfiguration()
        configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        
        webView = WKWebView(frame: self.bounds, configuration: configuration)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(webView)
        
        loadChartHTML()
    }
    
    private func loadChartHTML() {
        // Find the bundle containing our resources
        let bundle: Bundle
        #if SWIFT_PACKAGE
        bundle = Bundle.module
        #else
        bundle = Bundle(for: BacktestxChartView.self)
        #endif
        
        // Search for index.html in the bundle
        if let htmlPath = bundle.path(forResource: "index", ofType: "html", inDirectory: "Resources") {
            let fileURL = URL(fileURLWithPath: htmlPath)
            webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
        } else if let htmlPath = bundle.path(forResource: "index", ofType: "html") {
            // Fallback for CocoaPods if resources are flattened
            let fileURL = URL(fileURLWithPath: htmlPath)
            webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
        } else {
            print("⚠️ [BacktestxChartView] Error: index.html not found in bundle resources.")
        }
    }
    
    /// Update chart bars with a JSON string of candle data
    /// - Parameter jsonData: JSON string representing an array of bar objects
    public func updateData(jsonData: String) {
        let jsCode = "if (window.chart) { window.chart.bars = \(jsonData); window.chart.render(); }"
        webView.evaluateJavaScript(jsCode, completionHandler: nil)
    }
    
    /// Change the symbol and resolution of the chart
    /// - Parameters:
    ///   - symbol: The new asset symbol (e.g. "BTCUSD")
    ///   - resolution: The interval resolution (e.g. "1D", "30m")
    public func changeSymbol(_ symbol: String, resolution: String) {
        let jsCode = "if (window.chart) { window.chart.symbol = '\(symbol)'; window.chart.resolution = '\(resolution)'; window.chart.loadData(); }"
        webView.evaluateJavaScript(jsCode, completionHandler: nil)
    }
}
