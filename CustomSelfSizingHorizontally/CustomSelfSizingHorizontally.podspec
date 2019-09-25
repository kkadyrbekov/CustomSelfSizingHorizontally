
Pod::Spec.new do |spec|

  spec.name         = "CustomSelfSizingHorizontally"
  spec.version      = "1.0.1"
  spec.summary      = "Custom CollectionView Layout"
  spec.description  = "Cache attributes and dynamically size cells. (Horizontally)"
  spec.homepage     = "https://github.com/progi95/CustomSelfSizingHorizontally"
  spec.license      = { :type => 'MIT' }
  spec.author             = { "Kuba Kadyrbekov" => "k.kadyrbekov95@gmail.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/progi95/CustomSelfSizingHorizontally.git", :tag => "1.0.0" }
  spec.source_files  = "CustomSelfSizingHorizontally/CustomSelfSizingHorizontally"
  spec.exclude_files = "CustomSelfSizingHorizontally/Exclude"

end
