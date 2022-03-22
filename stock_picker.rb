# Stock picker, by Logan Hosoda

# Given the array, determine the best day to buy, and the best day
# to sell. The 'best' pair is the pair that will net the most profit.

# Determines the net yield for every possible buy/sell pairing.
# Stores the results in an array, containing a hash, that contains
# Another array for it's key, and an integer for its value.
def stock_pair(prices)
	counter_x = 0
	counter_y = 0
	price_matrix = []
	
	until counter_x == (prices.length - 2) do
		if counter_y == (prices.length - 1)
			counter_x += 1
			counter_y = counter_x
		end
		net_gain = prices[counter_y + 1] - prices[counter_x]
		price_matrix.push({[counter_x, counter_y + 1] => net_gain})
		counter_y += 1
	end
	
	price_matrix
end

# Determines the best buy/sell pair based on the most net profit.
def stock_picker(price_per_day)
	price_matrix = stock_pair(price_per_day)
	counter = 0
	best_pair = price_matrix[0]
	while counter < price_matrix.length do
		if best_pair.values[0] < price_matrix[counter].values[0]
			best_pair = price_matrix[counter]
		end
		counter += 1
	end
	best_pair
end

stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10, 2, 5, 17, 24, 12, 7, 1]

best_days = stock_picker(stock_prices)
puts "--- Stock Picker, By Logan Hosoda ---"
puts "Stock prices for each day: #{stock_prices}"
puts "The best days to buy/sell: #{best_days.keys[0]}"
puts "This would yield a net profit of: $#{best_days.values[0]}"