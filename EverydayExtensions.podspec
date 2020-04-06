Pod::Spec.new do |spec|
  spec.name                     = "EverydayExtensions"
  spec.version                  = "1.0.0"
  spec.summary                  = "A little collection of everyday extensions."
  spec.homepage                 = "https://github.com/NikSrg/EverydayExtensions"
  spec.license                  = { :type => "MIT", :file => "LICENSE" }
  spec.author                   = { "Nick Sorge" => "nick.sorge@gmx.de" }
  spec.platform                 = :ios, "11.0"
  spec.swift_version            = "5.0"
  spec.source                   = { :git => "https://github.com/NikSrg/EverydayExtensions.git", :tag => "#{spec.version}" }
  spec.source_files             = "EverydayExtensions/**/*.swift"
end
