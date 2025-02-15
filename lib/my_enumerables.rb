module Enumerable
  # Your code goes here
  def my_map
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array
  end
  
  def my_all?
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array.uniq.size <= 1 ? true : false
  end
  

  def my_any?
    my_each do |item|
      if block_given?
        return true if yield(item)
      else
        return true if item
      end
    end
    false
  end

  def my_count
    new_array = []
    if !(block_given?)
      return self.size
    else
      for item in self
        if yield(item) == true
          new_array << item
        end
      end
    end
    return new_array.length

  end

  def my_each_with_index
    i = 0
    for item in self
      yield(item, i) if block_given?
      i += 1
    end
  end

  def my_inject(initial = nil)
    if initial.nil? && !block_given?
      initial = first
      arr = self.drop(1)
    else
      arr = self
    end
    
    memo = initial
    
    arr.each do |element|
      if block_given?
        memo = yield(memo, element)
      else
        memo = memo.send(initial, element)
      end
    end
    
    memo
  end
end
    



# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here 
  def my_each
    for item in self
      yield(item) if block_given? # Yield each element to the block
    end
    self # Return the original array
  end
end