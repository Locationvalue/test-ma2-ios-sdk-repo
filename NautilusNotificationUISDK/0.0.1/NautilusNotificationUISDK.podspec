Pod::Spec.new do |spec|
  spec.name         = "NautilusNotificationUISDK"
  spec.version      = "0.0.1"
  spec.summary      = "ModuleApps 2.0 Notification UI SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Notification UI SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/NotificationUI/Sources/*.{h,m}", "Nautilus-ios-sdk/NotificationUI/Sources/**/*.swift", "Nautilus-ios-sdk/NotificationUI/Sources/**/*.{h,m}"
    spec.exclude_files = "Nautilus-ios-sdk/NotificationUI/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/NotificationUI/Resources/moduleapps-notification-ui.json", "Nautilus-ios-sdk/NotificationUI/Sources/**/*.storyboard", "Nautilus-ios-sdk/NotificationUI/Sources/**/*.xib", "Nautilus-ios-sdk/NotificationUI/Resources/Assets.xcassets"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusNotificationUISDK.xcframework'
  end

  spec.frameworks = 'Foundation'
  spec.dependency "NautilusCoreSDK", "#{spec.version}"
  spec.dependency "NautilusContainerSDK", "#{spec.version}"
  spec.dependency "NautilusConfigSDK", "#{spec.version}"
  spec.dependency "NautilusIdentifySDK", "#{spec.version}"
  spec.dependency "NautilusAnalyticsSDK", "#{spec.version}"
  spec.dependency "NautilusNotificationSDK", "#{spec.version}"
  spec.dependency "NautilusImagingSDK", "#{spec.version}"
  spec.dependency "NautilusUISDK", "#{spec.version}"
  spec.dependency "NautilusLoggingSDK", "#{spec.version}"

  spec.swift_version = '5.0'
end
