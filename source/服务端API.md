---
layout: default
id: 服务端API
title: 服务端API
prev: 架构介绍.html
next: 客户端API.html
---

#### server
基于Zinx框架开发的服务器应用，主函数步骤比较精简，最多只需要3步即可。
1. 创建server句柄
2. 配置自定义路由及业务
3. 启动服务

```go
func main() {
	//1 创建一个server句柄
	s := znet.NewServer()

	//2 配置路由
	s.AddRouter(0, &PingRouter{})

	//3 开启服务
	s.Serve()
}
```

其中自定义路由及业务配置方式如下：
```go
import (
	"fmt"
	"github.com/aceld/zinx/ziface"
	"github.com/aceld/zinx/znet"
)

//ping test 自定义路由
type PingRouter struct {
	znet.BaseRouter
}

//Ping Handle
func (this *PingRouter) Handle(request ziface.IRequest) {
	//先读取客户端的数据
	fmt.Println("recv from client : msgId=", request.GetMsgID(), ", data=", string(request.GetData()))

    //再回写ping...ping...ping
	err := request.GetConnection().SendBuffMsg(0, []byte("ping...ping...ping"))
	if err != nil {
		fmt.Println(err)
	}
}
```

### I.服务器模块Server
```go
  func NewServer () ziface.IServer 
```
创建一个Zinx服务器句柄，该句柄作为当前服务器应用程序的主枢纽，包括如下功能：

#### 1)开启服务
```go
  func (s *Server) Start()
```
#### 2)停止服务
```go
  func (s *Server) Stop()
```
#### 3)运行服务
```go
  func (s *Server) Serve()
```
#### 4)注册路由
```go
func (s *Server) AddRouter (msgId uint32, router ziface.IRouter) 
```
#### 5)注册链接创建Hook函数
```go
func (s *Server) SetOnConnStart(hookFunc func (ziface.IConnection))
```
#### 6)注册链接销毁Hook函数
```go
func (s *Server) SetOnConnStop(hookFunc func (ziface.IConnection))
```
### II.路由模块

```go
//实现router时，先嵌入这个基类，然后根据需要对这个基类的方法进行重写
type BaseRouter struct {}

//这里之所以BaseRouter的方法都为空，
// 是因为有的Router不希望有PreHandle或PostHandle
// 所以Router全部继承BaseRouter的好处是，不需要实现PreHandle和PostHandle也可以实例化
func (br *BaseRouter)PreHandle(req ziface.IRequest){}
func (br *BaseRouter)Handle(req ziface.IRequest){}
func (br *BaseRouter)PostHandle(req ziface.IRequest){}
```


### III.链接模块
#### 1)获取原始的socket TCPConn
```go
  func (c *Connection) GetTCPConnection() *net.TCPConn 
```
#### 2)获取链接ID
```go
  func (c *Connection) GetConnID() uint32 
```
#### 3)获取远程客户端地址信息
```go
  func (c *Connection) RemoteAddr() net.Addr 
```
#### 4)发送消息
```go
  func (c *Connection) SendMsg(msgId uint32, data []byte) error 
  func (c *Connection) SendBuffMsg(msgId uint32, data []byte) error
```
#### 5)链接属性
```go
//设置链接属性
func (c *Connection) SetProperty(key string, value interface{})

//获取链接属性
func (c *Connection) GetProperty(key string) (interface{}, error)

//移除链接属性
func (c *Connection) RemoveProperty(key string) 
```
