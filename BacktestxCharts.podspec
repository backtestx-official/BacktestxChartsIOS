Pod::Spec.new do |spec|
  spec.name         = "BacktestxCharts"
  spec.version      = "1.0.0"
  spec.summary      = "BacktestX custom lightweight charting engine iOS wrapper."
  spec.description  = "A native Swift wrapper for using the custom BacktestX charting engine in iOS applications."
  spec.homepage     = "https://github.com/backtestx/BacktestxChartsIOS"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "BacktestX" => "support@backtestx.com" }
  spec.source       = { :git => "https://github.com/backtestx/BacktestxChartsIOS.git", :tag => "#{spec.version}" }
  
  spec.ios.deployment_target = "11.0"
  spec.swift_version = "5.0"
  
  spec.source_files  = "Sources/BacktestxCharts/**/*.swift"
  spec.resources     = "Sources/BacktestxCharts/Resources/**/*"
end
