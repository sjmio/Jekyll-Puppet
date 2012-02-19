# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{directory_watcher}
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Pease"]
  s.date = %q{2011-08-30}
  s.description = %q{The directory watcher operates by scanning a directory at some interval and
generating a list of files based on a user supplied glob pattern. As the file
list changes from one interval to the next, events are generated and
dispatched to registered observers. Three types of events are supported --
added, modified, and removed.}
  s.email = %q{tim.pease@gmail.com}
  s.executables = ["dw"]
  s.extra_rdoc_files = ["History.txt", "README.txt", "bin/dw"]
  s.files = ["bin/dw", "History.txt", "README.txt"]
  s.homepage = %q{http://gemcutter.org/gems/directory_watcher}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{directory_watcher}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{A class for watching files within a directory and generating events when those files change}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones-git>, [">= 1.2.4"])
      s.add_development_dependency(%q<rev>, [">= 0"])
      s.add_development_dependency(%q<eventmachine>, [">= 0.12.10"])
      s.add_development_dependency(%q<bones>, [">= 3.7.0"])
    else
      s.add_dependency(%q<bones-git>, [">= 1.2.4"])
      s.add_dependency(%q<rev>, [">= 0"])
      s.add_dependency(%q<eventmachine>, [">= 0.12.10"])
      s.add_dependency(%q<bones>, [">= 3.7.0"])
    end
  else
    s.add_dependency(%q<bones-git>, [">= 1.2.4"])
    s.add_dependency(%q<rev>, [">= 0"])
    s.add_dependency(%q<eventmachine>, [">= 0.12.10"])
    s.add_dependency(%q<bones>, [">= 3.7.0"])
  end
end
