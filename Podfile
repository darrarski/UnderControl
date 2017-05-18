source 'git://github.com/CocoaPods/Specs.git'
use_frameworks!
inhibit_all_warnings!

def pod_core
  pod 'SwiftLint', '~> 0.18'
  pod 'RxSwift', '~> 3.4'
end

def pod_tests
  pod 'SwiftLint', '~> 0.18'
  pod 'RxSwift', '~> 3.4'
  pod 'Quick', '~> 1.1'
  pod 'Nimble', '~> 7.0'
  pod 'RxTest', '~> 3.4'
end

target 'UnderControl-iOS' do
  platform :ios, '10.3'
  pod_core 
end

target 'UnderControl-macOS' do
  platform :osx, '10.12'
  pod_core
end

target 'UnderControl-tvOS' do
  platform :tvos, '10.2'
  pod_core 
end

target 'UnderControlApp-iOS' do
  platform :ios, '10.3'
  pod_core
end

target 'UnderControlApp-macOS' do
  platform :osx, '10.12'
  pod_core
end

target 'UnderControlApp-tvOS' do
  platform :tvos, '10.2'
  pod_core
end

target 'UnderControlTests-iOS' do
  platform :ios, '10.3'
  pod_tests
end

target 'UnderControlTests-macOS' do
  platform :osx, '10.12'
  pod_tests
end

target 'UnderControlTests-tvOS' do
  platform :tvos, '10.2'
  pod_tests
end
