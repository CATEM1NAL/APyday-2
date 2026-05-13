# FAQ
This page contains simple answers to common issues or questions you might have.  
More in-depth information can be found at the [wiki](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/wiki).

### Index:
1. [World Fails To Generate / Can't Find The Client](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#the-world-doesnt-generatei-cant-find-the-client)
3. [When To Update](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#is-it-safe-for-me-to-update-the-mod-in-the-middle-of-a-multiworld)
4. [DLC Compatibility](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#does-this-include-dlc)
5. [Mod Compatibility](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#what-mods-is-this-compatible-with)
   - [HUD Compatibility](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#which-custom-huds-are-compatible)
6. [VR Compatibility](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#does-this-work-in-vr)
7. [Multiplayer Compatibility](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#is-this-multiplayer)
12. [Difficulty Scaling](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#the-mod-is-too-easyhard)
13. [Mutator Modes](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#i-dont-like-the-mutators)
14. [Heist Whitelist](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#i-keep-getting-heist-and-it-sucks)
15. [Misc. Issues](https://github.com/CATEM1NAL/PD2-Criminal-Dawn/blob/main/FAQ.md#i-keep-getting-heist-and-it-sucks)

## The world doesn't generate/I can't find the client.
Make sure you have the [0.6.7 launcher](https://github.com/ArchipelagoMW/Archipelago/releases/latest)!
If you're trying to generate a solo world and it's failing, try it a couple of times. It sometimes
fails when generating alone, but if you can't get it to generate at all then your YAML settings might
be incompatible.

## Is it safe for me to update the mod in the middle of a multiworld?
Hotfixes will always be safe to download, but minor releases will be incompatible (e.g.
updating to 0.6.x while playing a world created on 0.5.x will likely crash).

## Does this include DLC?
All DLC that you verifiably own is accounted for by the mod, and it automatically adds the corresponding
content into the appropriate pools.

## What mods is this compatible with?
As long as it isn't a gameplay overhaul or a mod that adds new content (new weapons, new heists, etc)
it should work fine! Custom weapons will probably be available from the start, and custom heists just
won't appear at all.

The world has built in support for BigLobby, but in my testing it seemed a little unstable.
I left it in as an option in the YAML since it *is* pretty neat, even if a little broken. I don't
recommend it as a serious option though.

## Does this work in VR?
No idea! Feel free to give it a shot and tell me how it goes, but realistically it *should* work?
The VR exclusive skill/perk bonuses are not part of this mod, but if QuickMenu works in the VR version
then the mod should be fully playable.

## Is this multiplayer?
Yes! As long as everyone that wants to play together connects to the same multiworld slot, you
can play multiplayer just fine. Players on different slots can't crossplay due to potential issues
with goal conflicts.

## The mod is too easy/hard!
Go to `Options > Mod Options > Criminal Dawn` in-game and you can change the difficulty cap. The difficulty
increases towards the cap as you progress through a run and receive items.

## I don't like the mutators.
Go to `Options > Mod Options > Criminal Dawn` in-game and you can change the mutator mode. There are
four options:
- **Off:** No random mutators will generate. Cloaker Arrest, Friendly Fire (Hard+), and Winters' Shields (Death Wish+) will still be enabled.
- **On:** Number of mutators will scale with heist number (1 mutator for first heist, 2 for second heist, etc).
- **On + Scaling (default):** Number of mutators will also scale with items received in the same way as difficulty.
- **Inverted Scaling:** Number of mutators will start maxed out (based on difficulty setting), but _decrease_ as you receive items.

## I keep getting [heist] and it sucks.
Go to `Options > Mod Options > Criminal Dawn` in-game and you can stop any heist from appearing in a run.
You can do this at any time, but if the game has already picked a heist you need to play it first.

I'd recommend only disabling the heists you *really* don't like, as disabling too many will limit
the available pool which may negatively impact the experience. Disabling every heist will also cause
the game to crash on heist generation, so uh... don't do that.

Disabling heists has no effect during campaign runs.

### What tiers are the stealth only heists in?
**Tier 1:** Car Shop.  
**Tier 3:** Shadow Raid.  
**Tier 4:** Murky Station & Yacht Heist.  
**Tier 5:** Breakin' Feds.

## I'm playing but nothing is happening.
Did you connect to a different multiworld while in a lobby? In this case the game will allow you
to keep playing, but you won't be able to make any progress or receive any items. Always restart
the game after connecting to a new multiworld.

## I'm trying to connect to a multiworld, but it disconnects instantly.
Check the client! If something is going horribly wrong, it should tell you the reason. If nothing
is happening then something is going *horribly* wrong.
