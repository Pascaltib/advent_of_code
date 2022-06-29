# frozen_string_literal: false

@infinity = 100

def shortest_path_wg(matrix, init = 0)
  vertex = []
  v = matrix[0].length
  dist = []
  prev = []

  v.times do |i|
    dist << @infinity
    prev << -1
    vertex << i
  end

  dist[init] = 0

  while vertex.length.positive?

    u = vertex.shift

    matrix[u].each_with_index do |i, j|
      next if i.zero?

      alt =  dist[u] + i
      if alt < dist[j]
        dist[j] = alt
        prev[j] = i
      end
    end
  end

  dist
end

p shortest_path_wg(
  [
    [0, 3, 5],
    [3, 0, 1],
    [5, 1, 0]
  ]
)
# => [0, 3, 4]

p shortest_path_wg(
  [
    [0, 0, 1, 3, 0, 0],
    [0, 0, 0, 5, 0, 0],
    [1, 0, 0, 2, 1, 4],
    [3, 5, 2, 0, 7, 0],
    [0, 0, 1, 7, 0, 2],
    [0, 0, 4, 0, 2, 0]
  ]
)
# => [0, 8, 1, 3, 2, 4]

p shortest_path_wg(
  [
    [0, 3, 6, 0, 0, 10],
    [3, 0, 4, 1, 0, 0],
    [6, 4, 0, 3, 5, 4],
    [0, 1, 3, 0, 2, 0],
    [0, 0, 5, 2, 0, 3],
    [10, 0, 4, 0, 3, 0]
  ]
)
# => [0, 3, 6, 4, 6, 9]

p shortest_path_wg(
  [
    [0, 3, 6, 0, 0, 9, 4],
    [3, 0, 4, 1, 0, 0, 0],
    [6, 4, 0, 3, 5, 4, 1],
    [0, 1, 3, 0, 2, 0, 0],
    [0, 0, 5, 2, 0, 3, 0],
    [9, 0, 4, 0, 3, 0, 3],
    [4, 0, 1, 0, 0, 3, 0]
  ]
)
# => [0, 3, 5, 4, 6, 7, 4]
