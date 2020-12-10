function deepcopy(orig)
			local orig_type = type(orig)
			local copy
			if orig_type == 'table' then
				copy = {}
				for orig_key, orig_value in next, orig, nil do
					copy[deepcopy(orig_key)] = deepcopy(orig_value)
				end
				setmetatable(copy, deepcopy(getmetatable(orig)))
			else -- number, string, boolean, etc
				copy = orig
			end
			return copy
		end
		local l_cd = deepcopy(g_cellData)
-- 		local tpaa = {}
		l_cd.flags_n = {}
		l_cd.elevation_n = {}
		l_cd.tileId_n = {}
		l_cd.poi = {}
		
		 for j=l_cd.bounds.yMin,l_cd.bounds.yMax do
			 l_cd.flags_n[j-l_cd.bounds.yMin] = {}
			 l_cd.elevation_n[j-l_cd.bounds.yMin] = {}
			 l_cd.tileId_n[j-l_cd.bounds.yMin] = {}
			 l_cd.poi[j-l_cd.bounds.yMin] = {}
			 for i=l_cd.bounds.xMin,l_cd.bounds.xMax do
				l_cd.flags_n[j-l_cd.bounds.yMin][i-l_cd.bounds.xMin] = l_cd.flags[j][i]
				l_cd.elevation_n[j-l_cd.bounds.yMin][i-l_cd.bounds.xMin] = l_cd.elevation[j][i]
				l_cd.tileId_n[j-l_cd.bounds.yMin][i-l_cd.bounds.xMin] = l_cd.tileId[j][i]
-- 				--local tileId = getCellTileId( cellX, cellY )
 				local type = getPoiType( l_cd.tileId[j][i] )
				if type == nil or type == '' then type = 0 end
				l_cd.poi[j-l_cd.bounds.yMin][i-l_cd.bounds.xMin] = type
-- 				tpa[i - l_cd.bounds.xMin + 1] = type
-- 		--		file:write(i .."," .. j .. "," .. g_cellData.flags[j][i] .. "," .. type, .. "," .. g_cellData.elevation[j][i] .. "," .. g_cellData.cliffLevel[j][i])
 			end
 		end
		--l_cd.poi = tpaa
		l_cd.flags = l_cd.flags_n
		l_cd.elevation = l_cd.elevation_n
		l_cd.tileId = l_cd.tileId_n
		l_cd.flags_n = nil
		l_cd.elevation_n = nil
		l_cd.tileId_n = nil
		l_cd.cellDebug = nil
		l_cd.cornerDebug = nil
		l_cd.rotation = nil
		l_cd.tileOffsetX = nil
		l_cd.tileOffsetY = nil
		l_cd.cliffLevel = nil
		sm.json.save(l_cd,"$SURVIVAL_DATA/tst.json")
