Pod::Spec.new do |s|
  s.name             = 'TranzzoTokenizer'
  s.version          = '1.1.6'
  s.summary          = 'TranzzoTokenizer helps you get a token for a bank card through Tranzzo Payment Provider.'
  s.description      = "TranzzoTokenizer provides a simple interface to get a token for a payment card, that your users specify. This token will further be used when working with other Tranzzo services."

  s.homepage         = 'https://tranzzo.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tranzzo' => 'tranzzo.com' }
  s.source           = { :git => 'https://github.com/tranzzo/ios-card-tokenizer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'TranzzoTokenizer/**/*.{h,m,swift}'
  s.swift_versions = ['5.0', '5.1']
end
