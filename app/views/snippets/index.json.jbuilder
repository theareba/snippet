json.array!(@snippets) do |snippet|
  json.extract! snippet, :id, :content, :private
  json.url snippet_url(snippet, format: :json)
end
