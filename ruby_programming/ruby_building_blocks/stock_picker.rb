
def stock_picker(stock_prices)
	profit = 0
	buy = 0
	sell = 0

	stock_prices.each do |price|
		(stock_prices.index(price)...stock_prices.length).each do |temp_index|
			s = stock_prices[temp_index]
			b = price

			if s-b > profit then
				buy = stock_prices.index(b)
				sell = stock_prices.index(s)
				profit = s-b
			end

		end
	end
	return [buy, sell]
end



stocks = [17,3,6,9,15,8,6,1,10]
p stock_picker(stocks)