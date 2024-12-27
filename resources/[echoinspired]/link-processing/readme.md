# FiveM QBCore Item Processing System

This script provides an item processing system for FiveM using QBCore, allowing players to perform various tasks (e.g., heating, mixing, cooling) at specific locations, with the ability to check for required items and receive new items in return. The script uses the `lib` library for callbacks and notifications.

## Features

- Configurable locations for processing items
- Skill checks before processing
- Progress bars to indicate processing status
- Custom notifications using `lib.notify`
- Server and client scripts for handling item transactions

# Items Example

```lua
	['water'] = {
		label = 'Water',
		weight = 220,
		client = {
			status = { thirst = 200000 },
			anim = 'drinking',
			prop = 'water',
			usetime = 2500
		},
        server = {
            export = 'link-processing.water',
        }
	},
```