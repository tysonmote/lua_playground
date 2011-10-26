-- Playing with file i/o. Doesn't actually parse a CSV, obviously.

-- Print a table's contents
function inspect_table( table )
  for k, v in pairs( table ) do
    if type( v ) == "table" then
      for kk, vv in pairs( v ) do
        print( "", vv )
      end
    else
      print( k, v )
    end
  end
end

-- Taken from http://lua-users.org/lists/lua-l/2006-12/msg00414.html
function string:split(pat)
  local st, g = 1, self:gmatch("()("..pat..")")
  local function getter(self, segs, seps, sep, cap1, ...)
    st = sep and seps + #sep
    return self:sub(segs, (seps or 0) - 1), cap1 or sep, ...
  end
  local function splitter(self)
    if st then return getter(self, st, g()) end
  end
  return splitter, self
end

-- Returns true if the file exists and can be read from
function file_readable( path )
  local file = io.open( path )
  if file then file:close() end
  return file ~= nil
end

-- Returns an array of arrays of strings
function read_csv( path )
  local lines = {}
  
  -- Read each line and add it to the table
  for line in io.lines( path ) do
    inspect_table( line.split( "," ) )
    table.insert( lines, line.split( "," ) )
  end
  
  return lines
end

print( "Readable:" )
print( file_readable( "simple.csv" ) )
print()
print( "Contents:" )
inspect_table( read_csv( "simple.csv" ) )
