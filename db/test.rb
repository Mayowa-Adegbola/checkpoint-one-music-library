puts Dir[File.join('./mp3s', '*.mp3')].map { |filename| File.basename(filename)}

# puts File.join("usr", "mail", "gumby")