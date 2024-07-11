Pod::Spec.new do |s|
  s.name             = 'EvoPayTokenizer'
  s.version          = '1.1.9'
  s.summary          = 'EvoPayTokenizer helps you get a token for a bank card through evopay Payment Provider.'
  s.description      = "EvoPayTokenizer provides a simple interface to get a token for a payment card, that your users specify. This token will further be used when working with other evopay services."

  s.homepage         = 'https://tranzzo.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EvoPay' => 'evo.company' }
  s.source           = { :git => 'https://github.com/evo-company/ios-card-tokenizer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Sources/EvoPayTokenizer/**/*.{h,m,swift}'
  s.swift_versions = ['5.0', '5.1']
end
