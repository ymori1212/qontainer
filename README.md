# Qontainer
A Docker-based development environment for learning quantum computing with Qiskit.
Qiskit を使って量子計算の学習を行うための、Dockerベースの開発環境です。

## このリポジトリでできること
- Docker で Qiskit + Jupyter Notebook の学習環境をすぐ立ち上げられます
- Qiskit サンプルコード付き（1量子ビット回路＋Bloch球表示）

## セットアップ手順（Docker がインストール済みであること）

```bash
# リポジトリをクローン
git clone https://github.com/ymori1212/qontainer.git
cd qontainer

# ビルド＆起動（初回は少し時間がかかります）
docker compose up --build
```

## アクセス
ブラウザで以下にアクセスしてください：
```bash
http://localhost:8888
```
Jupyter のトークン or パスワードは、起動時のログに表示されます。

## サンプルコード
```notebooks/01_hello_quantum.ipynb``` に、1量子ビットの簡単な回路と可視化例を載せています。