template = 'NNCB'.chars
data = File.new('data.txt').read
hash = {}
data.each_line do |line|
  temp = line.gsub("\n", '').split(' -> ')
  hash[temp[0]] = temp[1]
end


day_count = 0
40.times do
  insert = []
  template.each_with_index do |char, index|
    if template[index + 1]
      key = char + template[index + 1]
      if index > 0
        insert << hash[key][1]
        insert << hash[key][2]
      else
        insert << hash[key][0]
        insert << hash[key][1]
        insert << hash[key][2]
      end
    end
  end
  template = insert
  p day_count
  day_count += 1
end

final_template_hash = {}
template.each do |char|
  final_template_hash[char] = 0 unless final_template_hash[char]
  final_template_hash[char] += 1
end
max = final_template_hash.max_by { |_k, v| v }[1]
min = final_template_hash.min_by { |_k, v| v }[1]
p max - min
