### Setup
# Create objectives
scoreboard objectives add ticks dummy
scoreboard objectives add seconds dummy
scoreboard objectives add minutes dummy
scoreboard objectives add hours dummy
scoreboard objectives add ticks0 dummy
scoreboard objectives add seconds0 dummy
scoreboard objectives add minutes0 dummy
scoreboard objectives add hours0 dummy
scoreboard objectives add died deathCount

### Nonrendering prevention
# if the player does not have a score set, set it to 0
execute as @a unless entity @s[scores={hours=0..}] run scoreboard players set @s hours 0
execute as @a unless entity @s[scores={minutes=0..}] run scoreboard players set @s minutes 0
execute as @a unless entity @s[scores={seconds=0..}] run scoreboard players set @s seconds 0
execute as @a unless entity @s[scores={ticks=0..}] run scoreboard players set @s ticks 0

### Death Reset
# Reset the clock if the player has died
execute as @a if score @s died matches 1 run function stopwatch:reset_clock
execute as @a if score @s died matches 1 run scoreboard players set @s died 0

### Internal Logic
# Add 1 to ticks
scoreboard players add @a ticks 1
# If there are 20 ticks, reset and add 1 to seconds
execute as @a if score @s ticks matches 20 run scoreboard players add @s seconds 1
execute as @a if score @s ticks matches 20 run scoreboard players set @s ticks 0
# If there are 60 seconds, reset and add 1 to minutes
execute as @a if score @s seconds matches 60 run scoreboard players add @s minutes 1
execute as @a if score @s seconds matches 60 run scoreboard players set @s seconds 0
# If there are 60 minutes, reset and add 1 to hours
execute as @a if score @s minutes matches 60 run scoreboard players add @s hours 1
execute as @a if score @s minutes matches 60 run scoreboard players set @s minutes 0

### Extra Zeroes 
# Set the extra 0 scores to null if their respective scores are ten or more
execute as @a if entity @s[scores={hours=10..}] run scoreboard players reset @s hours0
execute as @a if entity @s[scores={minutes=10..}] run scoreboard players reset @s minutes0
execute as @a if entity @s[scores={seconds=10..}] run scoreboard players reset @s seconds0
execute as @a if entity @s[scores={ticks=10..}] run scoreboard players reset @s ticks0
# Set the extra 0 scores to 0 if their respective scores are NOT ten or more
execute as @a unless entity @s[scores={hours=9..}] run scoreboard players set @s hours0 0
execute as @a unless entity @s[scores={minutes=9..}] run scoreboard players set @s minutes0 0
execute as @a unless entity @s[scores={seconds=9..}] run scoreboard players set @s seconds0 0
execute as @a unless entity @s[scores={ticks=9..}] run scoreboard players set @s ticks0 0

### Rendering
# Display the actionbar
execute as @a run title @s actionbar ["",{"color":"dark_purple","underlined":true,"bold":true,"score":{"objective":"hours0","name":"@s"}},{"color":"dark_purple","underlined":true,"bold":true,"score":{"objective":"hours","name":"@s"}},{"color":"dark_purple","underlined":true,"bold":true,"text":":"},{"color":"dark_purple","underlined":true,"bold":true,"score":{"objective":"minutes0","name":"@s"}},{"color":"dark_purple","underlined":true,"bold":true,"score":{"objective":"minutes","name":"@s"}},{"color":"dark_purple","underlined":true,"bold":true,"text":":"},{"color":"dark_purple","underlined":true,"bold":true,"score":{"objective":"seconds0","name":"@s"}},{"color":"dark_purple","underlined":true,"bold":true,"score":{"objective":"seconds","name":"@s"}},{"color":"dark_purple","underlined":true,"bold":true,"text":":"},{"color":"dark_purple","underlined":true,"bold":true,"score":{"objective":"ticks0","name":"@s"}},{"color":"dark_purple","underlined":true,"bold":true,"score":{"objective":"ticks","name":"@s"}}]