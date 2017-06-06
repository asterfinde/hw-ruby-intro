# Part 1

def sum(arr)
  total = 0
  
  if arr.length == 0
    return total
  else
    arr.each do |n|
      total += n
    end
  end  
  
  return total
end

def max_2_sum(arr)
  if arr.length == 0
    return arr.length
  elsif arr.length == 1	
    return arr[0]
  else
	  arr = arr.sort()
	  return arr[arr.length-1] + arr[arr.length-2]
  end
end

def sum_to_n?(arr, n)
  result = false
  
  if arr.length <= 1
    return result
  else
    until result do
      first = arr.shift
      
      if first == nil
        break
      elsif arr.any? { |number| first + number == n }
        result = true
        break
      end
    end
		
    return result
  end  
end

# Part 2

def hello(name)
	"Hello, " << name
end

def starts_with_consonant?(s)
	if (s =~ /\A(?=[^aeiou])(?=[a-z])/i) == 0 
    return true
  else
    return false
  end 
end

def binary_multiple_of_4?(s)
	exponent = 0
	number_dec = 0
	
	if s.length == 0
	  return false
	end
	
	s.each_char { |c|
		if c != "0" and c!= "1" 
			return false
		end	
	} 
	
  exponent = s.length - 1

  s.each_char { |c| 
    number_dec += (2 ** exponent) * c.to_i
    exponent -= 1
  }
    
  return (number_dec % 4) == 0
end

# Part 3

class BookInStock
	# Define default getter methods, but not setter methods.  
  attr_reader :isbn, :price
	
  # When someone tries to set a isbn, enforce rules about it.  
  def isbn=(isbn)  
		if isbn == nil or isbn.size == 0 
      raise ArgumentError.new('ISBN empty is not allowed.')  
		end 
		
		@isbn = isbn	
  end  
  
  # When someone tries to set a price, enforce rules about it.  
  def price=(price)  
    if price <= 0
      raise ArgumentError.new('Price less or equal to zero is not allowed.')  
    end  
		
		@price = price
  end

	# Delegate to the setter methods instead of setting the instance  
  # variables directly.  
  def initialize(isbn, price)  
    self.isbn = isbn  
    self.price = price  
  end

	def price_as_string	
		'$' << '%.2f' % price.to_s
	end
end

