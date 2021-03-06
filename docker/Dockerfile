# ベースイメージ名:タグ名
FROM ubuntu:18.04
# FROM continuumio/anaconda3:2019.03

# install package
RUN apt-get update
RUN apt-get install -y python3-pip \
   git  \
   language-pack-ja-base \
   language-pack-ja

# set japanese local
RUN locale-gen en_US.UTF-8 
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# RUN pip install --upgrade pip && \
#     pip install autopep8 && \
#     pip install Keras && \
#     pip install tensorflow 

################################################################################

# Define working directory.
WORKDIR /root/

# Copy scripts to working directory.
COPY ./scripts/. /root/scripts/
RUN chmod -R +x /root/scripts/*

# pipをアップグレードし必要なパッケージをインストール
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install -r scripts/requirements.txt

# Overwrite entry point of parent image.
ENTRYPOINT []
################################################################################

# コンテナ側のリッスンポート番号
# EXPOSE 8888

# ENTRYPOINT命令はコンテナ起動時に実行するコマンドを指定（基本docker runの時に上書きしないもの）
# "jupyter-lab" => jupyter-lab立ち上げコマンド
# "--ip=0.0.0.0" => ip制限なし
# "--port=8888" => EXPOSE命令で書いたポート番号と合わせる
# ”--no-browser” => ブラウザを立ち上げない。コンテナ側にはブラウザがないので 。
# "--allow-root" => rootユーザーの許可。セキュリティ的には良くないので、自分で使うときだけ。
# "--NotebookApp.token=''" => トークンなしで起動許可。これもセキュリティ的には良くない。
# ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

# CMD命令はコンテナ起動時に実行するコマンドを指定（docker runの時に上書きする可能性のあるもの）
# "--notebook-dir=/workdir" => Jupyter Labのルートとなるディレクトリを指定
# CMD ["--notebook-dir=/workdir"]
CMD ["/bin/bash"]
