# === Helpers === #
module FileUtils
  def cp_rf(from, to)
    sh("rm -rf '#{to}'")
    sh("cp -rf '#{from}' '#{to}'")
  end
end

def platform
  %x(uname).downcase.chomp
end

# === Patching Tasks === #
namespace :patch do
  task :generate do
    puts "Generating patch ..."
    versions = Dir["#{ENV["HOME"]}/.zshrc-*"]
    previous = versions.sort.last
    if previous
      sh "diff #{previous} #{ENV["HOME"]}/.zshrc > changes.patch; true"
    end
  end

  desc "Merge changes made in ~/.zshrc back into generated zshrc"
  task :apply do
    puts "Applying patch ..."
    versions = Dir["#{ENV["HOME"]}/.zshrc-*"] || Array.new
    previous = versions.sort[-2]
    if previous
      p sh("patch #{ENV["HOME"]}/.zshrc changes.patch")
    end
  end
end

# === Installation Tasks === #
desc "Copy each dotfile to the $HOME directory"
task :install => "install:clever"

desc "Run preinstall hooks if any"
task :preinstall

namespace :install do
  desc "Copy each dotfile to the $HOME directory"
  task :force => :preinstall do |item|
    Dir["*"].each do |file|
      next if file.eql?("Rakefile")
      cp_rf file, File.join(ENV["HOME"], ".#{file}")
    end
  end

  desc "Copy each dotfile to the $HOME directory"
  task :soft => :preinstall do |item|
    Dir["*"].each do |file|
      next if file.eql?("Rakefile")
      cp_rf file, File.join(ENV["HOME"], ".#{file}")
    end
  end

  desc "Copy each dotfile to the $HOME directory"
  task :clever => :preinstall do |item|
    Dir["*"].each do |file|
      next if file.eql?("Rakefile")
      cp_rf file, File.join(ENV["HOME"], ".#{file}")
    end
  end
end
