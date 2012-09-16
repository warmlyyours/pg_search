require 'bundler'
Bundler::GemHelper.install_tasks

task :default => :spec

def bundle_exec(command)
  FileUtils.rm_f("Gemfile.lock")
  sh %Q{bundle && bundle exec #{command}}
end

desc "Run all specs"
task "spec" => %w[spec:3.0 spec:3.1 spec:3.2]

namespace :spec do
  %w[3.0 3.1 3.2].each do |active_record_version|
    desc "Run specs against Active Record #{active_record_version}"
    task active_record_version do
      puts "*" * 80
      puts "Active Record #{active_record_version}"
      puts "*" * 80
      ENV["ACTIVE_RECORD_VERSION"] = active_record_version
      bundle_exec("rspec spec")
    end
  end
end

task "doc" do
  bundle_exec("rspec --format d spec")
end

namespace "doc" do
  desc "Generate README and preview in browser"
  task "readme" do
    sh "rdoc -c utf8 README.rdoc && open doc/README_rdoc.html"
  end
end
