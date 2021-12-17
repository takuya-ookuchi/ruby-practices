#! /usr/bin/env ruby
# frozen_string_literal: true

# 値を受け取る
score = p ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

# スコア計算
point = 0

## 基本ポイント
[11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0].each do |i|
  point += frames[i].sum unless frames[i].nil?
end

## ボーナスポイント
[8, 7, 6, 5, 4, 3, 2, 1, 0].each do |i|
  if frames[i][0] == 10 && frames[i + 1][0] == 10 # 2連続ストライク
    point += 10 + frames[i + 2][0]
  elsif frames[i][0] == 10 # ストライク
    point += frames[i + 1].sum
  elsif frames[i].sum == 10 # スペア
    point += frames[i + 1][0]
  end
end

puts point
