Pod::Spec.new do |s|
  s.name         = "AnimatedGif"
  s.version      = "0.0.1"
  s.summary      = "A short description of AnimatedGif."
  s.homepage     = "https://github.com/scspijker/iOS_AnimatedGif"
  s.license      = 'MIT'

  s.author       = { "scspijker" => "http://www.stijnspijker.nl/" }
  s.source       = { :git => "https://github.com/bcylin/iOS_AnimatedGif.git", :branch => "develop" }
  s.platform     = :ios, '5.0'

  s.source_files = 'Classes/AnimatedGif.{h,m}'
  s.requires_arc = false
end

