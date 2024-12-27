if not um.property.apartments then return end

if GetResourceState('qbx_properties') ~= 'started' then return end

Debug('qbx_properties for apartments list ready', 'debug')

UM_apartments = {
    ['Del Perro Heights Apt'] = {
        type = '1',
        coords = vec4(-1397.8, -561.99, 48.59, 67.55),
        text = 'Del Perro Heights Apt',
        image = 'https://files.fivemerr.com/images/2fec38dd-47bc-41d8-b146-2a7e8e726039.png',
        features = {
            beds = '2',
            bath = '2',
            sqft = '2'
        },
        desc = 'Enjoy ocean views far away from tourists and bums on Del Perro Beach.',
        star = 4,
        tag = "rent"
    },
    ['Del Perro Heights Apt 2'] = {
        type = '2',
        coords = vec4(-1397.8, -561.99, 48.59, 67.55),
        text = 'Del Perro Heights Apt 2',
        image = 'https://files.fivemerr.com/images/2fec38dd-47bc-41d8-b146-2a7e8e726039.png',
        features = {
            beds = '2',
            bath = '2',
            sqft = '2'
        },
        desc =
        'A luxurious and prestigious residence, offering the finest amenities and a prime location for those who demand the best in urban living.',
        star = 5,
        tag = "rent"
    },
    ['4 Integrity Way Apt'] = {
        type = '3',
        coords = vec4(-84.06, -609.77, 41.74, 247.0),
        text = '4 Integrity Way Apt',
        image = 'https://files.fivemerr.com/images/a8646ecc-7025-4f6c-a667-afca3fc73d2e.png',
        features = {
            beds = 'St',
            bath = '1',
            sqft = '1'
        },
        desc = 'A comfortable and well-maintained apartment, offering a balance between convenience and affordability.',
        star = 3,
        tag = "rent"
    },
    ['4 Integrity Way Apt 2'] = {
        type = '4',
        coords = vec4(-69.14, -578.47, 44.0, 248.27),
        text = '4 Integrity Way Apt 2',
        image = 'https://files.fivemerr.com/images/2fec38dd-47bc-41d8-b146-2a7e8e726039.png',
        features = {
            beds = '1',
            bath = '1',
            sqft = '2'
        },
        desc =
        'An upscale dwelling featuring modern amenities and a desirable location, ideal for professionals and city enthusiasts.',
        star = 5,
        tag = "rent"
    },
    ['Richard Majestic Apt'] = {
        type = '5',
        coords = vec4(-953.85, -386.96, 41.58, 294.02),
        text = 'Richard Majestic Apt',
        image = 'https://files.fivemerr.com/images/a8646ecc-7025-4f6c-a667-afca3fc73d2e.png',
        features = {
            beds = 'St',
            bath = '1',
            sqft = '1'
        },
        desc =
        'A basic residence that provides essential amenities, suitable for those who prioritize budget over luxury.',
        star = 3,
        tag = "rent"
    },
    ['Tinsel Towers Apt'] = {
        type = '6',
        coords = vector4(-617.55, 5.74, 41.85, 359.29),
        text = 'Tinsel Towers Apt',
        image = 'https://files.fivemerr.com/images/a8646ecc-7025-4f6c-a667-afca3fc73d2e.png',
        features = {
            beds = 'St',
            bath = '1',
            sqft = '1'
        },
        desc =
        'A basic residence that provides essential amenities, suitable for those who prioritize budget over luxury.',
        star = 3,
        tag = "rent"
    },
}
