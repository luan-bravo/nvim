--- This tutorial demonstrates how to use EmmyLua/LuaLS-style annotations (luadocs)
--- to add type information to your Lua code. This is incredibly useful for
--- static analysis, autocompletion, and overall code clarity.

---
--- Basic Types
---

--- @type string
local name = "Lua"

--- @type number
local version = 5.4

--- @type boolean
local is_awesome = true

---
--- Simple Function Documentation
---

--- Adds two numbers together.
--- @param a number The first number.
--- @param b number The second number.
--- @return number The sum of the two numbers.
local function add(a, b)
    return a + b
end

---
--- Documenting Tables (as Arrays and Maps)
---

--- @type string[]
local features = { "Simple", "Powerful", "Embeddable" }

--- You can also use table<T> for arrays.
--- @type table<string>
local alternative_features = { "Fast", "Lightweight" }

--- For key-value maps (dictionaries), you define the key and value types.
--- @type table<string, number>
local project_lines = {
    ["core.lua"] = 500,
    ["utils.lua"] = 250,
}

---
--- Documenting Tables as Structs/Records
---

--- You can define the "shape" of a table directly.
--- @param user { name: string, id: number, is_active: boolean }
local function display_user(user)
    if user.is_active then
        print("User #" .. user.id .. ": " .. user.name)
    end
end

display_user({ name = "Alex", id = 101, is_active = true })

---
--- Reusable Types with @class
---

--- For more complex or reusable table shapes, define a class.
--- This is the most common and powerful feature.
--- @class Player
--- @field name string The name of the player.
--- @field score number The player's current score.
--- @field inventory string[] A list of item names in the player's inventory.

--- Creates a new player object.
--- @param name string The name for the new player.
--- @return Player A new player object.
local function create_player(name)
    --- @type Player
    local new_player = {
        name = name,
        score = 0,
        inventory = {},
    }
    return new_player
end

--- @type Player
local player_one = create_player("Hero")
player_one.score = 100
table.insert(player_one.inventory, "Sword")

---
--- Optional and Union Types
---

--- A function that might return a string or nil.
--- The `?` after the type indicates it's optional (can be nil).
--- @return string?
local function get_data()
    if math.random() > 0.5 then
        return "Here is your data!"
    end
    return nil
end

--- A function that accepts multiple types for a parameter.
--- Use the pipe `|` character to denote a union type.
--- @param id string | number
--- @return string
local function format_id(id)
    return "ID-" .. tostring(id)
end

---
--- Function Types (Callbacks)
---

--- @alias NumberOperation fun(a: number, b: number): number

--- Performs an operation on two numbers using a callback.
--- @param op NumberOperation The function to execute.
--- @param x number The first number.
--- @param y number The second number.
--- @return number The result of the operation.
local function calculate(op, x, y)
    return op(x, y)
end

local result = calculate(add, 10, 5)
print("Calculation result: " .. result)

---
--- Generics
---

--- A generic function that returns the first item of any array.
--- @generic T
--- @param items T[]
--- @return T?
local function get_first(items)
    return items[1]
end

--- @type string?
local first_feature = get_first(features)

--- @type number?
local first_number = get_first({ 1, 2, 3 })

print("First feature: " .. (first_feature or "none"))
print("First number: " .. (first_number or "none"))

--- By using these annotations, tools like LuaLS (the language server for Lua)
--- can provide excellent autocompletion, type checking, and error detection,
--- making your development experience much smoother.
