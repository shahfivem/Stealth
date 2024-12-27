Config = {
    ped = {
        model = 's_m_m_highsec_01',            -- Ped model
        position = vector3(263.13, 2591.93, 44.93), -- Ped location
        heading = 184.84,                       -- Ped heading
    },

    exchange = {
        itemsRequired = {
            { name = 'catalytic_converter', count = 1, reward = { name = 'loosenotes', count = math.random(8, 12) } },
            { name = 'chop_gps',            count = 1, reward = { name = 'loosenotes', count = math.random(1, 1) } },
            { name = 'chop_speaker',        count = 1, reward = { name = 'loosenotes', count = math.random(1, 5) } },
            { name = 'chop_hqrim',          count = 1, reward = { name = 'loosenotes', count = math.random(1, 4) } },
            { name = 'chop_stereo',         count = 1, reward = { name = 'loosenotes', count = math.random(1, 1) } },
            { name = 'chop_sub',            count = 1, reward = { name = 'loosenotes', count = math.random(1, 2) } },
            { name = 'chop_lqrim1',         count = 1, reward = { name = 'loosenotes', count = math.random(1, 4) } },
            { name = 'fakeplate',           count = 1, reward = { name = 'loosenotes', count = math.random(1, 1) } },
            { name = 'cryptousb',           count = 1, reward = { name = 'loosenotes', count = math.random(1, 6) } },

        },
    }
}
