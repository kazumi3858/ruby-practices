# frozen_string_literal: true

require "etc"

class FileData
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

  def initialize(file)
    @file = File.stat(file)
    @file_name = file
  end

  def type
    @file.mode.to_s(8).rjust(6, "0")[0..2].gsub(/010|020|040|060|100|120|140/, FILE_TYPE)
  end

  def permission
    @file.mode.to_s(8).rjust(6, "0")[3..5].gsub(/[01234567]/, PERMISSION)
  end

  def nlink
    @file.nlink.to_s
  end

  def uid
    Etc.getpwuid(@file.uid).name
  end

  def gid
    Etc.getgrgid(@file.gid).name
  end

  def size
    @file.size.to_s
  end

  def time
    @file.mtime.strftime("%b %e %R ")
  end

  def blocks
    @file.blocks
  end

  def name
    @file_name
  end
end
