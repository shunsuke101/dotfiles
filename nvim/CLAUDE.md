# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概要

`~/dotfiles` 内の個人用 Neovim 設定。folke/lazy.nvim のスターターテンプレートをベースにした
最小構成で、`~/.config/nvim` へシンボリックリンクして使う想定（`~/dotfiles/.config -> ~/.config`）。
プラグインはまだ 1 つも定義されておらず、`lua/plugins/` は空の状態。

## アーキテクチャ

ロード順は以下の通り:

1. `init.lua` — leader キー（`<Space>` / localleader `\`）と基本オプション
   （`expandtab`, `shiftwidth`/`tabstop` = 2, `ignorecase` + `smartcase`, `termguicolors`）を設定し、
   最後に `require("config.lazy")` を呼ぶ。
2. `lua/config/lazy.lua` — lazy.nvim を `stdpath("data")/lazy/lazy.nvim` へブートストラップし、
   `require("lazy").setup({ spec = { { import = "plugins" } } })` を実行。
   `checker.enabled = true`（起動時に更新チェック）、`install.colorscheme = { "habamax" }`。
3. `lua/plugins/*.lua` — lazy.nvim が自動 import する。各ファイルはプラグインスペックの
   テーブル（または配列）を `return` する。現在は `telescope.lua` / `treesitter.lua`。
4. `colors/campbell.lua` — 自作カラースキーム（Windows Terminal の "Campbell" パレット）。
   `init.lua` 末尾の `vim.cmd.colorscheme("campbell")` で適用。`:terminal` の 16 色も設定する。

**拡張ポイントは `lua/plugins/` だけ。** プラグインの追加・設定は同ディレクトリに新しい `.lua` を
作って行う。`lua/config/lazy.lua` は原則いじらない。エディタのグローバルオプション追加は
`init.lua` に書く。

## 検証コマンド

設定を編集したら起動が壊れていないか確認する（Lint/テストのセットアップは無い）:

```sh
# 起動エラーの有無を確認（エラーがあれば stderr に出る）
nvim --headless -u init.lua +qa

# プラグインの同期（インストール／更新）をヘッドレス実行
nvim --headless "+Lazy! sync" +qa

# ヘルスチェック
nvim --headless "+checkhealth" +qa
```

Neovim 内では `:Lazy` でプラグイン管理 UI を開く。

## 注意点

- `init.lua` に既知のタイポがある: `vim.opt.clipboad`（正: `clipboard`）、
  `vim.g.maploaclleader`（正: `maplocalleader` — ただし `lua/config/lazy.lua` 側で正しく再設定される）。
  設定を触る際に合わせて直してよい。
- `lazy-lock.json` は未生成。プラグインを追加して `Lazy sync` すると生成されるので、
  再現性のためコミット対象に含める。
