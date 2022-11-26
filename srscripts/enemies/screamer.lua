local mod = SRMod


local screamerscream = Isaac.GetSoundIdByName("Screamer Scream")
local blabla = Isaac.GetSoundIdByName("Bla Bla")


local screamerrng = RNG()

screamerrng:SetSeed(Random(), 1)

screamerangle = 0
EterepCustomAngle = 0

function ScreamerChasePlayer(speed, npc, slide, count)
	local targetisclosetowalls = (npc:GetPlayerTarget().Position.X > Game():GetRoom():GetBottomRightPos().X - 24 or npc:GetPlayerTarget().Position.Y > Game():GetRoom():GetBottomRightPos().Y - 24 or npc:GetPlayerTarget().Position.Y < Game():GetRoom():GetTopLeftPos().Y + 24 or npc:GetPlayerTarget().Position.X < Game():GetRoom():GetTopLeftPos().X + 24)
if npc:GetPlayerTarget().Position:Distance(npc.Position) < 55 and targetisclosetowalls == true and not npc:HasEntityFlags(1<<9) and not npc:HasEntityFlags(1<<11) and not npc:HasEntityFlags(1<<24) then
npc.Velocity = npc.Velocity * 0.9 + (npc:GetPlayerTarget().Position - npc.Position):Resized(1.3) * speed * 0.53
end
if npc:GetPlayerTarget().Position:Distance(npc.Position) < 55 and targetisclosetowalls == false and Game():GetRoom():CheckLine(npc.Position, npc:GetPlayerTarget().Position, 0, 0, false, false) and not npc:HasEntityFlags(1<<9) and not npc:HasEntityFlags(1<<11) and not npc:HasEntityFlags(1<<24) then
npc.Velocity = npc.Velocity * 0.9 + (npc:GetPlayerTarget().Position - npc.Position):Resized(1.3) * speed * 0.53
end
if npc:GetPlayerTarget().Position:Distance(npc.Position) >= 55 or (npc:GetPlayerTarget().Position:Distance(npc.Position) < 55 and targetisclosetowalls == false and not Game():GetRoom():CheckLine(npc.Position, npc:GetPlayerTarget().Position, 0, 0, false, false)) or npc:HasEntityFlags(1<<9) or npc:HasEntityFlags(1<<11) or npc:HasEntityFlags(1<<24) then
	local target = npc:GetPlayerTarget()
	local d = npc:GetData()
	local path = npc.Pathfinder
	local dist = target.Position:Distance(npc.Position)
	local gin = Game():GetRoom():GetGridIndex
(npc.Position + Vector.FromAngle((npc.Velocity):GetAngleDegrees()):Resized(5+npc.Size))
	local gen = Game():GetRoom():GetGridEntity(gin)
	local FindTarget
npc.Velocity = npc.Velocity * slide
			if not d.straightA then
d.straightA = npc.FrameCount - count
			end
		if npc:HasEntityFlags(1<<9) then
	if npc.FrameCount % 13 == 0 or npc:CollidesWithGrid() then
d.angle = screamerrng:RandomInt(360)
	end
		else
d.angle = (target.Position - npc.Position):GetAngleDegrees()
		end
if npc.State <= 2 and npc:CollidesWithGrid() then
npc:AddVelocity(Vector.FromAngle(d.angle):Resized(speed))
end
if (dist >= 700 or npc.FrameCount <= d.straightA + count
or not path:HasPathToPos(target.Position, false))
and not npc:HasEntityFlags(1<<9) and not npc:HasEntityFlags(1<<11)
and not npc:HasEntityFlags(1<<24) then
path:FindGridPath(target.Position, speed*1.4, 900, false)
elseif (dist < 700 and npc.FrameCount > d.straightA + count
and path:HasPathToPos(target.Position, false))
or dist < 70 or npc:HasEntityFlags(1<<11) or npc:HasEntityFlags(1<<24) then
if dist <= 450 and (npc:HasEntityFlags(1<<11) or npc:HasEntityFlags(1<<24)) then
npc:AddVelocity(Vector.FromAngle(-d.angle):Resized(speed))
else
npc:AddVelocity(Vector.FromAngle(d.angle):Resized(speed))
end
if gen then
if gen:GetType() >= 2 and gen:GetType() ~= 10 and gen:GetType() ~= 19
and gen:GetType() ~= 20 then
d.straightA = npc.FrameCount
end
end
if npc:CollidesWithGrid() then
d.straightA = npc.FrameCount
npc.Velocity = Vector(0,0)
		end
	end
				return FindTarget
		end
	end

function mod:screamermod(npc)
if npc.Type == 985 and npc.Variant == 433 then
if repentanceeternaledition == 1 and npc.SpawnerType ~= 985 and Eterepmonsters == 1 and npc.FrameCount <= 1 and ((EternalMonstersLimit == 0 and screamerrng:RandomInt(100)+1 <= ReplaceChanceMonster0) or (EternalSpawn == 0 and EternalMonstersLimit >= 1 and screamerrng:RandomInt(100)+1 <= ReplaceChanceMonster1) or (EternalSpawn == 1 and EternalMonstersLimit >= 2 and screamerrng:RandomInt(100)+1 <= ReplaceChanceMonster2) or (EternalSpawn == 2 and EternalMonstersLimit >= 3 and screamerrng:RandomInt(100)+1 <= ReplaceChanceMonster3) or (EternalSpawn == 3 and EternalMonstersLimit >= 4 and screamerrng:RandomInt(100)+1 <= ReplaceChanceMonster4)) then
npc:Morph(985, 433, 85, -1)
npc.HitPoints = npc.MaxHitPoints
npc.Scale = 1.25
end
if npc.SpawnerType == 985 and npc.I1 ~= 10 then
npc.I1 = 10
end
if npc:GetSprite():IsFinished("Death") then
npc:Kill()
end
if npc:GetSprite():IsPlaying("Death") then
npc.Velocity = Vector(0,0)
end
if npc.SubType == 85 and npc.HitPoints <= npc.MaxHitPoints * 0.5 and npc.I1 == 0 and npc.FrameCount >= 20 and not npc:HasEntityFlags(1<<9) and not npc:HasEntityFlags(1<<11) and not npc:HasEntityFlags(1<<24) then
npc.I1 = 3
npc:GetSprite():Play("Scream",false)
end
if npc.SubType == 85 and npc:GetPlayerTarget().Position:Distance(npc.Position) >= 100 and npc.HitPoints <= npc.MaxHitPoints * 0.5 and npc.I1 == 2 and npc.FrameCount % 18 == 10 and screamerrng:RandomInt(4)+1 == 2 and npc.FrameCount >= 20 and not npc:HasEntityFlags(1<<9) and not npc:HasEntityFlags(1<<11) and not npc:HasEntityFlags(1<<24) then
npc.I1 = 3
npc:GetSprite():Play("Scream",false)
end
if npc:GetPlayerTarget().Position:Distance(npc.Position) <= 100 and npc.I1 == 0 and npc.FrameCount >= 20 and not npc:HasEntityFlags(1<<9) and not npc:HasEntityFlags(1<<11) and not npc:HasEntityFlags(1<<24) then
npc.I1 = 1
npc:GetSprite():Play("Scream",false)
end
if npc:GetSprite():IsFinished("Scream") and npc.I1 == 1 then
npc.I1 = 2
end
if npc:GetSprite():IsFinished("Scream") and npc.I1 == 3 then
npc.I1 = 2
end
if npc.I1 == 0 and npc.FrameCount >= 20 then
ScreamerChasePlayer(0.275, npc, 0.86, 75)
if npc.Velocity:GetAngleDegrees() >= 135 and npc.Velocity:GetAngleDegrees() < 180 then
npc:GetSprite():Play("WalkLeft",false)
end
if npc.Velocity:GetAngleDegrees() >= 45 and npc.Velocity:GetAngleDegrees() < 135 then
npc:GetSprite():Play("WalkDown",false)
end
if npc.Velocity:GetAngleDegrees() >= -45 and npc.Velocity:GetAngleDegrees() < 45 then
npc:GetSprite():Play("WalkRight",false)
end
if npc.Velocity:GetAngleDegrees() >= -135 and npc.Velocity:GetAngleDegrees() < -45 then
npc:GetSprite():Play("WalkUp",false)
end
if npc.Velocity:GetAngleDegrees() >= -180 and npc.Velocity:GetAngleDegrees() < -135 then
npc:GetSprite():Play("WalkLeft",false)
end
end
if npc.I1 == 1 then
npc.Velocity = npc.Velocity * 0.65
if npc:GetSprite():IsPlaying("Scream") and npc:GetSprite():GetFrame() % 8 == 7 and npc:GetSprite():GetFrame() < 40 then
Isaac.Spawn(1000, 164, 0, npc.Position, Vector(0,0), npc)
end
if npc:GetSprite():IsPlaying("Scream") and npc:GetSprite():GetFrame() == 2 then
npc:PlaySound(screamerscream, 0.4, 0, false, 1)
end
if npc:GetSprite():IsPlaying("Scream") then
	for i = 1,Game():GetNumPlayers() do
local player = Isaac.GetPlayer(i-1)
	if ((npc:GetSprite():GetFrame() >= 5 and npc:GetSprite():GetFrame() <= 26 and player.Position:Distance(npc.Position) <= npc:GetSprite():GetFrame()*8-40) or (npc:GetSprite():GetFrame() >= 26 and player.Position:Distance(npc.Position) <= 170)) then
	local spawn = Isaac.Spawn(985, 434, 0, Vector(0,-1000), Vector(0,0), npc)
spawn.SpriteScale = Vector(0,0)
spawn.Mass = 10000 + npc:GetSprite():GetFrame()
spawn.GridCollisionClass = EntityGridCollisionClass.GRIDCOLL_NONE
spawn:ClearEntityFlags(EntityFlag.FLAG_APPEAR)
spawn.EntityCollisionClass = EntityCollisionClass.ENTCOLL_NONE
spawn.EntityCollisionClass = EntityCollisionClass.ENTCOLL_ENEMIES
spawn.Parent = player
player.Velocity = Vector(0,0)
		end
	end
end
end
if npc.I1 == 2 and npc.FrameCount >= 20 then
ScreamerChasePlayer(0.6, npc, 0.86, 75)
if npc.Velocity:GetAngleDegrees() >= 135 and npc.Velocity:GetAngleDegrees() < 180 then
npc:GetSprite():Play("WalkLeftAngry",false)
	if math.random(120) < 5 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	--elseif math.random(120) > 115 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	end
end
if npc.Velocity:GetAngleDegrees() >= 45 and npc.Velocity:GetAngleDegrees() < 135 then
npc:GetSprite():Play("WalkDownAngry",false)
	if math.random(120) < 5 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	--elseif math.random(120) > 115 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	end
end
if npc.Velocity:GetAngleDegrees() >= -45 and npc.Velocity:GetAngleDegrees() < 45 then
npc:GetSprite():Play("WalkRightAngry",false)
	if math.random(120) < 5 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	--elseif math.random(120) > 115 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	end
end
if npc.Velocity:GetAngleDegrees() >= -135 and npc.Velocity:GetAngleDegrees() < -45 then
npc:GetSprite():Play("WalkUpAngry",false)
	if math.random(120) < 5 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	--elseif math.random(120) > 115 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	end
end
if npc.Velocity:GetAngleDegrees() >= -180 and npc.Velocity:GetAngleDegrees() < -135 then
npc:GetSprite():Play("WalkLeftAngry",false)
	if math.random(120) < 5 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	--elseif math.random(120) > 115 then npc:PlaySound(blabla, 0.4, 0, false, 1)
	end
end
end
if npc.I1 == 3 then
npc.Velocity = npc.Velocity * 0.65
if npc:GetSprite():IsPlaying("Scream") and npc:GetSprite():GetFrame() == 2 then
npc:PlaySound(screamerscream, 0.4, 0, false, 1)
end
if npc:GetSprite():IsPlaying("Scream") and npc:GetSprite():GetFrame() % 7 == 6 and npc:GetSprite():GetFrame() <= 35 and npc.I1 == 3 then
screamerangle = screamerrng:RandomInt(360)+1
local params = ProjectileParams()
params.FallingAccelModifier = -0.05
for i = 1,8 do
npc:FireProjectiles(npc.Position+Vector(0,-68), Vector.FromAngle(screamerangle+45*i):Resized(10), 0, params)
end
npc:PlaySound(178, 1, 0, false, 1)
end
end
if npc:IsDead() and npc.SpawnerType ~= 985 then
for i = 1,Game():GetNumPlayers() do
local player = Isaac.GetPlayer(i-1)
player:ClearEntityFlags(EntityFlag.FLAG_SLOW)
player.Color = Color(1,1,1,1,0,0,0)
screamerhittarget = 0
local spawn = Isaac.Spawn(npc.Type, npc.Variant, npc.SubType, npc.Position, Vector(0,0), npc)
spawn:GetSprite():Play("Death", true)
spawn:ClearEntityFlags(EntityFlag.FLAG_APPEAR)
spawn.EntityCollisionClass = EntityCollisionClass.ENTCOLL_NONE
npc:Remove()
end
end
end
if npc.Type == 985 and npc.Variant == 434 then
npc.Scale = 0
if npc.Parent ~= nil then
npc.Position = npc.Parent.Position
npc.Parent:SetColor(Color(0.5,0.5,0.5,1,0,0,0),1,1,false,false)
npc.Parent.Velocity = npc.Parent.Velocity * 0.79
end
if npc.Parent == nil or #Isaac.FindByType(985, 433, -1, false, true) == 0 then
npc:Remove()
end
end
end
mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.screamermod);

function mod:EterepBulbCollideWithPlayer(npc, npc2)
if npc.Variant == 434 and npc2.Type == 985 and npc2.Variant == 434 and npc.Mass >= npc2.Mass then
npc:Remove()
end
end
mod:AddCallback(ModCallbacks.MC_PRE_NPC_COLLISION, mod.EterepBulbCollideWithPlayer, 985)

function mod:screamerspecialfunctions()
local entities = Isaac.GetRoomEntities()
for i = 1, #entities do
if entities[i].Type == 9 and entities[i].SpawnerType == 985 and entities[i].SpawnerVariant == 433 and entities[i].FrameCount <= 1 then
entities[i].DepthOffset = 100
end
if entities[i].Type == 9 and entities[i].SpawnerType == 985 and entities[i].SpawnerVariant == 433 and entities[i].FrameCount == 5 then
entities[i].DepthOffset = 0
end
end
if EterepCustomAngle >= 1 and repentanceeternaledition ~= 1 then
repentanceeternaledition = 1
end
end
mod:AddCallback(ModCallbacks.MC_POST_UPDATE , mod.screamerspecialfunctions)
