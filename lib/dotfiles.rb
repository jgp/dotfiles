module Kernel
  def sh(command)
    puts command
    system command
  end
end