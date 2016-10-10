Pod::Spec.new do |s|
  s.name             = "KSTableViewManager"
  s.version          = "2.0.1"
  s.summary          = "Simple UITableView DataSource & Delegate wrapper"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
  Simple UITableView DataSource & Delegate wrapper
                       DESC

  s.homepage         = "https://github.com/koszcz/KSTableViewManager"
  s.license          = 'MIT'
  s.author           = { "Konrad Szczesniak" => "konrad.szczesniak@elpassion.pl" }
  s.source           = { :git => "https://github.com/koszcz/KSTableViewManager.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/koszcz'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'KSTableViewManager/KSTableViewManager**/*'
  s.resource_bundles = { } 
  s.public_header_files = 'KSTableViewManager/KSTableViewManager**/*.h'
  s.frameworks = 'UIKit'
end

