### Reset
# Reset the scoreboard vaules
scoreboard players set @s ticks 0
scoreboard players set @s seconds 0
scoreboard players set @s minutes 0
scoreboard players set @s hours 0
# Send a message to the player that died
tellraw @s ["",{"text":"You have died! Clock reset.","bold":true,"color":"red","underlined":true}]
