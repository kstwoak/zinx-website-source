# zinx-website-source



## 该项目是 zinx 官网的文件源


## 修改zinx官网流程

1、获取代码
```bash
git clone https://github.com/kstwoak/zinx-website-source.git
cd zinx-website-source
```

2、安装nvm

linux：
```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash   (推荐)

source ~/.bashrc


```

windows：
```bash 
https://github.com/coreybutler/nvm-windows/releases
```

3、安装npm

```bash
nvm install 12.22.2
# 版本最好是12的版本太高了生成出来的静态文件没有内容。
```

4、安装依赖
```bash
#hexo
npm install -g hexo-cli
#
npm install --save hexo-renderer-sass
npm install --save node-sass

#hexo git部署支持
npm install --save hexo-deployer-git
```

5、检查插件是否正常
```bash

$ npm ls --depth 0
#正常显示
hexo-site@0.0.0 D:\建站\zinx\hexonew\hexo-documentation\zinx-website-origin
+-- @upupming/hexo-renderer-markdown-it-plus@2.0.2
+-- hexo@3.3.7
+-- hexo-deployer-git@3.0.0
+-- hexo-generator-archive@0.1.4
+-- hexo-generator-category@0.1.3
+-- hexo-generator-index@0.2.1
+-- hexo-generator-tag@0.2.0
+-- hexo-renderer-ejs@0.2.0
+-- hexo-renderer-markdown-it-plus@1.0.4
+-- hexo-renderer-sass@0.4.0
+-- hexo-renderer-stylus@0.3.3
`-- hexo-server@0.2.1

如果不正常就是npm进行装，例如：
npm install hexo-generator-archive --save

```


5、生成静态文件
```bash
 hexo generate --debug
```

6、本地运行
```bash
hexo server 
```

7、远程部署
```
hexo deploy
```

## 创建问题
### 安装hexo-renderer-sass时报错
问题：
使用hexo搭建博客时，需安装hexo-renderer-sass：
```bash
$ npm install hexo-renderer-sass
```
解决:
改用淘宝镜像：
```bash
$ npm install -g cnpm --registry=https://registry.npm.taobao.org
$ npm config set registry https://registry.npm.taobao.org
```
再次安装：
```bash
$ cnpm install hexo-renderer-sass --save
```

## 依赖文献
模板来源：https://segmentfault.com/a/1190000010065946
hexo中文官网： https://hexo.io/zh-cn/docs/
hexo-markdown渲染工具介绍：https://blog.csdn.net/qq_36667170/article/details/105846999
hexo-sass的git与文档：https://github.com/sass/node-sass