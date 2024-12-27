if not um.property.apartments then return end

if GetResourceState('sn_properties') ~= 'started' then return end

Debug('sn_properties ready for apartment list')

UM_apartments = {
    ['Alta St'] = {
        type = 'apartment6',
        coords = vector4(-230.43, -1026.65, 39.73, 28.46),
        text = 'Alta St',
        image = 'https://files.fivemerr.com/images/d618a25e-2f88-47c5-b065-515cbd34cb3f.png',
        features = {
            beds = 'Studio',
            bath = '1 ba',
            sqft = '800 sqft'
        },
        desc =
        'A basic residence that provides essential amenities, suitable for those who prioritize budget over luxury.',
        star = 3,
        tag = "rent"
    },
}