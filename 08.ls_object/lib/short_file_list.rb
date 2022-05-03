# require 'etc'

# class ShortFileList
#   FILE_TYPE = {
#     "010" => "p",
#     "020" => "c",
#     "040" => "d",
#     "060" => "b",
#     "100" => "-",
#     "120" => "l",
#     "140" => "s",
#   }
#   PERMISSION = {
#     "0" => "---",
#     "1" => "--x",
#     "2" => "-w-",
#     "3" => "-wx",
#     "4" => "r--",
#     "5" => "r-x",
#     "6" => "rw-",
#     "7" => "rwx",
#   }
#   def initialize(file)
#     @file = File.stat(file)
#   end

#   def show
#     print @file.mode.to_s(8).rjust(6, "0")[0..2].gsub(/010|020|040|060|100|120|140/, FILE_TYPE)
#     print "#{@file.mode.to_s(8).rjust(6, "0")[3..5].gsub(/[01234567]/, PERMISSION)} "
#     print "#{@file.nlink.to_s.rjust(10)} "
#     print "#{Etc.getpwuid(@file.uid).name.rjust(10)} "
#     print "#{Etc.getgrgid(@file.gid).name.rjust(10)} "
#     print "#{@file.size.to_s.rjust(10)} "
#     print @file.mtime.strftime("%b %e %R ")
#   end
# end

# ShortFileList.new(".gitkeep").show

