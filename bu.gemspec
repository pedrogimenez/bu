Gem::Specification.new do |spec|
  spec.name                   = "bu"
  spec.version                = "1.0.0"
  spec.date                   = "2014-08-06"
  spec.summary                = "Bu is just an event publisher"
  spec.description            = "Bu is just an event publisher"
  spec.authors                = ["Pedro Gimenez"]
  spec.email                  = ["me@pedro.bz"]
  spec.files                  = Dir["lib/**/*.rb"] + Dir["spec/**/*.rb"]
  spec.homepage               = "http://github.com/pedrogimenez/bu"
  spec.extra_rdoc_files       = ["README.md"]
  spec.required_ruby_version  = ">= 2.1.0"

  spec.add_development_dependency "rspec",       "~> 3.0"
  spec.add_development_dependency "rspec-mocks", "~> 3.0.2"
end
