Locale = {
    ui = {
        ["go_back"] = "Go Back",
        ["call_sign"] = "Call Sign",
        ["call_sign_placeholder"] = "eg.: 333",
        ["name_input"] = "Name",
        ["name_input_placeholder"] = "eg.: Newbie",
        ["button_save"] = "Save",
        ["lock_button"] = "Lock",
        ["unlock_button"] = "Unlock",
        ["locked_status"] = "Locked",
        ["unlocked_status"] = "Unlocked",
        ["channel_is"] = "Channel is",
        ["invite_user"] = "Invite (User ID)",
        ["invite_button"] = "Invite",
        ["channel"] = "Channel",
        ["show_list"] = "Show List",
        ["change_signs"] = "Change Signs",
        ["lock_channel"] = "Lock Channel",
        ["settings"] = "Settings",
        ["change_button"] = "Change",
        ["disconnect"] = "Disconnect",
        ["toggle_frame_movement"] = "Toggle frame movement",
        ["color"] = "Color",
        ["size"] = "Size",
        ["volume"] = "Volume",
        ["press_enter_to_connect"] = "Press Enter to connect",
        ["turn_on_off"] = "Turn on/off",
        ["volume_up"] = "Volume Up",
        ["volume_down"] = "Volume Down",
        ["unknown"] = "Unknown",
        ["color_black"] = "Black",
        ["color_white"] = "White",
        ["color_blue"] = "Blue",
        ["color_green"] = "Green",
        ["color_red"] = "Red",
        ["color_yellow"] = "Yellow",
        ["radio_list"] = "Currently in radio",
        ["enable_external_list"] = "Show external list",
        ["disable_external_list"] = "Hide external list"
    },
    to_close_to_other_jammer = "You are too close to other jammer.",
    press_to_destroy = "Press [E] to destroy jammer",
    press_to_pickup = "Press [E] to pickup jammer",
    destroy_jammer = "Destroy jammer",
    pick_up_jammer = "Pick up jammer",
    joined_to_radio = 'You\'re connected to: %sMhz.',
    invalid_radio = 'This frequency is not available.',
    you_on_radio = 'You\'re already connected to this channel!',
    restricted_channel_error = 'You can not connect to this signal!',
    you_leave = 'You left the channel.',
    open_radio = 'Open radio',
    open_radio_list = 'Open quick radio join',
    radio_cannot_be_unlocked = "Radio cannot be unlocked.",
    radio_unlocked = "Radio unlocked",
    radio_cannot_be_locked = "Radio cannot be locked.",
    radio_locked = "Radio locked.",
    radio_cannot_invite = "Cannot invite to this radio.",
    radio_invited = "Invited to radio.",
    increase_radio_volume = 'The radio is already set to the lowest volume',
    volume_radio = 'New radio volume %s.',
    decrease_radio_volume = 'The radio is already set to maximum volume',
    size_updated = "Frame size updated!",
    frame_updated = "Color updated!",
    position_updated = "Frame position updated!",
    signs_updated = "Signs updated!"
}

setmetatable(Locale, {
    __index = function(self, key)
        if rawget(self, key) == nil then
            return ('Unknown key: %s'):format(key)
        end

        return rawget(self, key)
    end
})
