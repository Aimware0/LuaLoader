-- Scraped by chicken
-- Author: stacky
-- Title [Release] Disable Reset & Delete buttons
-- Forum link https://aimware.net/forum/thread/131191

local ENABLE = gui.Button( gui.Reference( "Settings", "Advanced", "Manage Advanced Settings" ), "Enable Buttons", function()
  gui.Reference( "Settings", "Configurations", "Manage Configurations", "Delete" ):SetDisabled(false)
  gui.Reference( "Settings", "Configurations", "Manage Configurations", "Reset" ):SetDisabled(false)
 end )
 
 local DISABLE = gui.Button( gui.Reference( "Settings", "Advanced", "Manage Advanced Settings" ), "Disable Buttons", function()
  gui.Reference( "Settings", "Configurations", "Manage Configurations", "Delete" ):SetDisabled(true)
  gui.Reference( "Settings", "Configurations", "Manage Configurations", "Reset" ):SetDisabled(true)
 end )
 
 