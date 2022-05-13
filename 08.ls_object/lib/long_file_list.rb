# frozen_string_literal: true

class LongFileList
  def initialize(file_data_list)
    @file_data_list = file_data_list
  end

  def show_list
    max_length_hash = calc_max_length
    formated_file_list = @file_data_list.map { |file_data| format_list(file_data, max_length_hash).join }
    ["total #{calculate_total_block_number}", *formated_file_list]
  end

  private

  def calculate_total_block_number
    # デフォルドでは1ブロックが1024バイト。これを2で割ってlsコマンドの標準512バイトに合わせる。
    @file_data_list.sum(&:blocks) / 2
  end

  def calc_max_length
    {
      nlink: @file_data_list.map { |file_data| file_data.nlink.to_s.length }.max + 1,
      uid: @file_data_list.map { |file_data| file_data.uid.length }.max + 1,
      gid: @file_data_list.map { |file_data| file_data.gid.length }.max + 1,
      size: @file_data_list.map { |file_data| file_data.size.to_s.length }.max + 1
    }
  end

  def format_list(file_data, max_length_hash)
    [
      file_data.type,
      file_data.permission,
      file_data.nlink.to_s.rjust(max_length_hash[:nlink]),
      file_data.uid.rjust(max_length_hash[:uid]),
      file_data.gid.rjust(max_length_hash[:gid]),
      file_data.size.to_s.rjust(max_length_hash[:size]),
      file_data.time.strftime('%b %e %R ').rjust(14),
      file_data.name
    ]
  end
end
