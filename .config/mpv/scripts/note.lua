local mp = require("mp")
local utils = require("mp.utils")

local function get_path_info()
  -- react path
  local r_path = "/home/kawsar/Documents/Obsidian Vault/Programming/JAVASCRIPT/ReactJS/"
  -- absolute path of video
  local a_path = utils.join_path(utils.getcwd(), mp.get_property("stream-path"))
  -- chapter name
  local c_name = a_path:match("/[^/]+/[^/]+$"):match("[^/]+")
  -- topic name
  local t_name = mp.get_property("filename/no-ext")
  -- base path of note folder
  local b_path = r_path..c_name.."/"

  return b_path, t_name
end

local function note_subtitle()
  local b_path, t_name = get_path_info()
  local subtitle = mp.get_property("sub-text"):gsub("\"", "\\%0")
  mp.commandv(
    "run", "/usr/bin/dash", "-c",
    "printf \""..subtitle.."\" >> '"..b_path..t_name..".md'"
  )
end

local function note_code()
  local b_path, t_name = get_path_info()

  mp.commandv(
    "run", "/usr/bin/dash", "-c",
    "note-code.sh '"..b_path.."' '"..t_name.."'"
  )
end
local function note_image()
  local b_path, t_name = get_path_info()
  local t_index = string.sub(t_name, 0, 2)
  local img_file = t_index.."_imgshot_"..os.date('%Y-%m-%d_%H:%M:%S')..".jpg"
  mp.commandv('screenshot-to-file', b_path.."images/"..img_file, 'video')
  local command = 'echo "\\n![image shot](./images/'..img_file..')" >> "'..b_path..t_name..'.md"'
  mp.commandv('run', '/usr/bin/dash', '-c', command)
end

mp.add_key_binding("Shift+n", "note-subtitle", note_subtitle)
mp.add_key_binding("Ctrl+n" , "note-code"    , note_code    )
mp.add_key_binding("Alt+n"  , "note-image"   , note_image   )
