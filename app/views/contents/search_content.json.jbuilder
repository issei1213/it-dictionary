json.array! @contents do |content|
  json.id content.id
  json.title content.title
  json.content content.content
  json.name content.user.name
  json.tag content.tag_list
end
