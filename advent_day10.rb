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


hash = {
  square: 0,
  parenthesis: 0,
  curly: 0,
  lessthan: 0,
}

example = "{([(<{}[<>[]}>{[]{[(<()>".split("")
count = 0
corrupt = false
while count < example.length && corrupt = false
  if char == "]"
    count2 = index
    char_count = -1
    while count2 > 0 do
      if example[count2] == "["
        char_count += 1
        if char_count == 0
          count2 = 0
        end
      elsif example[count2] == "]"
        char_count -= 1
      end
      count2 -= 1
    end
  end
  count += 1
end




# example.each_with_index do |char, index|
#   if char == "]" || char == ")" || char == "}" || char == ">"
#     count = index
#     while count > 0 do
#       # Go back to where this char closes and check if there are any unclosed things inside
#     end
#   end
# end
