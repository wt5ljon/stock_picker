# implements the Stock Picker challenge
def stock_picker(array)
	sub_array = []
	best = { :buy_day  => 0, :buy_price  => 0,
	         :sell_day => 0, :sell_price => 0, :diff => 0 }
	array.each_with_index do |price, i|
		sub_array = array[i..-1]
		# consider each array entry to be best buy date until all are considered
		if sub_array.length > 1
			best_buy_price = price
			best_buy_day = i
			best_sell_price = sub_array.max
			best_sell_day = i + sub_array.index(best_sell_price)
			diff = best_sell_price - best_buy_price
			# if the difference is better, then save all info to hash
			if diff > best[:diff]
				best[:diff] = diff
				best[:buy_day] = best_buy_day
				best[:buy_price] = best_buy_price
				best[:sell_day] = best_sell_day
				best[:sell_price] = best_sell_price
			end
		end
	end
	return [best[:buy_day],best[:sell_day],best[:diff]]
end

stock_prices = [17,3,6,9,15,8,6,1,10]
best = stock_picker(stock_prices)
puts "Best day to buy:  #{best[0]}"
puts "Best day to sell: #{best[1]}"
puts "Per stock profit: $#{best[2]}.00"