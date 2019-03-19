# mrubyc-esp32-threadsample

## Requirement
* 動作確認済みOS : [Ubuntu 18.04 LTS 日本語 Remix(64bit)](https://www.ubuntulinux.jp/News/ubuntu1804-ja-remix)

## Install
			
### mrubyをインストールする

（準備中）
			
### サンプルソースファイルのプロジェクトを作成する
1. このサンプルソースファイル一式をクローンする  
　git clone --recursive https://github.com/bigw00d/mrubyc-esp32-threadsample.git  
1. mrubycをクローンする  
　cd mrubyc-esp32-threadsample/components  
　git clone --recursive https://github.com/mrubyc/mrubyc.git
1. 念のためにmrubycを動作確認済みバージョンにする(不要かもしれない)  
　git checkout 2da0310580e673ddf03cf369da3ab21bf387400c  
1. プロジェクトを作成する  
　cd ../  
　./newproject.sh thread-sample  
  ※「thread-sample」の部分は任意のプロジェクト名で良い
			
## Usage
### 実機へのプログラム書き込んでモニターを開始する
1. make　※1
1. make flash
1. make monitor　※2

  ※1:  
    初回の実行時に設定画面が出てくるが、COMポートはそのままで良いはずなので、EXITを選択してその画面を閉じればよい  
    （それ以降でコンフィグを変更したい場合は「make menuconfig」を実行する)

  ※2:  
    終了する際は「Ctrl+]」を入力する  
