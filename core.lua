local weapon_dt = {"pistol", "smg", "rifle", "shotgun", "asniper", "lmg",};
local curr_dt, hist_dt, lp, lp_wt = false, false, nil, nil;
callbacks.Register("CreateMove", "DT Movement Fix", function()
    lp = entities.GetLocalPlayer();
    lp_wt = lp:GetWeaponType();
    curr_dt = (weapon_dt[lp_wt] ~= nil and gui.GetValue("rbot.accuracy.weapon." .. weapon_dt[lp_wt] .. ".doublefire") ~= 0 or false);
    if curr_dt == true then
        hist_dt = true;
    elseif curr_dt == false and hist_dt == true then
        if math.sqrt(lp:GetPropFloat("localdata", "m_vecVelocity[0]")^2 + lp:GetPropFloat("localdata", "m_vecVelocity[1]")^2) == 0 then
            hist_dt = false;
        end;
    end;
    gui.SetValue("misc.fakelag.enable", not hist_dt);
end);
