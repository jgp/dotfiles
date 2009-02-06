desc "Build dotfiles and copy them to the $HOME directory"
task :install do
  Dir["*"].each do |item|
    if File.directory?(item)
      Dir.chdir(item) do
        puts "~ Entering into directory #{item} ..."
        if File.exist?("Rakefile")
          sh "rake install" rescue puts("Copying files from #{item} failed.")
        end
        puts
      end
    end
  end
end
