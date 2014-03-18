Pod::Spec.new do |s|
  s.name             = "CRLLib"
  s.version          = "0.1.0"
  s.summary          = "Crush & Lovely Bootstrap Library"
  s.license          = 'MIT'
  s.author           = { "Tim Clem" => "tim.clem@gmail.com" }
  s.source           = { :git => "https://github.com/misterfifths/CRLLib.git", :branch => "master" }

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  s.dependency 'CocoaLumberjack/Core'
  
  # Defining LOG_LEVEL_DEF makes sure we don't stomp on the application's
  # log level, which is usually called 'ddLogLevel'.
  s.prefix_header_contents = <<-PCH

#ifdef __OBJC__
  #define LOG_LEVEL_DEF CRLLogLevel
  #import <CocoaLumberjack/DDLog.h>
  static const int CRLLogLevel = LOG_LEVEL_WARN;
#endif
  PCH

  non_arc_files = 'Classes/CRLSystemSound.m'

  s.source_files = 'Classes'
  s.exclude_files = non_arc_files
  
  s.subspec 'Non-ARC' do |sna|
    sna.requires_arc = false
    sna.source_files = non_arc_files
    
    # Nil out the PCH content for this subspec... otherwise it gets two copies
    # of our string, which doesn't work at all.
    sna.prefix_header_contents = ''
  end
  
  s.public_header_files = 'Classes/*.h'
  s.frameworks = 'QuartzCore', 'AudioToolbox'
end