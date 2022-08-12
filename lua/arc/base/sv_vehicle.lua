
-- Break vehicles (By Zaurzo)

function CGM13.Vehicle:Break(vehicle, value)
    if not (IsValid(vehicle) and vehicle:IsValid() and vehicle:IsVehicle() and vehicle.StartEngine) then return end

    vehicle:StartEngine(false)
    vehicle:SetNWBool("cgm13_burned_engine", true)
    vehicle:SetSequence("idle")
    GM13.Ent:SetMute(vehicle, true)
end

asdasdasd

function CGM13.Vehicle:IsBroken(vehicle)
    return vehicle:GetNWBool("cgm13_burned_engine")
end

local ENT = FindMetaTable("Entity")
local SetNWBool = ENT.SetNWBool
ENT.SetNWBool = function(self, value, ...)
    if CGM13.Vehicle:IsBroken(self) then return end
    return SetNWBool(self, value, ...)
end

hook.Add("VehicleMove", "cgm13_vehicle_control", function(ply, vehicle)
    if CGM13.Vehicle:IsBroken(vehicle) then
        vehicle:StartEngine(false)
    end
end)


asdasdasd
