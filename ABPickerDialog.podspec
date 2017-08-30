Pod::Spec.new do |s|
  s.name             = 'ABPickerDialog'
  s.version          = '0.1.0'
  s.summary          = 'Dialog with UIPickerView'
 
  s.description      = <<-DESC
  Handy for picking Date, time, strings
                       DESC
 
  s.homepage         = 'https://github.com/alexburtnik/ABPickerDialog'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alexburtnik' => 'alexburtnik@gmail.com' }
  s.source           = { :git => 'https://github.com/alexburtnik/ABPickerDialog.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'Source/**/*.swift'
  s.resources = ['Source/**/*.xib']
 
end