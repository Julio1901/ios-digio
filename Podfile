workspace 'Digio.xcworkspace'

target 'Digio' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Digio
  pod 'SwiftLint'

  target 'SpotlightsModule' do
    project 'SpotlightsModule/SpotlightsModule.xcodeproj'
  end

  target 'DigioCashModule' do
    project 'DigioCashModule/DigioCashModule.xcodeproj'
  end

  target 'ProductsModule' do
    project 'ProductsModule/ProductsModule.xcodeproj'
  end

  target 'DigioTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DigioUITests' do
    # Pods for testing
  end
end
