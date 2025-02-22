Pod::Spec.new do |spec|
  spec.name         = "MewLoaders"
  spec.version      = "0.1.0"
  spec.summary      = "Mew Loaders is a SwiftUI package that brings unique, quirky, and highly customizable loading animations to your iOS apps"
  
  spec.swift_version = '5.4'

  spec.description  = <<-DESC
  This is a SwiftUI package that brings unique, quirky, and highly customizable loading animations to your iOS apps. Keep reading for how to use and customise. Keep watching for incoming loaders. Code On!!
                   DESC

  spec.homepage     = "https://github.com/monuk7735/mew-loaders"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = { :type => "GPLv3", :file => "LICENSE" }


  spec.author             = { "Monu Kumar" => "monuk7735@gmail.com" }
  spec.social_media_url   = "https://github.com/monuk7735/"

  spec.ios.deployment_target = "14.0"
  spec.watchos.deployment_target = "7.0"
  spec.tvos.deployment_target = "14.0"
  spec.osx.deployment_target = "11.0"
  spec.visionos.deployment_target = "1.0"

  spec.source       = {
        :git => "https://github.com/monuk7735/mew-loaders.git",
        :branch => "main",
        :tag => "#{spec.version}"
    }

  spec.source_files  = "Sources", "sources/**/*.swift"

end
