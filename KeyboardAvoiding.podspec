Pod::Spec.new do |s|
    s.name             = 'KeyboardAvoiding'
    s.version          = '1.0.1'
    s.summary          = 'KeyboardAvoiding with ease.'
    s.description      = <<-DESC
                            Watch out! We've got a keyboard here!
                       DESC

    s.homepage         = 'https://theswiftdev.com/'
    s.license          = { :type => 'WTFPL', :file => 'LICENSE' }
    s.author           = { 'Tibor Bödecs' => 'mail.tib@gmail.com' }
    s.source           = { :git => 'https://github.com/CoreKit/KeyboardAvoiding.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/tiborbodecs'

    s.ios.deployment_target = '11.0'

    s.swift_version = '4.2'
    s.source_files = 'Sources/**/*'
    s.frameworks = 'UIKit'
end
