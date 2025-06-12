print("Lua is working!")

-- This is a comment in Lua



-- This is a global variable
globalVariable = "I am a global variable"
-- This is a local variable
local localVariable = "I am a local variable"



-- Data types in Lua
local numberVariable = 42 -- Number
local stringVariable = "Hello, Lua!" -- String
local miltilineStringVariable = [[
This is a
multi-line string
]]
local booleanVariable, booleanVariable2 = true, false -- Boolean
local nothingVariable = nil -- Nil
-- Tables in Lua (similar to arrays or dictionaries)
local tableVariable = {1, 2, 3, "four", "five"} -- Table with mixed types
local tableVariable2 = {key1 = "value1", key2 = "value2"}
local tableVariable3 = {
	key1 = "value1",
	key2 = "value2",
	nestedTable = {1, 2, 3},
	["key with spaces"] = "value with spaces",
	[function() end] = "value for dynamic key"
} -- Anything can be a key in Lua tables, including numbers and strings
print(tableVariable3.literal_key) -- Accessing keys in a table
print(tableVariable3["key with spaces"]) -- Accessing keys with spaces
print(tableVariable3[function() end]) -- Accessing keys with functions as keys
-- NB Lua tables are 1-indexed, meaning the first element is at index 1



-- Functions in Lua
local function add(a, b)
	return a + b
end

local greet = function(name)
	return "Hello, " .. name .. "!"
end

local highOrderFunction = function(value)
	return function(anotherValue)
		return value + anotherValue
	end
end
local result = highOrderFunction(10)(5) -- Calls the inner function with 5

-- for loops in Lua

local dummyTable = {1, 2, 3, 4, 5}
for i = 1, #dummyTable do
	print("Element at index " .. i .. ": " .. dummyTable[i])
end

for index, value in ipairs(dummyTable) do
	print("Element at index " .. index .. ": " .. value)
end

local dummyTable2 = {key1 = "value1", key2 = "value2"}
for key, value in pairs(dummyTable2) do
	print("Key: " .. key .. ", Value: " .. value)
end

-- while loops in Lua
local count = 1
while count <= 5 do
	print("Count is: " .. count)
	count = count + 1
end
-- repeat-until loops in Lua
local repeatCount = 1
repeat
	print("Repeat count is: " .. repeatCount)
	repeatCount = repeatCount + 1
until repeatCount > 5



-- Error handling in Lua
local function safeDivide(a, b)
	if b == 0 then
		error("Division by zero is not allowed.")
	else
		return a / b
	end
end



-- Conditional statements in Lua
local numberToCheck = 10
if numberToCheck > 0 then
	print("The number is positive.")
elseif numberToCheck < 0 then
	print("The number is negative.")
else
	print("The number is zero.")
end



-- String manipulation in Lua
local str = "Hello, Lua!"
local upperStr = string.upper(str) -- Convert to uppercase
local lowerStr = string.lower(str) -- Convert to lowercase
local subStr = string.sub(str, 1, 5) -- Get substring from index 1 to 5
local findStr = string.find(str, "Lua") -- Find substring
local replaceStr = string.gsub(str, "Lua", "World") -- Replace substring

-- Modules
-- foo.lua
local M = {}
M.greet = function(name)
	return "Hello, " .. name .. " from foo module!"
end
return M
-- main.lua
local foo = require("foo") -- Importing the foo module
print(foo.greet("Lua User")) -- Using the function from the foo module


-- Taking many arguments
local function printArgs(...)
	local args = {...} -- Collect all arguments into a table
	for i, v in ipairs(args) do
		print("Argument " .. i .. ": " .. v)
	end
	return unpack(args) -- Return all arguments as separate values
end
printArgs("arg1", "arg2", "arg3") -- Calling the function with multiple arguments
-- Using the `...` syntax to take variable number of arguments
-- This allows the function to accept any number of arguments and process them as needed.


-- Metatables in Lua
local vector = {}
vector.__add = function(left, right)
	return setmetatable({
		x = left[x] + right[x],
		y = left[y] + right[y]
	}, vector)
end
local v1 = setmetatable({x=2, y=3}, myTable) -- Set the metatable for v1
local v2 = setmetatable({x=5, y=7}, myTable) -- Set the metatable for v2
local v3 = v1 + v2 -- Uses the __add metamethod defined in vector

