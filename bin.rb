io = File.open("mod.gif", "rb")
sum = 0
flag = false
size = nil
while true
  if !flag
    i= io.read(1).unpack("h2")
  else
    i = size
  end
  flag = false
  if i[0] == "00"
    i2= io.read(1).unpack("h2")
    if i2[0] == "c2"
      puts ("im s #{i[0].reverse} #{i2[0].reverse}")
      puts ("left #{io.read(1).unpack("h2")[0].reverse}") ## left
      puts ("left #{io.read(1).unpack("h2")[0].reverse}") ## left
      puts ("top  #{io.read(1).unpack("h2")[0].reverse}") ## top
      puts ("top  #{io.read(1).unpack("h2")[0].reverse}") ## top
      puts ("im w #{io.read(1).unpack("h2")[0].reverse}") ## image w
      puts ("im w #{io.read(1).unpack("h2")[0].reverse}") ## image w
      puts ("im h #{io.read(1).unpack("h2")[0].reverse}") ## image h
      puts ("im h #{io.read(1).unpack("h2")[0].reverse}") ## image h
      puts ("lctf #{io.read(1).unpack("h2")[0].reverse}") ## LCTF IF SF R SLCT
      puts ("lzw  #{io.read(1).unpack("h2")[0].reverse}") ## LZW
      while true do
        size = io.read(1)
        if size.unpack("h2")[0].reverse.hex == 0
          flag = true
          break
        end
        puts ("size #{size.unpack("h2")[0].reverse.hex}") ## image h
        (size.unpack("h2")[0].reverse.hex).times{
          print("#{io.read(1).unpack("h2")[0].reverse}") ## image
        }
        puts
      end
      sum+=1
      puts "sum: #{sum}"
    end
  end
end
