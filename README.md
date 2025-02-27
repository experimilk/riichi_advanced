# Riichi Advanced

![](title.png)

- Play now: <https://riichiadvanced.com/>
- Discord: <https://discord.gg/5QQHmZQavP>

Infinitely extensible mahjong web client featuring the following:

- Many base rulesets, including Riichi, Hong Kong Old Style, Sichuan Bloody, and Bloody 30-Faan Jokers. You can even play Riichi Mahjong with Saki powers!
- Support for 3-player modes like Sanma, and 2-player modes like Minefield!
- A variety of mods for each ruleset! Play with head bump, sequences wrapping from 9 to 1, a "ten" tile for each suit, and more!
- Multiplayer lobby system with public/private rooms! Invite your friends, or play against AI!
- Infinitely customizable ruleset! Change the rules by copying an existing ruleset, and play your modified ruleset directly in the client!

Join the [Discord](https://discord.gg/5QQHmZQavP) for development updates and bug reporting! (There are a lot of funny bugs, don't miss out!)

## Table of contents

- [Changelog](#changelog)
- [Supported rulesets](#supported-rulesets)
- [Custom rulesets](#custom-rulesets)
- [How can I contribute?](#how-can-i-contribute)
- [Developer information](#developer-information)
- [Running the server locally](#running-the-server-locally)
- [Acknowledgments](#acknowledgments)

## Changelog

- __3 Feb 2025__: v1.0.1:
  + Added documentation for SBR and Galaxy Mahjong (thanks Sophie)
  + Added `"save_tile_aliases"` and `"load_tile_aliases"` actions
  + Added kansai chiitoitsu mod
  + Added no tsumo loss mod
  + Added ability to join running games (though you still cannot view running games)
  + Added session tracking to mitigate disconnection issues (needs testing)
  + Fixed crash when checking if ankan changes your waits while in riichi.
  + Fixed crash in Singaporean when checking for multisided wait
  + Fixed crash when call buttons contain malformed actions
  + Fixed crash when navigating between pages
  + Fixed "unique" specifier for match definition
  + Fixed flowers being treated as calls
  + Fixed nagashi being achievable by a dead hand (Chombo mod)
  + Fix chanta not accepting honor sequences in space mahjong
  + Fix replacement tiles not being drawn from dead wall visually
- __1 Feb 2025__: v1.0.0: 17 rulesets, hundreds of mods, multiplayer, it's all there.

## Supported rulesets

- __Riichi__: The classic riichi ruleset, now with an assortment of mods to pick and choose at your liking.
- __Sanma__: Three-player Riichi.
- __Space Mahjong__: Riichi, but sequences can wrap (891, 912), and you can make sequences from winds and dragons. In addition, you can chii from any direction, and form open kokushi (3 han).
- __Cosmic Riichi__: A Space Mahjong variant with mixed triplets, more yaku, and more calls.
- __Galaxy Mahjong__: Riichi, but one of each tile is replaced with a blue galaxy tile that acts as a wildcard of its number. Galaxy winds are wind wildcards, and galaxy dragons are dragon wildcards.
- __Chinitsu__: Two-player variant where the only tiles are bamboo tiles. Try not to chombo!
- __Minefield__: Two-player variant where you start with 34 tiles to make a mangan+ hand, and your remaining tiles are your discards.
- __Sakicards v1.3__: Riichi, but everyone gets a different Saki power, which changes the game quite a bit. Some give you bonus han every time you use your power. Some let you recover dead discards. Some let you swap tiles around the entire board, including the dora indicator.
- __Hong Kong__: Hong Kong Old Style mahjong. Three point minimum, everyone pays for a win, and win instantly if you have seven flowers.
- __Sichuan Bloody__: Sichuan Bloody mahjong. Trade tiles, void a suit, and play until three players win (bloody end rules).
- __MCR__: Mahjong Competition Rules. Has a scoring system of a different kind of complexity than Riichi.
- __Taiwanese__: 16-tile mahjong with riichi mechanics.
- __Bloody 30-Faan Jokers__: Bloody end rules mahjong, with Vietnamese jokers, and somehow more yaku than MCR.
- __American (2024 NMJL)__: American mahjong. Assemble hands with jokers, and declare other players' hands dead.
- __Vietnamese__: Mahjong with eight differently powerful joker tiles.
- __Malaysian__: Three-player mahjong with 16 flowers, a unique joker tile, and instant payouts.
- __Singaporean__: Mahjong with various instant payouts and various unique ways to get penalized by pao.
- __Custom__: Create and play your own custom ruleset.

Each ruleset has optional mods like chombo and aotenjo, you'll have to check out each one to discover its variants!

## Custom rulesets

Once you enter the lobby or room for a ruleset you can scroll down to view the JSON object defining the ruleset.

If you're looking to make a custom ruleset using the game's JSON-based ruleset format, that documentation is available [here](documentation/documentation.md). To play a custom ruleset, simply select Custom on the main page, click Room Settings, and paste and edit your ruleset in the box provided.

## How can I contribute?

Mostly we need people to play and [report bugs](./issues), of which there are likely many. We also accept pull requests so if you see an [issue](./issues) you'd like to tackle, feel free to do so!

Also if you know of any English-based mahjong rulesets available online, do tell us in Discord and we'll add it to the list!

Monetary contributions are not accepted at this time.

## Developer information

This project is written in Elixir with the Phoenix framework, making heavy use of the LiveView library. Like all Phoenix projects, it has two moving parts:

- `lib/riichi_advanced`: Model
- `lib/riichi_advanced_web`: Combined View/Controller

Here is a breakdown of all the directories:

    ├── assets (node modules, js, css)
    ├── config (elixir project config)
    ├── documentation (all documentation linked in-game is here)
    ├── lib
    │   ├── delta (operational transform library)
    │   ├── ex_jq (jq binding library)
    │   ├── ex_smt (z3 binding library)
    │   ├── riichi_advanced (all application logic)
    │   │   ├── game (everything related to the game screen)
    │   │   ├── lobby (everything related to the lobby screen)
    │   │   ├── log (everything related to the log viewing screen)
    │   │   ├── messages (everything related to the messages panel)
    │   │   ├── room (everything related to the room screen)
    │   │   ├── application.ex (main thing! OTP root application/supervisor)
    │   │   ├── cache.ex (general-purpose ETS cache)
    │   │   ├── exit_monitor.ex (general-purpose disconnection monitor process)
    │   │   ├── mailer.ex (unused)
    │   │   ├── repo.ex (unused)
    │   │   └── session_supervisor.ex (DynamicSupervisor instance)
    │   └── riichi_advanced_web
    │       ├── components (stock Phoenix except for components/layouts/root.html.heex)
    │       ├── controllers (stock Phoenix)
    │       ├── views (all LiveViews and live components)
    │       ├── endpoint.ex (main thing! serves all the other files as plugs)
    │       ├── gettext.ex (unused)
    │       ├── router.ex (LiveView routes)
    │       └── telemetry.ex (unused)
    ├── priv
    │   ├── gettext (unused)
    │   ├── repo (unused)
    │   └── static
    │       ├── audio (all audio)
    │       ├── images (all spritesheets and svgs)
    │       ├── logs (save location for all logs)
    │       ├── mods (all mods)
    │       ├── rulesets (all rulesets)
    │       ├── favicon.ico
    │       └── robots.txt
    └── test (all tests)

## Running the server locally

First, install Elixir (≥ 1.14), `npm`, `z3`, and `jq`.

Then run:

    git clone "https://github.com/EpicOrange/riichi_advanced.git"
    cd riichi_advanced

    # Get Elixir dependencies
    mix deps.get

    # Generate self-signed certs for local https
    mix phx.gen.cert

    # Get Node dependencies
    (cd assets; npm i)

    # Start the server
    iex -S mix phx.server

This should start the server up at `https://localhost:4000`. (Make sure to use `https`! `http` doesn't work locally for some reason.) Phoenix should live-reload all your changes to Elixir/JS/CSS files while the server is running.

## Acknowledgments

Special thanks to the following sites for offering English-based rulesets:

- [Mahjong Pros](https://mahjongpros.com/)
- [Sloperama](https://www.sloperama.com/mahjongg/index.html)
- [Mahjong Picture Guide](www.mahjongpictureguide.com)

A big thank you to our beta testers on Discord:

- #yuriaddict
- 5𝔷ł𝔬𝔱𝔶𝔠𝔥-𝔨𝔲𝔫
- Anton00
- averyoriginalname
- BluePotion
- Buckwheat
- Caballo
- DragonRider JC
- GameRaccoon
- Glassy
- GOAT^
- Hyperistic
- JustKidding
- KlorofinMaster
- L_
- lorena.davletiar
- Miisuya
- Nehalem
- nilay
- schi
- Sophie
- stuf
- tomato
- UltimateNeutrino
- モカ妹紅（MochaMoko）
