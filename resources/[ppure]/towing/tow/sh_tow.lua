TowVehicles = {
	[`towtruck2`] = true,
	[`flatbed`] = true,
	[`flatbed2`] = true,
	[`flatbed3`] = true,
	[`flatbedm2`] = true,
	[`towtruck`] = true
}

Impounds = {

	{
		id = 'lossantos',
		center = vector3(402.36, -1631.82, 29.28),
		box = {
			[1] = {
				[1] = vector3(393.8, -1635.1, 28.30),
				[2] = vector3(402.84, -1624.31, 28.30),
			},
			[2] = {
				[1] = vector3(402.84, -1624.31, 28.30),
				[2] = vector3(409.35, -1629.49, 28.30),
			},
			[3] = {
				[1] = vector3(400.27, -1640.36, 28.30),
				[2] = vector3(393.8, -1635.1, 28.30),
			},
			[4] = {
				[1] = vector3(400.27, -1640.36, 28.30),
				[2] = vector3(409.35, -1629.49, 28.30),
			}
		},
		spots = {
			vector4(410.0, -1639.99, 29.28, 48.19),
			vector4(411.73, -1637.08, 29.28, 51.02),
			vector4(409.09, -1674.63, 29.15, 138.9),
			vector4(396.22, -1594.3, 29.16, 48.19),
			vector4(403.81, -1651.12, 29.28, 226.77),
			vector4(462.65, -1686.78, 29.28, 45.35)
		}
	},
    {
        id = 'sandyshores',
        center = vector3(433.07, 3522.60, 33.64),
        box = {
            [1] = {
                [1] = vector3(436.04, 3525.55, 32.6),
                [2] = vector3(427.38, 3524.72, 32.7),
            },
            [2] = {
                [1] = vector3(427.38, 3524.72, 32.7),
                [2] = vector3(428.04, 3519.35, 32.8),
            },
            [3] = {
                [2] = vector3(428.04, 3519.35, 32.8),
                [1] = vector3(436.76, 3520.31, 32.7),
            },
            [4] = {
                [1] = vector3(436.76, 3520.31, 32.7),
                [2] = vector3(436.04, 3525.55, 32.6),
            }
        },
        spots = {
            vector4(449.87, 3523.95, 33.54, 95.83),
            vector4(436.87, 3518.39, 33.78, 96.79),
            vector4(432.34, 3528.60, 33.56, 94.26),
        }
    }

}

function IsVehicleTow(vehicle)
	return TowVehicles[GetEntityModel(vehicle)]
end

function GetImpound(id)

	for i=1, #Impounds do
		if Impounds[i].id == id then return Impounds[i] end
	end

end

function GetClosestImpound(coords)

	for i=1, #Impounds do
		if #(Impounds[i].center - coords) < 100.0 then
			return Impounds[i]
		end
	end

end
