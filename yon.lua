function valexit(val)
  if string.lower(val) == "y" then
    os.exit(0)
  else
    os.exit(1)
  end
end

function main()
  local opts = {}

  if #arg == 0 then
    arg = {"y", "N"}
  end

  io.write("Pick one: " .. (table.concat(arg, '/')) .. ' ')

  local picker = string.lower(io.read(1))

  local default = nil

  for ii, word in ipairs(arg) do
    local key = string.lower(string.sub(word, 1, 1))
    if picker == key then
      valexit(word)
    end

    -- this is a weird way of checking for capitals
    if not default and key ~= string.sub(word, 1, 1) then
      default = word
    end
  end

  if picker == '\n' then
    if default then
      valexit(default)
    else
      print("No default set, try again")
      main()
    end
  else
    io.stderr:write("Unknown choice: " .. picker .. "\n")
    os.exit(1)
  end
end

main()
