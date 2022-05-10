# frozen_string_literal: true

require_relative 'file_data'

class LongFileList
  def initialize(file_list)
    @file_list = file_list
  end

  def show_list
    ["total #{calculate_total_block_number}", *format_list]
  end

  private

  def calculate_total_block_number
    # デフォルドでは1ブロックが1024バイト。これを2で割ってlsコマンドの標準512バイトに合わせる。
    @file_list.sum(&:blocks) / 2
  end

  def format_list
    nlink_length = 0
    uid_length = 0
    gid_length = 0
    size_length = 0
    file_data_hashes = @file_list.map do |file|
      nlink_length = nlink_length > file.nlink.length ? nlink_length : file.nlink.length
      uid_length = uid_length > file.uid.length ? uid_length : file.uid.length
      gid_length = gid_length > file.gid.length ? gid_length : file.gid.length
      size_length = size_length > file.size.length ? size_length : file.size.length
      { type: file.type, permission: file.permission, nlink: file.nlink,
        uid: file.uid, gid: file.gid, size: file.size, time: file.time, name: file.name }
    end
    file_data_hashes.map do |hash|
      adjust_spaces(hash, nlink_length, uid_length, gid_length, size_length).join
    end
  end

  def adjust_spaces(hash, nlink_length, uid_length, gid_length, size_length)
    [
      hash[:type],
      hash[:permission],
      hash[:nlink].rjust(nlink_length + 1),
      hash[:uid].rjust(uid_length + 1),
      hash[:gid].rjust(gid_length + 1),
      hash[:size].rjust(size_length + 1),
      hash[:time].rjust(14),
      hash[:name]
    ]
  end
end
