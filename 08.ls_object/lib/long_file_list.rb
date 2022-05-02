class LongFileList
  FILE_TYPE = {
    "010" => "p",
    "020" => "c",
    "040" => "d",
    "060" => "b",
    "100" => "-",
    "120" => "l",
    "140" => "s",
  }
  PERMISSION = {
    "0" => "---",
    "1" => "--x",
    "2" => "-w-",
    "3" => "-wx",
    "4" => "r--",
    "5" => "r-x",
    "6" => "rw-",
    "7" => "rwx",
  }

  def initialize(file_list)
    @file_list = file_list
  end

  def calculate_total_block_number
    @file_list.map { |file| File::Stat.new(file).blocks}.sum / 2
  end
#   def adjust_long_list_spaces
#   @total_block_number = 0
#   nlink_array = []
#   uid_array = []
#   gid_array = []
#   size_array = []

#   file_lists.each do |list|
#     content = File::Stat.new(list)
#     @total_block_number += File::Stat.new(list).blocks
#     nlink_array << content.nlink.to_s
#     uid_array << Etc.getpwuid(content.uid).name
#     gid_array << Etc.getgrgid(content.gid).name
#     size_array << content.size.to_s
#   end

#   @nlink_max_length = nlink_array.map(&:length).max
#   @uid_max_length = uid_array.map(&:length).max
#   @gid_max_length = gid_array.map(&:length).max
#   @size_max_length = size_array.map(&:length).max
# end

# def format_list
#   adjust_long_list_spaces
#   puts "total #{@total_block_number / 2}" # 1バイト1024を半分の512に変更

#   sort_lists.each do |list|
#     content = File::Stat.new(list)
#     print content.mode.to_s(8).rjust(6, '0')[0..2].gsub(/010|020|040|060|100|120|140/, FILE_TYPE)
#     print "#{content.mode.to_s(8).rjust(6, '0')[3..5].gsub(/[01234567]/, PERMISSION)} "
#     print "#{content.nlink.to_s.rjust(@nlink_max_length)} "
#     print "#{Etc.getpwuid(content.uid).name.rjust(@uid_max_length)} "
#     print "#{Etc.getgrgid(content.gid).name.rjust(@gid_max_length)} "
#     print "#{content.size.to_s.rjust(@size_max_length)} "
#     print content.mtime.strftime('%b %e %R ')
#     puts(list.to_s)
#   end
# end

end

p LongFileList.new(["test", "lib", ".gitkeep", "..", "."]).calculate_total_block_number
