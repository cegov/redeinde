# Encoding: UTF-8

Gem::Specification.new do |s|
  s.author            = "Marcelo Eduardo Cardoso"
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-newsarticles'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Newsarticles extension for Refinery CMS'
  s.date              = '2014-04-22'
  s.summary           = 'Newsarticles extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.1.2'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.2'
end
