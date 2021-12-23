#! /usr/bin/env ruby

# frozen_string_literal: true

class List
  # カレントディレクトリからファイル名を取得
  def self.gets_list
    @files = []
    Dir.glob('*') { |file| @files << file }
  end

  # ファイル名を出力
  def self.puts_list
    List.gets_list
    name_length = 0
    @files.each { |file| name_length = file.length if name_length < file.length }

    column_count = 3 # 列
    row_count = @files.count / column_count # 行
    row_count += 1 if row_count * column_count < @files.count

    (0...row_count).each do |row|
      (0...column_count).each do |column|
        i = row_count * column + row
        printf("%-#{name_length}s\t", @files[i])
      end
      print("\n")
    end
  end
end

List.puts_list
