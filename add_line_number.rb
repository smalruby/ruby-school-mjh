#!/usr/bin/env ruby

path = ARGV.shift
File.open(path) do |f|
  i = 1
  while (line = f.gets)
    printf("%03d: %s\n", i, line.chomp)
    i += 1
  end
end
