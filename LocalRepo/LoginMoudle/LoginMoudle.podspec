Pod::Spec.new do |s|

  s.name         = "LoginMoudle"
  s.version      = "0.0.1"
  s.summary      = "LoginMoudle is a Category for Mediator and A moudle"
  s.description  = <<-DESC
    LoginMoudle is a Category for Mediator and A moudle,A_Category is a Category for Mediator and A moudle
                   DESC

  s.homepage         = 'https://github.com/linlinyin1991/LoginMoudle'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "ElaineYin" => "linlinyin1991@163.com" }
  s.source       = { :git => "https://github.com/linlinyin1991/LoginMediator.git", :tag => "#{s.version}" }
  s.ios.deployment_target = '8.0'
  s.frameworks = 'UIKit'

  s.dependency 'ELUtility'
  s.dependency 'IQKeyboardManager'
  s.dependency 'Masonry'
  s.dependency 'ReactiveCocoa'
  s.dependency 'ModuleProtocols'
  s.dependency 'MediaService'
  s.prefix_header_contents = <<-EOS
  #import <ELUtility/ELDeviceMacro.h>
  #import <ReactiveCocoa/ReactiveCocoa.h>
  #import <Masonry/Masonry.h>
  EOS
  s.subspec 'Service' do |ss|
      ss.source_files = 'LoginMoudle/Service/**/*'
  end
  s.subspec 'Class' do |ss|
      ss.source_files = 'LoginMoudle/Classes/**/*'
  end
 end
