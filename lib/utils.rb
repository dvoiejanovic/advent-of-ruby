def create_file(file_path, day)
  file = File.open(file_path, "w")
  puts "You have successfully created a file #{file_path} for day #{day}!"
  return file
end

def create_directories(dirs)
  for dir in dirs do
    if !File.directory?(dir)
      Dir.mkdir dir
    end
  end
end



