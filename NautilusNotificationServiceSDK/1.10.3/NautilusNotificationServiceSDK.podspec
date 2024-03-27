Pod::Spec.new do |spec|
  spec.name         = "NautilusNotificationServiceSDK"
  spec.version      = "1.10.3"
  spec.summary      = "ModuleApps 2.0 Notification Service SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Notification Service SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/Notification/Sources/Base/NautilusNotificationHandler.swift"

    spec.xcconfig = {
      'OTHER_SWIFT_FLAGS' => '$(inherited) -D PUSH_SERVICE_EXTENSION'
    }
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusNotificationServiceSDK.xcframework'
  end

  spec.frameworks = 'UIKit', 'UserNotifications'

  spec.swift_version = '5.0'

end
