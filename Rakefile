require 'rake/testtask'
require 'rspec/core/rake_task'
require 'rake/gempackagetask'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "arrabiata"
  gem.homepage = "http://github.com/invadersmustdie/arrabiata"
  gem.license = "MIT"
  gem.summary = %Q{dead simple conversion of roman <> arabian numerals}
  gem.description = %Q{dead simple conversion of roman <> arabian numerals}
  gem.email = "rugek@dirtyhack.net"
  gem.authors = ["invadersmustdie"]
end
Jeweler::RubygemsDotOrgTasks.new

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--colour', '-f documentation', '--backtrace']
end

task :default => [:spec]
