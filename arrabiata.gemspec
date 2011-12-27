# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{arrabiata}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["invadersmustdie"]
  s.date = %q{2011-12-26}
  s.description = %q{dead simple conversion of roman <> arabic numerals}
  s.email = %q{rugek@dirtyhack.net}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "arrabiata.gemspec",
    "lib/arrabiata.rb",
    "spec/arrabiata_to_arabic_spec.rb",
    "spec/arrabiata_to_roman_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/invadersmustdie/arrabiata}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{dead simple conversion of roman <> arabic numerals}
  s.test_files = [
    "spec/arrabiata_to_arabic_spec.rb",
    "spec/arrabiata_to_roman_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

