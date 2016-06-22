Pod::Spec.new do |s|
  
  s.name = 'JSchemaForms'
  s.version = '0.3'
  s.license = 'MIT'
  s.summary = 'JSON Schema Forms Builder'
  s.author = { 'Andrey Belonogov' => 'abelon.dev@gmail.com' }
  s.social_media_url = 'https://twitter.com/gosubits'
  s.platform = :ios, '8.0'
  s.requires_arc = true
  s.ios.frameworks = 'UIKit', 'Foundation'

  s.homepage = 'http://gosubits.com'
  s.source = { :path => './' }
  s.source_files = 'Source/**/*.swift'
  s.dependency 'Eureka', '~> 1.6.0'

end
