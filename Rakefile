# encoding: utf-8

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require "yaml"
require "highline"
require "dotfiles/tasks"

# === setup === #
DOTFILES_ROOT = File.dirname(__FILE__)
CONFIG_PATH = File.join(DOTFILES_ROOT, "config.yml")

# === helpers === #
def check_if_dir_and_its_rakefile_exists(directory)
  rakefile = File.join(directory, "Rakefile")
  unless File.directory?(directory)
    abort "ERROR: no #{directory} found. Please check your config.yml"
  end
  unless File.file?(rakefile)
    abort "ERROR: #{rakefile} is missing."
  end
end

# === tasks === #
desc "Backup your original dotfiles in your home"
task :backup do
  mkdir "backups"
  Dir.chdir("backups") do
    sh "tar cjpf dotfiles-#{Time.now.to_i}.tbz ~/.*"
    puts "Backup done"
  end
end

desc "[Re]create config.yml so you can specify which subprojects are you interested in"
task :setup do
  File.open(CONFIG_PATH, "w") do |file|
    Dir["#{DOTFILES_ROOT}/*/Rakefile"].each do |rakefile|
      subproject_path = File.dirname(rakefile)
      file.puts "- #{File.basename(subproject_path)}"
    end
  end
  puts "#{CONFIG_PATH} generated"
end

file "config.yml" do
  Rake::Task[:setup].invoke
  question = "Would you like to edit your config.yml now, so you will be able to specify which subprojects do you want to install and which not?"
  abort "Please edit your config.yml and run rake install again" unless agree question
end

desc "Build dotfiles and copy them to the $HOME directory"
task :install => "config.yml" do
  directories = YAML::load_file(CONFIG_PATH)
  directories.each do |directory|
    check_if_dir_and_its_rakefile_exists(directory)
    Dir.chdir(item) do
      puts "~ Entering into directory #{item} ..."
      if File.exist?("Rakefile")
        sh "rake install" rescue puts("Copying files from #{item} failed.")
      end
      puts
    end
  end
end
