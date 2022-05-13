# frozen_string_literal: true

class LongFileList
  def initialize(file_list)
    @file_list = file_list
  end

  def show_list
    max_length_hash = calc_max_length
    formated_list = @file_list.map { |file| format_list(file, max_length_hash).join }
    ["total #{calculate_total_block_number}", *formated_list]
  end

  private

  def calculate_total_block_number
    # デフォルドでは1ブロックが1024バイト。これを2で割ってlsコマンドの標準512バイトに合わせる。
    @file_list.sum(&:blocks) / 2
  end

  def calc_max_length
    {
      nlink: @file_list.map { |file| file.nlink.length }.max + 1,
      uid: @file_list.map { |file| file.uid.length }.max + 1,
      gid: @file_list.map { |file| file.gid.length }.max + 1,
      size: @file_list.map { |file| file.size.length }.max + 1
    }
  end

  def format_list(file, max_length_hash)
    [
      file.type,
      file.permission,
      file.nlink.rjust(max_length_hash[:nlink]),
      file.uid.rjust(max_length_hash[:uid]),
      file.gid.rjust(max_length_hash[:gid]),
      file.size.rjust(max_length_hash[:size]),
      file.time.rjust(14),
      file.name
    ]
  end
end
