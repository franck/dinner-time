json.array! @recipes do |recipe|
  json.extract! recipe, :name
end
