=begin

Add a `squared_euclidean_distance` method to the `Hash` class that takes another `Hash` as a parameter and calculates the euclidean distance with another Hash. For example, a Euclidean distance between `{ :x => 1, :y => 2 }` and `{ :x => 3, :y => 4 }` is `(1 - 3)^2 + (2 - 4)^2`.

    {}.squared_euclidean_distance({}) # 0
    { :x => 1, :y => 2 }.squared_euclidean_distance({ :z => 3 }) # 14
    { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :z => 5 }) # 30
    { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :x => 5 }) # 10
    { :x => 10, :y => 20 }.squared_euclidean_distance({}) # 500
    {}.squared_euclidean_distance({ :x => 10, :y => 20 }) # 500

=end

class Hash

  def self.squared_euclidean_distance(lhs, rhs)

=begin 
	 # this works, no inject
	 combined_hash = lhs.merge(rhs) {|key, lhs_val, rhs_val| (lhs_val - rhs_val) }
	 distance = 0;
     combined_hash.values.each do |i| 
     	distance += (i ** 2) 
     end
     distance
=end

     # For keys that don't exist in both hashes, it seems to just take the one value, rather then executing the block.
     # Still can't figure out why this doesn't work. Should ideally square the difference and place it back in the new hash
     # combined_hash = lhs.merge(rhs) {|key, lhs_val, rhs_val| (lhs_val - rhs_val) ** 2 }
     # combined_hash.values.inject {|sum, element| sum + element }
     
     # try and fix that by moving the exponent operation into the inject execution
     # combined_hash = lhs.merge(rhs) {|key, lhs_val, rhs_val| (lhs_val - rhs_val) }
     # combined_hash.values.inject {|result, element| result + (element ** 2) } 		# still not working, outputting 115 instead of 145 for TEST
	 
	 # It wasn't working cause I didn't supply a value for the inject method, so it was using the first element as the first result value, 
	 # and therefore giving me 6 + (-3)^2 + (10)^2 = 115
     # combined_hash = lhs.merge(rhs) {|key, lhs_val, rhs_val| (lhs_val - rhs_val) }
     # combined_hash.values.inject(0) {|result, element| result + (element ** 2) }
     
     # can I combine that into 1 line? AIIGHT!!
     lhs.merge(rhs) {|key, lhs_val, rhs_val| (lhs_val - rhs_val) }.values.inject(0) {|result, element| result + (element ** 2) }
  end

  def squared_euclidean_distance(rhs)
    Hash.squared_euclidean_distance(self, rhs)
  end

end


# TEST
# { :x => 10, :y => 20, :z => 13 }.squared_euclidean_distance({ :x => 4, :y => 23, :z => 3 }) #145

raise "invalid distance between two different hashes" unless 14 == ( { :x => 1, :y => 2 }.squared_euclidean_distance({ :z => 3 }) )
raise "invalid distance between empty hashes" unless 0 == ( {}.squared_euclidean_distance({}) )
raise "invalid distance between two overlapping hashes" unless 10 == ( { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :x => 5 }) )
raise "invalid distance between two partially overlapping hashes" unless 30 == ( { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :z => 5 }) )
raise "invalid distance between two partially overlapping hashes with keys other than :x, :y and :z" unless 30 == ( { :a => 2, :b => 3 }.squared_euclidean_distance({ :b => 4, :c => 5 }) )
raise "invalid distance between a hash and an empty hash" unless 500 == ( { :x => 10, :y => 20 }.squared_euclidean_distance({}) )
raise "invalid distance between an empty hash and a hash" unless 500 == ( {}.squared_euclidean_distance({ :x => 10, :y => 20 }) )
puts "correct results in squared_euclidean_distance"
