Pod::Spec.new do |s|
  s.name             = "Sidecar"
  s.version          = "1.0.0"
  s.summary          = "Yet Another iOS Utility Belt"
  s.license          = 'MIT'
  s.authors          = { 'Crush & Lovely' => 'engineering@crushlovely.com', 'Tim Clem' => 'tim@crushlovely.com' }
  s.source           = { :git => "https://github.com/crushlovely/Sidecar.git", :tag => "v#{s.version}" }
  s.homepage         = 'https://github.com/crushlovely/Sidecar'

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  
  # Defining LOG_LEVEL_DEF makes sure we don't stomp on the application's
  # log level, which is usually called 'ddLogLevel'.
  s.prefix_header_contents = <<-PCH

#ifdef __OBJC__
  #if __has_include(<CocoaLumberjack/CocoaLumberjack.h>)
    #define LOG_LEVEL_DEF CRLSidecarLogLevel

    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wunused-function"
    #import <CocoaLumberjack/CocoaLumberjack.h>
    #pragma clang diagnostic pop

    static const DDLogLevel CRLSidecarLogLevel = DDLogLevelWarning;
  #endif
#endif
  PCH

  non_arc_files = 'Sidecar/CRLSystemSound.{h,m}'

  s.source_files = 'Sidecar'
  s.exclude_files = non_arc_files
  
  s.subspec 'Non-ARC' do |sna|
    sna.requires_arc = false
    sna.source_files = non_arc_files
    
    # Nil out the PCH content for this subspec... otherwise it gets two copies
    # of our string, which doesn't work at all.
    sna.prefix_header_contents = ''
  end
  
  s.public_header_files = 'Sidecar/*.h'
  s.frameworks = 'QuartzCore', 'AudioToolbox'
end
