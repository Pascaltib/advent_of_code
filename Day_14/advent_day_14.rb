template = 'NNCB'.chars
data = File.new('data.txt').read
hash = {}
data.each_line do |line|
  temp = line.gsub("\n", '').split(' -> ')
  hash[temp[0]] = temp[1]
end

hash_copy_first_val = {}
hash_copy_no_first_val = {}
hash.each do |key, value|
  hash_copy_first_val[key] = key[0] + hash[key[0]+value] + value + hash[value+key[1]] + key[1]
  hash_copy_no_first_val[key] = hash[key[0]+value] + value + hash[value+key[1]] + key[1]
end


day = 0
20.times do
  p day
  insert = ""
  length = template.length
  template.each_with_index do |char, index|
    if index < length-1
      key = char + template[index + 1]
      if index == 0
        insert += hash_copy_first_val[key]
      else
        insert += hash_copy_no_first_val[key]
      end
    end
  end
  template = insert.chars
  day+= 2
end
final_template_hash = {}
template.each do |char|
  final_template_hash[char] = 0 unless final_template_hash[char]
  final_template_hash[char] += 1
end
p final_template_hash
max = final_template_hash.max_by { |_k, v| v }[1]
min = final_template_hash.min_by { |_k, v| v }[1]
p max - min
