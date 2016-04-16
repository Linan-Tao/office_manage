json.array!(@boards) do |board|
  json.extract! board, :id, :code, :name
  json.url board_url(board, format: :json)
end
