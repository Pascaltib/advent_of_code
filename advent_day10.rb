data = "[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]"

arr = []
data.each_line{ |line| arr << line.gsub("\n", "").split("")}

def reverse_symbol(symbol)
  case symbol
  when "]"
    return "["
  when ")"
    return "("
  when "}"
    return "{"
  when ">"
    return "<"
  end
end

hash = {first: 0, second: 0, third: 0, fourth: 0}

arr.each do |line|
  opening_tags = []
  count = 0
  corrupt = nil
  while count < line.length do
    if line[count] == "[" || line[count] == "(" || line[count] == "{" || line[count] == "<"
      opening_tags << line[count]
    elsif line[count] == "]" || line[count] == ")" || line[count] == "}" || line[count] == ">"
      if opening_tags.last == reverse_symbol(line[count])
        opening_tags.pop
      else
        corrupt = line[count]
        count = 10000
      end
    end
  count += 1
  end
  if corrupt
    case corrupt
    when "]"
      hash[:first] += 1
    when ")"
      hash[:second] += 1
    when "}"
      hash[:third] += 1
    when ">"
      hash[:fourth] += 1
    end
  end
end
p hash[:first]*57 + hash[:second]*3 + hash[:third]*1197 + hash[:fourth]*25137
