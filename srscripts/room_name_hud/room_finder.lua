
local Configuration = {
     RoomNameOpacity = 4, -- Opacity of the room name (Default: 4)
     RoomNameScale = 0.7, -- Scale of the room name (Defualt: 1)
     RoomNameScaleMaximized = 1.4, -- Scale of the room name when maximized (using Tab) (Default: 1.4)
     ShowNonStageAPIRoomNames = true, -- Non Stage API names should appear or not (Default: true)
}



local mod = SRMod
local game = Game()

-- Add basic info about mod
local modname = "Room Name HUD";
local modver = "v1.0";

-- Add a global scope so people can check their own stuff here
RNHMod = mod;



-- Log Reasons
local LogReason = {
     INFO = 0,
     WARNING = 1,
     ERROR = 2
}

-- Vector Basics
local Vec = {
     Zero = Vector(0,0)
}




function ConsoleLog(text, type)
     tostring(text)
     if type == nil or type == LogReason.INFO then
          print("["..modname.."] [i] "..text);
          Isaac.DebugString("["..modname.."] [i] "..text)
     elseif type == LogReason.WARNING then
          print("["..modname.."] [!!!] "..text);
          Isaac.DebugString("["..modname.."] [!!!] "..text)
     elseif type == LogReason.ERROR then
          print("["..modname.."] [ERR]"..text);
          Isaac.DebugString("["..modname.."] [ERR] "..text)
     end
end


function mod:GetScreenBottomRight()
     local room = game:GetRoom()
     return room:GetRenderSurfaceTopLeft() * 2 + Vector(442,286);
end

function mod:GetScreenCenterPosition()
     return mod:GetScreenBottomRight() / 2;
end

function mod:Lerp(first,second,percent)
	return (first + (second - first)*percent)
end


-- Mod Startup
--ConsoleLog("Version "..modver.." loaded sucessfully!");
if not StageAPI then
     ConsoleLog("StageAPI not found! Ignoring StageAPI stuff", LogReason.WARNING);
--else
     --ConsoleLog("StageAPI found! Enjoy!");
end

if FiendFolio then
     ConsoleLog("Fiend Folio found! Ignoring this mod", LogReason.WARNING);
end




local font = Font();
font:Load("font/pftempestasevencondensed.fnt")
local tabHeldAlphaTimer = 0
local tabHeldScaleTimer = 0

-- Render callback, so it writes onto screen
mod:AddCallback(ModCallbacks.MC_POST_RENDER, function()

     -- Check first if Fiend Folio already exists, and if not, execute stuff
     if not FiendFolio then
          local roomDescriptorData = game:GetLevel():GetCurrentRoomDesc().Data;
          local center = mod:GetScreenCenterPosition();
          local br = mod:GetScreenBottomRight();
          local currentRoom = nil;
          local scale = Configuration.RoomNameScale;

          local alpha = (Configuration.RoomNameOpacity + 1) * 0.1

          local tabHeld = Input.IsActionPressed(ButtonAction.ACTION_MAP, Isaac.GetPlayer(0).ControllerIndex)
          if tabHeld then
               tabHeldAlphaTimer = math.min(tabHeldAlphaTimer + 1, 30)
               tabHeldScaleTimer = math.min(tabHeldScaleTimer + 1, 10)
          else
               tabHeldAlphaTimer = math.max(tabHeldAlphaTimer - 1, 0)
               tabHeldScaleTimer = math.max(tabHeldScaleTimer - 1, 0)
          end

          if tabHeldScaleTimer > 0 then
               local percent = 1 - ((1 - (tabHeldScaleTimer / 10)) ^ 2)
               scale = mod:Lerp(scale, Configuration.RoomNameScaleMaximized, percent)
          end

          if tabHeldAlphaTimer > 0 then
               alpha = mod:Lerp(alpha, 1, tabHeldAlphaTimer / 30)
          end

          -- Do actual Stage API stuff        
          if StageAPI then
               -- Get current StageAPI room
               currentRoom = StageAPI.GetCurrentRoom()
          end

          -- Writting the actual text that will be displayed
          local text = ""
          if currentRoom and currentRoom.Layout then
               text = text .. tostring(currentRoom.Layout.Variant) .. " " .. currentRoom.Layout.Name
          else
               if Configuration.ShowNonStageAPIRoomNames then
                    text = text .. roomDescriptorData.Variant .. " " .. roomDescriptorData.Name
               end
          end

          local bcenter = Vector(center.X, br.Y - 13 * scale);
          local size = (font:GetStringWidth(text) * scale)

          if game:GetRoom():GetAliveBossesCount() > 0 then
               bcenter = bcenter + Vector(0, -20);
          end

          -- Displaying the name
          font:DrawStringScaled(text, bcenter.X - (size / 2), bcenter.Y, scale, scale, KColor(1,1,1,alpha), 0, false)
     end
end)