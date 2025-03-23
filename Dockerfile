FROM python:3.12-slim

WORKDIR /app

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends locales && \
    rm -rf /var/lib/apt/lists/*
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential curl && \
    rm -rf /var/lib/apt/lists/*

ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8 \
    TZ=Asia/Tokyo \
    TERM=xterm

# Poetry 1.8.4 のインストール
RUN curl -sSL https://install.python-poetry.org | POETRY_VERSION=1.8.4 python3 -

# PATHを更新
ENV PATH="/root/.local/bin:$PATH"

# Poetryの設定: 仮想環境を作成しない
RUN poetry config virtualenvs.create false

# pyproject.tomlとpoetry.lockをコピー
COPY pyproject.toml poetry.lock* ./

# 依存関係のインストール
RUN poetry install --only main

# Jupyterのポートを公開
EXPOSE 8888

# 作業ディレクトリの設定
VOLUME /app/notebooks
WORKDIR /app/notebooks

# Jupyterを起動
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]