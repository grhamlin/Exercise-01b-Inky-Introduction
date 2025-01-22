/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Basic Choices
 - Knot structure
 - Recurring choices
 - Conditionals in descriptions
 - Conditionals in choices
 
 In the assignment:
 - Add four more knots (and feel free to change any of the example text, this is YOUR story)
 - Add at least one more conditional
*/


/*
This is how you structure basic choices and knots:
    == == are locations
    -> sends you to code of the choice
    END ends that storyline section
    [] removes the repeat of what the player chose
    + Allows the player to pick that same option again later
*/

-> cave_mouth


== cave_mouth ==
You are at the entrance to a cave. {not torch_pickup: There is a torch on the floor.} The cave extends to the east and west.
+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup
*{door_open} [Return home] -> END


== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.

+ {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel.
+ [Go Back] -> cave_mouth
+ [Approach the door] -> door
-> END

=== torch_pickup ===
You now have a torch.
* [Go Back] -> cave_mouth
-> END

=== east_tunnel_lit ===
The light of your torch glints off the thousands of coins in the room.
*[Pick up  a coin] -> coin_pickup
+[Continue East?] -> east_continued
+ {coin_pickup} [Go back] -> cave_mouth
-> END

=== coin_pickup ===
You now have the gold coin! It feels unusually heavy. 
*[Go  Back]  -> east_tunnel_lit


=== east_continued ===
You have reached a dead end.
+[Return  to cave entrance?] -> cave_mouth
*[Go back] -> east_tunnel_lit

=== door ===
The door is tall and made of wood. 
+ [Attempt to open] -> door_locked
+ {coin_pickup} [Put coin in door slot] -> door_open
+ [Go back] -> west_tunnel

=== door_locked ===
It doesn't budge.
+ [Go back] -> west_tunnel

=== door_open ===
You found the legendary Golden Shrimp Statue! 
*[Eat the statue and gain its powers?] -> ate_statue
*[Celebrate your victory and return to the entrance] -> cave_mouth

=== ate_statue ===
Not your smartest move, you died :(
-> END


