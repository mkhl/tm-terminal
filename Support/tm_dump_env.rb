require "#{ENV["TM_SUPPORT_PATH"]}/lib/escape"

ENV.keys.each do |key|
  next if '_' == key
  puts "export #{key}=#{e_sh(ENV[key])}"
end
