# frozen_string_literal: true

require 'optparse'
require 'etc'

TEXT_WIDTH = 30
COLUMNS = 3

def options
  @options ||= ARGV.getopts('arl') # 受け取れるオプション
end

def file_lists
  options['a'] ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
end

def sort_lists
  options['r'] ? file_lists.sort.reverse : file_lists
end

def adjust_long_list_spaces
  @total_block_number = 0
  nlink_array = []
  uid_array = []
  gid_array = []
  size_array = []

  file_lists.each do |list|
    content = File::Stat.new(list)
    @total_block_number += File::Stat.new(list).blocks
    nlink_array << content.nlink.to_s
    uid_array << Etc.getpwuid(content.uid).name
    gid_array << Etc.getgrgid(content.gid).name
    size_array << content.size.to_s
  end

  @nlink_max_length = nlink_array.map(&:length).max
  @uid_max_length = uid_array.map(&:length).max
  @gid_max_length = gid_array.map(&:length).max
  @size_max_length = size_array.map(&:length).max
end

def show_long_lists
  adjust_long_list_spaces
  puts "total #{@total_block_number / 2}" # 1バイト1024を半分の512に変更する

  sort_lists.each do |list|
    content = File::Stat.new(list)
    file_type = { '010' => 'p', '020' => 'c', '040' => 'd', '060' => 'b', '100' => '-', '120' => 'l', '140' => 's' }
    permission = { '0' => '---', '1' => '--x', '2' => '-w-', '3' => '-wx', '4' => 'r--', '5' => 'r-x', '6' => 'rw-', '7' => 'rwx' }
    print content.mode.to_s(8).rjust(6, '0')[0..2].gsub(/010|020|040|060|100|120|140/, file_type)
    print "#{content.mode.to_s(8).rjust(6, '0')[3..5].gsub(/[01234567]/, permission)} "
    print "#{content.nlink.to_s.rjust(@nlink_max_length)} "
    print "#{Etc.getpwuid(content.uid).name.rjust(@uid_max_length)} "
    print "#{Etc.getgrgid(content.gid).name.rjust(@gid_max_length)} "
    print "#{content.size.to_s.rjust(@size_max_length)} "
    print content.mtime.strftime('%b %e %R ')
    puts(list.to_s)
  end
end

def create_columns
  lists = sort_lists.map { |list| list.ljust(TEXT_WIDTH) }
  rest_of_row = lists.size % COLUMNS
  (COLUMNS - rest_of_row).times { lists.push(nil) } if rest_of_row != 0
  lists.each_slice(lists.size / COLUMNS).to_a
end

def show_columns
  create_columns.transpose.each do |result|
    puts result.join
  end
end

def show_results
  options['l'] ? show_long_lists : show_columns
end

show_results
