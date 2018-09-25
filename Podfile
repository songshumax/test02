# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'
#platform :ios, '10.0'
platform:ios,'9.0'

use_frameworks!
inhibit_all_warnings!


  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  
def pods

#  pod 'SwiftyFORM'
  pod 'SwiftyFORM'
  pod 'SwiftForms'
  pod 'Eureka'
  
  pod 'GooglePlaces'
  pod 'GooglePlacePicker'
  pod 'GoogleMaps'
  pod 'TangramKit', '~> 1.1.3'
  
  pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  
  pod 'Alamofire', '~> 4.0'
  pod 'Kingfisher', '4.6.1'
  pod 'ObjectMapper', '~> 3.1'
  pod 'SwiftyJSON', '4.0.0'
  pod 'Dollar', '7.1.0'
  pod 'Cent', '7.0.0'
  pod 'KeychainAccess', '3.1.0'
  pod 'UIColor_Hex_Swift', '~> 4.0.1'
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
  pod 'RxBlocking', '~> 4.0'
  pod 'XCGLogger', '~> 6.0.1'
  pod 'SnapKit', '~> 4.0.0'
  #    pod "BSImagePicker", "~> 2.4"
  pod 'ImagePicker'
  pod 'TSVoiceConverter', '0.1.6'
  pod 'XLActionController'
  pod 'TimedSilver', '1.1.0'
  
  #Objective-C
  pod 'YYText', '1.0.7'
  pod 'SVProgressHUD', '2.0.4'
  pod 'INTULocationManager', '4.2.0'
  
end
  
  
target 'test02' do
  pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'YES'
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end


  #pod 'Chatto', '= 3.3.1'
  #pod 'ChattoAdditions', '= 3.3.1' # if you want to use the cells or the input component

  # Pods for test02

#target 'test02Tests' do
#   inherit! :search_paths
    # Pods for testing
    # end

#target 'test02UITests' do
#    inherit! :search_paths
    # Pods for testing
    # end
  
  
  #platform :ios, '8.0'
  
  


