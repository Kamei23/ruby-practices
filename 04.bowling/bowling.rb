# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
knocked_pins = []

scores.each do |s|
  if s == 'X'
    knocked_pins << 10
    knocked_pins << 0
  else
    knocked_pins << s.to_i
  end
end

frames = knocked_pins.each_slice(2).to_a do |s|
  frames << s
end

LAST_FRAME_INDEX = 9

frames[LAST_FRAME_INDEX] = frames[LAST_FRAME_INDEX..].flatten if frames[LAST_FRAME_INDEX].sum == 10
frames[LAST_FRAME_INDEX].delete(0)

point = frames[0..8].each_with_index.sum do |frame, i|
  if frame[0] == 10 && frames[i + 1][0] == 10
    20 + frames[i + 2][0]
  elsif frame[0] == 10
    10 + frames[i + 1][0] + frames[i + 1][1]
  elsif frame.sum == 10
    10 + frames[i + 1][0]
  else
    frame.sum
  end
end

point += frames[LAST_FRAME_INDEX].sum

puts point
