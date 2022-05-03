# frozen_string_literal: true

require_relative 'file'

class LongFileList
  def initialize(file_list)
    @file_list = file_list.map { |file| FileData.new(file) }
  end

  def calculate_total_block_number
    @file_list.sum { |file| file.blocks } / 2 # 2で割ってバイト数を調整
  end

  def adjudt_length
    {
      nlink: @file_list.map { |file| file.nlink.length }.max + 1,
      uid: @file_list.map { |file| file.uid.length }.max + 1,
      gid: @file_list.map { |file| file.gid.length }.max + 1,
      size: @file_list.map { |file| file.size.length }.max + 1,
    }
  end

  def format_list(file)
    [
      file.type,
      file.permission,
      file.nlink.rjust(adjudt_length[:nlink]),
      file.uid.rjust(adjudt_length[:uid]),
      file.gid.rjust(adjudt_length[:gid]),
      file.size.rjust(adjudt_length[:size]),
      file.time.rjust(14),
      file.name
    ]
  end

  def show_list
    puts "total #{calculate_total_block_number}"

    @file_list.each do |file|
      puts format_list(file).join
    end
  end
end

LongFileList.new(["test", "lib", ".gitkeep", "..", "."]).show_list
