Gem::Specification.new do |s|
  s.name = "qwerly"
  s.version = "0.1"
  s.summary = %{A very simple Qwerly ruby gem.}
  s.description = %Q{A very simple Qwerly ruby gem.}
  s.authors = ["Colin Young"]
  s.email = ["me@colinyoung.com"]
  s.homepage = "http://github.com/colinyoung/qwerly"
  s.files = ["lib/qwerly.rb"]
  s.rubyforge_project = "qwerly"
  s.add_dependency "cutest", "~> 1.1"
  s.add_dependency "httparty"
  s.add_dependency "activesupport"
end
