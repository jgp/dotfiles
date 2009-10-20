class ErrorMenu

  def error(message)
    puts %Q{<?xml version="1.0" encoding="utf-8"?>
    <openbox_pipe_menu>
      <item label="#{message}">
      </item>
    </openbox_pipe_menu>
    }.gsub(/^\t{2}/, '')
  end

end
