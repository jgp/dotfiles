require "highline/import"

# === Helpers === #
module FileUtils
  def cp_f(from, to)
    sh("cp -f '#{from}' '#{to}'")
  end

  def cp_rf(from, to)
    sh("rm -rf '#{to}'")
    sh("cp -rf '#{from}' '#{to}'")
  end
end

def platform
  %x(uname).downcase.chomp
end

def copy(from, to)
  raise Errno::ENOENT, "File #{from} doesn't exist" unless File.exist?(from)
  if File.directory?(from)
    cp_rf from, to
  else
    cp_f from, to
  end
end

# copy_to_dotfile "zshrc"
# copy_to_dotfile "vim/macros"
# copy_to_dotfile "zshrc" { |file| generate_patch(file) }
def copy_to_dotfile(file, &block)
  homepath = File.join(ENV["HOME"], ".#{file}")
  unless File.exist?(homepath)
    copy file, homepath
  else
    unless File.read(file).eql?(File.read(homepath))
      block.call(homepath)
    end
    copy file, homepath
  end
end

def backup_dotfile(path)
  cp path, "#{path}-#{Time.now.strftime("%m%d%H%S")}"
end

def generate_patch(file, homepath)
  puts "Generating patch ..."
  sh "diff '#{file}' '#{homepath}' > changes.patch; true"
end

# Merge changes made in ~/.zshrc back into generated zshrc
def apply_patch(patch, file)
  if File.exist?("changes.patch")
    puts "\n\n=== Diff ==="
    puts File.read("changes.patch")
  end
  if agree("Would you like to apply this patch?")
    puts "Applying patch ..."
    p sh("patch #{file} changes.patch")
  else
    abort "Patch skipped, exiting"
  end
end

def remove_old_backups(homepath)
  (Dir["#{homepath}-*"].sort.reverse[4..-1] || Array.new).each do |path|
    rm path
  end
end

# === Backup Tasks === #
desc "Backup your original dotfiles in your home"
task :backup do
  mkdir "../backups"
  Dir.chdir("../backups") do
    sh "tar cjpf #{NAME}-#{Time.now.to_i}.tbz ~/.#{FILES}"
    puts "Backup done"
  end
end

# === Installation Tasks === #
desc "Copy each dotfile to the $HOME directory.
      If the file is already there, save the original one,
      generate the patch, copy the new version and patch it back"
task :install => :preinstall do |item|
  FILES.each do |file|
    copy_to_dotfile(file) do |homepath|
      backup_dotfile(homepath)
      path = generate_patch(file, homepath)
      apply_patch(path, file)
      remove_old_backups(homepath)
      sh "git co #{file}" # reset
    end
  end
end

namespace :install do
  desc "Copy each dotfile to the $HOME directory"
  task :force => :preinstall do |item|
    FILES.each { |file| copy_to_dotfile file }
  end
end

desc "Run preinstall hooks if any"
task :preinstall => :clean
