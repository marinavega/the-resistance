Dear Sargent Kyle Reese,
We appreciate the work you have done during all these years in The Resistance.
Your skills and knowledge of battle and weaponry are remarkable. That is why we
need your help to modify a model T-800 we just captured. As you well know
from your extensive experience, this is the first cybernetic organism that uses
living tissue on a metal skeleton.
Your mission will consist of reprogramming the objective selection
module. This module is responsible for selecting the next position to attack
given several possible attack positions. The cyborg control unit will
communicate via HTTP POST requests with your module, providing the data that
the vision module has collected.
The objective of the mission is to develop an HTTP endpoint that accepts
JSON data and returns JSON data.
This is an example of a request from the control unit to your module:
```
[
  {
    "attack-­mode": [
      "closest­-first"
    ],
    "radar": [
      {
        "position": {
          "x":0,
          "y":40
        },
        "targets": [
          {
            "type": "T1-­9",
            "damage": 80
          },
          {
            "type": "HK-­Tank",
            "damage": 20
          },
          {
            "type": "Human"
          }
        ]
      },
      {
        "position": {
          "x": 2,
          "y":60
        },
        "targets": [
          {
            "type":"T1­-9",
            "damage": 40
          }
        ]
      },
      ...
```

Given the previous request, your module should return a response like this:
`{ "position": { "x": 0, "y": 40 }, "targets": [ "T1­-9", "HK­-Tank" ] }`

The attack modes we have implemented are:

* `closest-first`: Attack the nearest areas.

* `furthest-first`: Attack the furthest areas.

* `avoid-crossfire`: Do not attack any area where any human is present.

* `priorize-t-x`: The attack must always priorize objectives of type T-X.

The types of objectives that the vision system will provide are:

* Human
* T1-9
* T7-T
* T-X
* HK-Airstrike
* HK-Bomber
* HK-Tank

Keep in mind that attack modes can be chained but you should not chain opposite
attack modes, like closest-first and furtherst-first. Example:
`[{ "attack-­mode": [ "closest­-first", "priorize­-t-­x" ], "radar": ...`

You must not forget that Skynet is building a new army of cyborgs, the system
should be prepared to add new attack modes.
