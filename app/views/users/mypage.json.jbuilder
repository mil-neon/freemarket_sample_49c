json.buy_now do
  json.array! @products_buy_now do |product_buy_now|
    json.id product_buy_now.id
    json.name product_buy_now.name
    json.image product_buy_now.images.first.image.url
  end
end

json.buy_close do
  json.array! @products_buy_close do |product_buy_close|
    json.id product_buy_close.id
    json.name product_buy_close.name
    json.image product_buy_close.images.first.image.url
  end
end

json.sell_now do
  json.array! @products_sell_now do |product_sell_now|
    json.id product_sell_now.id
    json.name product_sell_now.name
    json.image product_sell_now.images.first.image.url
  end
end

json.sell_close do
  json.array! @products_sell_close do |product_sell_close|
    json.id product_sell_close.id
    json.name product_sell_close.name
    json.image product_sell_close.images.first.image.url
  end
end
