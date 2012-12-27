# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "do_mysql"
  s.version = "0.10.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dirkjan Bussink"]
  s.date = "2011-03-28"
  s.description = "Implements the DataObjects API for MySQL"
  s.email = "d.bussink@gmail.com"
  s.extensions = ["ext/do_mysql/extconf.rb"]
  s.extra_rdoc_files = ["ChangeLog.markdown", "LICENSE", "README.markdown"]
  s.files = ["ChangeLog.markdown", "LICENSE", "README.markdown", "ext/do_mysql/extconf.rb"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "dorb"
  s.rubygems_version = "1.8.24"
  s.summary = "DataObjects MySQL Driver"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<data_objects>, ["= 0.10.10"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.7"])
    else
      s.add_dependency(%q<data_objects>, ["= 0.10.10"])
      s.add_dependency(%q<rspec>, ["~> 2.5"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<data_objects>, ["= 0.10.10"])
    s.add_dependency(%q<rspec>, ["~> 2.5"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.7"])
  end
end