---@class TextUIOptions
---@field position? 'right-center' | 'left-center' | 'top-center' | 'bottom-center';
---@field icon? string | {[1]: IconProp, [2]: string};
---@field iconColor? string;
---@field style? string | table;
---@field alignIcon? 'top' | 'center';

local isOpen = false
local currentText

---@param text string|nil
---@param additionalText string|nil
---@param options? TextUIOptions
function lib.showTextUI(text, additionalText, options)
    -- Combine text and additionalText if needed
    local pressText, displayText

    if additionalText then
        pressText = text or ""  -- Use the first parameter as pressText
        displayText = additionalText -- Use the second parameter as displayText
    else
        -- Fallback to parsing text as a single input
        pressText, displayText = text:match('%[([%w%s]+)%]%s*%-%s*(.+)')
        pressText = pressText or text -- Default to full text if no match
        displayText = displayText or ""
    end

    if currentText == (pressText .. displayText) then return end

    options = options or {}
    options.pressText = pressText
    options.text = displayText

    currentText = pressText .. displayText
    isOpen = true

    exports['erp_prompts']:showPrompt({
        pressText = options.pressText,
        text = options.text
    })
end

function lib.hideTextUI()
    if not isOpen then return end

    exports['erp_prompts']:hidePrompt()
    isOpen = false
    currentText = nil
end

---@return boolean, string | nil
function lib.isTextUIOpen()
    return isOpen, currentText
end
