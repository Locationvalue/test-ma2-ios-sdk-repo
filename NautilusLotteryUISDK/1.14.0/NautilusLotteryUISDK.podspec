Pod::Spec.new do |spec|
  spec.name         = "NautilusLotteryUISDK"
  spec.version      = "1.14.0"
  spec.summary      = "ModuleApps 2.0 Lottery UI Component SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Lottery UI Component SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/LotteryUI/Sources/*.{h,m}", "Nautilus-ios-sdk/LotteryUI/Sources/**/*.swift", "Nautilus-ios-sdk/LotteryUI/Sources/**/*.{h,m}", "Nautilus-ios-sdk/LotteryUI/Sources/**/*.storyboard"
    spec.exclude_files = "Nautilus-ios-sdk/LotteryUI/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/LotteryUI/Resources/moduleapps-lottery-ui.json", "Nautilus-ios-sdk/LotteryUI/Resources/ma_lottery_lottery_winning_animation.json", "Nautilus-ios-sdk/LotteryUI/Sources/**/*.xib", "Nautilus-ios-sdk/LotteryUI/Sources/**/*.xcdatamodeld", "Nautilus-ios-sdk/LotteryUI/Resources/Assets.xcassets"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusLotteryUISDK.xcframework'
  end

  spec.frameworks = 'Foundation'
  spec.dependency "lottie-ios", "4.4.3"
  spec.dependency "NautilusCoreSDK", "#{spec.version}"
  spec.dependency "NautilusContainerSDK", "#{spec.version}"
  spec.dependency "NautilusConfigSDK", "#{spec.version}"
  spec.dependency "NautilusIdentifySDK", "#{spec.version}"
  spec.dependency "NautilusLoggingSDK", "#{spec.version}"
  spec.dependency "NautilusImagingSDK", "#{spec.version}"
  spec.dependency "NautilusAnalyticsSDK", "#{spec.version}"
  spec.dependency "NautilusUISDK", "#{spec.version}"
  spec.dependency "NautilusLotterySDK", "#{spec.version}"
  spec.dependency "NautilusServerTimeSDK", "#{spec.version}"

  spec.swift_version = '5.0'
end
