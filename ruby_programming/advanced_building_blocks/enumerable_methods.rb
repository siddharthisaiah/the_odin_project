#!/usr/bin/env ruby

module Enumerable

	def my_each
		for item in self
			yield(item)
		end
	end

	def my_each_with_index
		for item in self
			yield(item, self.find_index(item))
		end	
	end

	def my_select
		result = Array.new

		for item in self
			if yield(item)
				result.push(item)
			end
		end
		return result
	end

	def my_all?
		if block_given?
			for item in self
				unless yield(item)
					return false
				end
			end
		end
		return true
	end

	def my_any?	
		if block_given?
			for item in self
				if yield(item)
					return true
				end
			end
		end
		return false
	end

	def my_none?		
		if block_given?
			for item in self
				if yield(item)
					return false
				end
			end
		else
			return false
		end

		return true
	end

	def my_count
		count = 0
		if block_given?
			for item in self
				if yield(item)
					count += 1
				end
			end
		end
		return count
	end

	def my_map
		result = Array.new

		return enum_for(:my_map) unless block_given?
		
		if block_given?
			for item in self
				result.push(yield(item))
			end
			return result
		end
	end

	def first
		found = nil
		each do |element|
			found = element
			break
		end
		return found
	end

# from https://mauricio.github.io/2015/01/12/implementing-enumerable-in-ruby.html
	def my_inject(acumulator = nil, operation = nil, &block)

		if acumulator.nil? && operation.nil? && block.nil?
			raise ArgumentError, "You must provide an operation or a block"
		end

		if operation && block
			raise ArgumentError, "You must provide either an operation or a block, not both"
		end

		if operation.nil? && block.nil?
			operation = acumulator
			acumulator = nil
			
		end

		block = case operation
		when Symbol
			lambda { |acc, value| acc.send(operation, value)}
		when nil
			block
		else
			raise ArgumentError, "The operation provided must be a Symbol"
		end

		if acumulator.nil?
			ignore_first = true
			acumulator = first
		end

		index = 0
		
		each do |item|
			unless ignore_first && index == 0
				acumulator = block.call(acumulator, item)
			end
			index += 1
		end
		acumulator
	end



end