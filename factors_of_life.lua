function factors_of( number )
  local factors = {}
  for possible_factor=1, math.sqrt( number ), 1 do
    local remainder = number % possible_factor
    
    if remainder == 0 then
      local factor, factor_pair = possible_factor, number / possible_factor
      table.insert( factors, factor )
      
      if factor ~= factor_pair then
        table.insert( factors, factor_pair )
      end
    end
  end
  
  table.sort( factors )
  return factors
end

print( "Count", "Factors" )
table.foreach( factors_of( 1001 ), --[[Inline comments omg]] print )
