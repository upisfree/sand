# Message types in multiplayer
First byte is a type *(in uint8, 0–255)*, the rest is a data.

### ping: 0
0 — ping type, **uint8**<br>
64 — random data, **uint8**