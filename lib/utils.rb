def create_file(file_path, format, day, part_idx = nil)
  path = part_idx ? [file_path, "_part", part_idx, ".", format].join : [file_path, ".", format].join
  file = File.open(path, "w")
  puts " 🧣 Elfs have created file #{path} for day #{day}! 🧣"
  return file
end

def create_directories(dirs)
  for dir in dirs do
    if !File.directory?(dir)
      Dir.mkdir dir
    end
  end
end



