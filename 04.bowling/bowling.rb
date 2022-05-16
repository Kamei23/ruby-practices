require 'debug'

score = ARGV[0]
scores = score.split(",")
knocked_pins = []

scores.each do |s|
  if s == "X"
    knocked_pins << 10
    knocked_pins << 0
  else
    knocked_pins << s.to_i
  end
end

frames = []
knocked_pins.each_slice(2) do |s|
  frames << s
end

if frames[9].sum == 10
    frames[9] = frames[9..].flatten
end
frames[9].delete(0)

point = 0
frames[0..8].each_with_index do |frame, i|
    point +=if frame[0] == 10 && frames[i + 1][0] == 10
                20 + frames[i + 2][0]
            elsif frame[0] == 10
                10 + frames[i + 1][0] + frames[i + 1][1]
            elsif frame.sum == 10
                10 + frames[i + 1][0]
            else
                frame.sum
            end
end

point += frames[9].sum

puts point
